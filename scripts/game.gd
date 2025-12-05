class_name Game
extends Node2D


var bullets: Array[Bullet] = []
var time: float = 0

var beats: int = 0

var parries: int = 0
var deathbombs: int = 0
var session_length: int = 0

@onready var player: Node2D = $Player
@onready var boss: Boss = $Shiho
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var top_label: Label = $TopLabel


func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
	top_label.visible_ratio = 0
	boss.modulate = Color.WHITE
	
	boss.start(self)
	
	animation_player.play("difficulty")
	
	match Globals.DIFFICULTY:
		Globals.Difficulty.Easy:
			top_label.text = "Difficulty: Easy\nParry cooldown: 1s\nDeath parry: 1s"
		Globals.Difficulty.Normal:
			top_label.text = "Difficulty: Normal\nParry cooldown: 2.5s\nDeath parry: 0.4s"
		Globals.Difficulty.Hard:
			top_label.text = "Difficulty: Hard\nParry cooldown: 4s\nDeath parry: 0.2s"
		Globals.Difficulty.Lunatic:
			top_label.text = "Difficulty: Lunatic\nParrying disabled"
	
	
	await boss.audio_stream_player.finished
	if not player.dead:
		animation_player.play("win")

func _draw() -> void:
	for bullet: Bullet in bullets:
		bullet.draw_below(self)
		draw_texture(bullet.texture, bullet.position - Vector2((float(bullet.size) / 2), (float(bullet.size) / 2)))
		bullet.draw_above(self)


func _physics_process(delta: float) -> void:
	if Globals.paused:
		return

	process_bullets(delta)


func _process(delta: float) -> void:
	if not Globals.paused:
		time += delta
	
	queue_redraw()


func _on_shiho_beat() -> void:
	beats += 1
	$Lighting.color = Color.from_rgba8(255, 255, 255, 255)
	get_tree().create_tween().tween_property($Lighting, "color", Color.from_rgba8(255, 0, 0, 255), boss.seconds_per_beat / 2)


func _on_copy_pressed() -> void:
	var difficulty: String = ""
	
	match Globals.DIFFICULTY:
		Globals.Difficulty.Easy:
			difficulty = "Easy"
		Globals.Difficulty.Normal:
			difficulty = "Normal"
		Globals.Difficulty.Hard:
			difficulty = "Hard"
		Globals.Difficulty.Lunatic:
			difficulty = "Lunatic"
	
	var string: String = "Difficulty: %s\nParries: %s\nDeath parries: %s\nSesssion length: %ss" % [difficulty, parries, deathbombs, session_length]
	
	# Why are there separate ones for windows+linux and only linux?
	# Will the first one work incorrectly on linux? I'll just call both?
	DisplayServer.clipboard_set_primary(string)
	DisplayServer.clipboard_set(string)
	
	$Results/Center/Panel/Margin/VBox/Copy.text = "Copied!"


func process_bullets(delta: float) -> void:
	var to_erase: Array[Bullet]
	for bullet: Bullet in bullets:
		
		bullet.process(self, delta)
		
		if player:
			if bullet.collisions:
				if bullet.position.distance_to(player.position) <= ((float(bullet.size) / 2) + (6.0 / 2)):
					if player.parry_time > 0 and bullet.parryable and Globals.CAN_PARRY:
						# Parried
						parry_bullet(bullet)
					else:
						# Died
						Globals.paused = true
						AudioServer.add_bus_effect(0, AudioEffectHighPassFilter.new())
						
						var died_at: float = float(Time.get_ticks_usec()) / 1000000
						
						if bullet.parry_back:
							player.parry_back()
						
						if not player.parry_cooldown > 0:
							player.show_deathbomb()
						
						Globals.can_leave = false
						
						# This deathbomb code is horrendous
						# Theres most definitely a better way of doing this
						# But it works
						# Deathbomb
						while true:
							if not player.parry_cooldown > 0 and Globals.CAN_PARRY:
								player.show_deathbomb()
							
							if player.is_parrying() and bullet.parryable and Globals.CAN_PARRY:
								# Successful deathbomb
								player.hide_deathbomb()
								
								parry_bullet(bullet)
								deathbombs += 1
								
								Globals.paused = false
								AudioServer.remove_bus_effect(0, 0)
								
								Globals.can_leave = true
								break
							if float(Time.get_ticks_usec()) / 1000000 - died_at >= Globals.DEATHBOMB_TIME or not bullet.parryable or not Globals.CAN_PARRY:
								# Missed deathbomb
								player.hide_deathbomb()
								
								player.dead = true
								boss.moves_on = false
								top_label.visible_ratio = 1.0
								top_label.text = "You died!\n[Escape] to return"
								
								player.hitbox_sprite.modulate = Color.from_rgba8(128, 128, 128, 255)
								
								Globals.can_leave = true
								return
							await get_tree().process_frame
		
		bullet.position += bullet.velocity * delta
		
		# Out of bounds, delete bullet
		if bullet.position.x <= (56 - bullet.size / 2.0) or bullet.position.x >= (264 + bullet.size / 2.0) or bullet.position.y >= (240 + bullet.size / 2.0) or bullet.position.y <= (0 - bullet.size / 2.0):
			to_erase.append(bullet)
	
	for bullet_to_erase: Bullet in to_erase:
		bullets.erase(bullet_to_erase)


func play_sound(sound_name: String, volume_percentage: float = 100.0, pitch: float = 1.0) -> void:
	var audio_stream_player := AudioStreamPlayer.new()
	audio_stream_player.stream = Globals.sounds.get(sound_name)
	audio_stream_player.volume_linear = volume_percentage / 100
	audio_stream_player.pitch_scale = pitch

	add_child(audio_stream_player)
	audio_stream_player.play()
	
	await audio_stream_player.finished
	
	audio_stream_player.queue_free()


func parry_bullet(bullet: Bullet) -> void:
	parries += 1
	
	play_sound("PARRY", 25, 0.375)
	
	player.parry_end()
	
	if bullet.parry_back:
		player.parry_back()
	
	bullet.collisions = false
	bullet.velocity.y = -bullet.velocity.y


func set_results() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
	match Globals.DIFFICULTY:
		Globals.Difficulty.Easy:
			$Results/Center/Panel/Margin/VBox/Difficulty.text = "Difficulty: Easy"
		Globals.Difficulty.Normal:
			$Results/Center/Panel/Margin/VBox/Difficulty.text = "Difficulty: Normal"
		Globals.Difficulty.Hard:
			$Results/Center/Panel/Margin/VBox/Difficulty.text = "Difficulty: Hard"
		Globals.Difficulty.Lunatic:
			$Results/Center/Panel/Margin/VBox/Difficulty.text = "Difficulty: Lunatic"
	
	$Results/Center/Panel/Margin/VBox/Parries.text = "Parries: %s" % parries
	$Results/Center/Panel/Margin/VBox/Deathbombs.text = "Death parries: %s" % deathbombs
	session_length = int(round(Time.get_ticks_msec() / 1000.0))
	$Results/Center/Panel/Margin/VBox/Session.text = "Session length: %ss" % session_length
