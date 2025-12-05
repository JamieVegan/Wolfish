class_name First
extends Boss

var song: AudioStreamMP3 = preload("res://assets/sounds/Wolfish.mp3")


func _init() -> void:
	super()
	position = Vector2(160, 30)
	texture = Globals.textures.PLAYER


func ready(game: Game) -> void:
	var audio_stream_player := AudioStreamPlayer.new()
	audio_stream_player.stream = song
	game.add_child(audio_stream_player)
	audio_stream_player.play()


func aimed(game: Game) -> void:
	const FIRERATE: float = 0.15
	const SPEED: float = 120
	
	for i: int in range(4):
		# Aimed
		for n: int in range(10):
			var direction: Vector2 = -(game.boss.global_position - game.player.global_position)
			direction = direction.normalized() * SPEED
			
			game.bullets.append(Snowball.new(Vector2(160, 30), direction))
			await get_tree().create_timer(FIRERATE).timeout
		
		# Miss-aimed
		var left: bool = false
		for n: int in range(20):
			var direction: Vector2 = -(game.boss.global_position - game.player.global_position)
			direction = direction.normalized() * SPEED
			
			if left:
				direction.x += 25
			else:
				direction.x -= 25
			left = not left
			
			game.bullets.append(Snowball.new(game.boss.position, direction))
			await get_tree().create_timer(FIRERATE / 2).timeout
		
	
	#await get_tree().create_timer(2).timeout


func curved_walls(game: Game) -> void:
	for i: int in range(8):
		
		wall(game, Vector2(1, 0))
		
		await get_tree().create_timer(1, true, true).timeout
		
		wall(game, Vector2(0, 1), 2.0)


func wall(game: Game, start_at: Vector2, speed_multiplier: float = 1.0) -> void:
	const DEGREES_PER_BULLET: float = 2
	const SPEED: float = 60
	
	var degrees: float = 0
	
	for n: int in range(90 / DEGREES_PER_BULLET):
		degrees += DEGREES_PER_BULLET
		
		var bullet_position: Vector2 = game.boss.global_position
		
		var forward := start_at.rotated(deg_to_rad(degrees))
		var distance = 1.0
		
		var new_position: Vector2 = bullet_position + forward * distance
		
		var direction: Vector2 = -(game.boss.global_position - new_position)
		
		game.bullets.append(Snowball.new(game.boss.position, direction * SPEED * speed_multiplier))


func get_moveset() -> Array[String]:
	return ["ready", "aimed", "curved_walls", "aimed", "curved_walls"]


func get_moves() -> Dictionary[String, Callable]:
	return {
		"ready": ready,
		"aimed": aimed,
		"curved_walls": curved_walls
	}
