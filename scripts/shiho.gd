extends Boss

var moveset: Array[Dictionary] = [
	## 1
	{"start": 0, "length": 4 * 4, "function": aimed},
	{"start": 16, "length": 4 * 4, "function": misaimed},
	{"start": 32, "length": 4 * 4, "function": aimed},
	{"start": 48, "length": 4 * 4, "function": misaimed},
	
	{"start": 64, "length": 4 * 4, "function": aimed},
	{"start": 80, "length": 4 * 4, "function": misaimed},
	{"start": 96, "length": 4 * 4, "function": aimed},
	{"start": 112, "length": 4 * 4, "function": misaimed},
	
	{"start": 128, "length": 32 * 4, "function": curved_walls},
	
	{"start": 256, "length": 4 * 4, "function": aimed},
	{"start": 272, "length": 4 * 4, "function": misaimed},
	{"start": 288, "length": 4 * 4, "function": aimed},
	{"start": 304, "length": 4 * 4, "function": misaimed},
	
	{"start": 320, "length": 32 * 4, "function": curved_walls},
	
	## 2
	{"start": 448, "length": 14 * 4, "function": burst, "argument": 56},
	{"start": 504, "length": 1, "function": jumpscare},
	
	## Chorus
	#{"start": 512, "length": 4 * 32, "function": aimed},
	{"start": 512, "length": 32 * 4, "function": chorus},
	
	{"start": 520, "length": 1, "function": jumpscare, "argument": false},
	{"start": 520 + 2, "length": 1, "function": jumpscare, "argument": false},
	{"start": 520 + 2 + 2, "length": 1, "function": jumpscare, "argument": false},
	
	{"start": 558, "length": 1, "function": jumpscare, "argument": false},
	
	{"start": 584, "length": 1, "function": jumpscare, "argument": false},
	{"start": 584 + 2, "length": 1, "function": jumpscare, "argument": false},
	{"start": 584 + 2 + 2, "length": 1, "function": jumpscare, "argument": false},
	
	## Aimed again
	{"start": 640, "length": 4 * 4, "function": aimed},
	{"start": 656, "length": 4 * 4, "function": misaimed},
	{"start": 672, "length": 4 * 4, "function": aimed},
	{"start": 688, "length": 4 * 4, "function": misaimed},
	
	{"start": 704, "length": 4 * 4, "function": triple_aimed, "argument": false},
	{"start": 720, "length": 2 * 4, "function": triple_aimed, "argument": true},
	{"start": 728, "length": 1, "function": jumpscare},
	{"start": 734, "length": 32 * 4, "function": curved_walls},
	
	## Burst
	{"start": 864, "length": 28 * 4, "function": burst, "argument": 112},
	
	{"start": 984, "length": 1, "function": jumpscare},
	
	{"start": 1000, "length": 1, "function": jumpscare, "argument": false},
	{"start": 1000 + 2, "length": 1, "function": jumpscare, "argument": false},
	{"start": 1000 + 2 + 2, "length": 1, "function": jumpscare, "argument": false},
	{"start": 1004, "length": 116, "function": chorus},
	
	{"start": 1038, "length": 1, "function": jumpscare, "argument": false},
	
	{"start": 1064, "length": 1, "function": jumpscare, "argument": false},
	{"start": 1064 + 2, "length": 1, "function": jumpscare, "argument": false},
	{"start": 1064 + 2 + 2, "length": 1, "function": jumpscare, "argument": false},
	
	{"start": 1102, "length": 1, "function": jumpscare, "argument": false},
	
	
	# 1120
	# 1004
	{"start": 1248, "length": 32 * 4, "function": chordjack},
	{"start": 1248, "length": 32 * 4, "function": misaimed, "argument": true},
	
	# Music starts again
	{"start": 1422, "length": 4 * 100, "function": chorus, "argument": true},
	{"start": 1422, "length": 1, "function": jumpscare, "argument": false},
	
	{"start": 1448, "length": 1, "function": jumpscare, "argument": false},
	{"start": 1448 + 2, "length": 1, "function": jumpscare, "argument": false},
	{"start": 1448 + 2 + 2, "length": 1, "function": jumpscare, "argument": false},
	
	{"start": 1486, "length": 1, "function": jumpscare, "argument": false},
	
	{"start": 1502, "length": 1, "function": jumpscare, "argument": false},
	
	{"start": 1512, "length": 1, "function": jumpscare, "argument": false},
	{"start": 1512 + 2, "length": 1, "function": jumpscare, "argument": false},
	{"start": 1512 + 2 + 2, "length": 1, "function": jumpscare, "argument": false},
	
	{"start": 1534, "length": 1, "function": jumpscare, "argument": false},
	
	{"start": 1550, "length": 1, "function": jumpscare, "argument": false},
	
	{"start": 1566, "length": 1, "function": jumpscare, "argument": false},
	
	{"start": 1576, "length": 1, "function": jumpscare, "argument": false},
	{"start": 1576 + 2, "length": 1, "function": jumpscare, "argument": false},
	{"start": 1576 + 2 + 2, "length": 1, "function": jumpscare, "argument": false},
	
	{"start": 1598, "length": 1, "function": jumpscare, "argument": false},

	{"start": 1614, "length": 1, "function": jumpscare, "argument": false},
	
	# 1632: the oh oh ohs start
	{"start": 1632, "length": 1, "function": jumpscare, "argument": false},
	{"start": 1632 + 8, "length": 1, "function": jumpscare, "argument": false},
	{"start": 1632 + 8 + 8, "length": 1, "function": jumpscare, "argument": false},
	{"start": 1632 + 8 + 8 + 8, "length": 1, "function": jumpscare, "argument": false},
	
	{"start": 1664, "length": 1, "function": jumpscare, "argument": false},
	{"start": 1664 + 8, "length": 1, "function": jumpscare, "argument": false},
	{"start": 1664 + 8 + 8, "length": 1, "function": jumpscare, "argument": false},
	{"start": 1664 + 8 + 8 + 8, "length": 1, "function": jumpscare, "argument": false},
	
	{"start": 1696, "length": 1, "function": jumpscare, "argument": false},
	{"start": 1696 + 4, "length": 1, "function": jumpscare, "argument": false},
	{"start": 1696 + 4 + 4, "length": 1, "function": jumpscare, "argument": false},
	{"start": 1696 + 4 + 4 + 4, "length": 1, "function": jumpscare, "argument": false},
	{"start": 1696 + 4 + 4 + 4 + 4, "length": 1, "function": jumpscare, "argument": false},
	{"start": 1696 + 4 + 4 + 4 + 4 + 4, "length": 1, "function": jumpscare, "argument": false},
	{"start": 1696 + 4 + 4 + 4 + 4 + 4 + 4, "length": 1, "function": jumpscare, "argument": false},
	{"start": 1696 + 4 + 4 + 4 + 4 + 4 + 4 + 4, "length": 1, "function": jumpscare, "argument": false},
	{"start": 1696 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4, "length": 1, "function": jumpscare, "argument": false},
	{"start": 1696 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4, "length": 1, "function": jumpscare, "argument": false},
	{"start": 1696 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4, "length": 1, "function": jumpscare, "argument": false},
	{"start": 1696 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4, "length": 1, "function": jumpscare, "argument": false},
	{"start": 1696 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4, "length": 1, "function": jumpscare, "argument": false},
	{"start": 1696 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4, "length": 1, "function": jumpscare, "argument": false},
	{"start": 1696 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4, "length": 1, "function": jumpscare, "argument": false},
	{"start": 1696 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4, "length": 1, "function": jumpscare, "argument": false},
	{"start": 1696 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4 + 4, "length": 1, "function": jumpscare, "argument": false},
	
]


func _init() -> void:
	# Song settings
	bpm = 148.0
	measures = 4
	start_offset_beats = 18
	song_offset_seconds = 0.0
	song_length_beats = 441 # Possibly needs adjusting


func _ready() -> void:
	super()
	audio_stream_player.stream = Globals.sounds.WOLFISH
	audio_stream_player.volume_linear = 0.2
	
	if OS.is_debug_build():
		$BeatLabel.show()
	else:
		$BeatLabel.hide()


func start(game_to_start: Game) -> void:
	super(game_to_start)


func _process(delta: float) -> void:
	super(delta)


func get_moveset() -> Array[Dictionary]:
	return moveset


func aimed(beat_type: BeatType) -> void:
	const SPEED: float = 200
	
	var direction: Vector2 = -(game.boss.global_position - game.player.global_position)
	direction = direction.normalized() * SPEED
	
	game.bullets.append(Snowball.new(Vector2(160, 30), direction))


func misaimed(beat_type: BeatType, random: bool = false) -> void:
	const SPEED: float = 200
	
	var direction: Vector2 = -(game.boss.global_position - game.player.global_position)
	direction = direction.normalized() * SPEED
	
	if not random:
		game.bullets.append(Snowball.new(Vector2(160, 30), direction + Vector2(-SPEED / 4, 0)))
		game.bullets.append(Snowball.new(Vector2(160, 30), direction + Vector2(SPEED / 4, 0)))
	else:
		var random_number = chordjack_rng.randi_range(1, 3)
		match random_number:
			1:
				game.bullets.append(Snowball.new(Vector2(160, 30), direction + Vector2(-SPEED / 4, 0)))
				game.bullets.append(Snowball.new(Vector2(160, 30), direction + Vector2(SPEED / 4, 0)))
			2:
				game.bullets.append(Noball.new(Vector2(160, 30), direction + Vector2(-SPEED / 4, 0)))
				game.bullets.append(Noball.new(Vector2(160, 30), direction + Vector2(SPEED / 4, 0)))
			3:
				game.bullets.append(Light.new(Vector2(160, 30), direction + Vector2(-SPEED / 4, 0)))
				game.bullets.append(Light.new(Vector2(160, 30), direction + Vector2(SPEED / 4, 0)))


func triple_aimed(beat_type: BeatType, every_quarter: bool) -> void:
	print(every_quarter)
	if not every_quarter:
		if beat_type == BeatType.Quarter:
			return
	
	misaimed(beat_type)
	aimed(beat_type)


var curved_wall_fast: bool = false
func curved_walls(beat_type: BeatType) -> void:
	if beat_type != BeatType.Beat:
		return
	
	if curved_wall_fast:
		wall(Vector2(0, 1), 90, 2, 180)
	else:
		wall(Vector2(1, 0), 90, 2, 100)
	
	curved_wall_fast = not curved_wall_fast


func wall(start_at: Vector2, degrees: float, degrees_per_bullet: float, speed: float, noball: bool = true) -> void:
	var current_degrees: float = 0
	for n: int in range(degrees / degrees_per_bullet):
		current_degrees += degrees_per_bullet
		
		var bullet_position: Vector2 = game.boss.global_position
		
		var forward := start_at.rotated(deg_to_rad(current_degrees))
		var distance = 1.0
		
		var new_position: Vector2 = bullet_position + forward * distance
		
		var direction: Vector2 = -(game.boss.global_position - new_position)
		
		if noball:
			game.bullets.append(Noball.new(game.boss.position, direction * speed))
		else:
			game.bullets.append(Light.new(game.boss.position, direction * speed))

var burst_rng := RandomNumberGenerator.new()
var burst_bullets_shot_total: int = 0
var burst_initialized: bool = false
func burst(beat_type: BeatType, total_bullets_to_shoot: int) -> void:
	if not burst_initialized:
		burst_initialized = true
		burst_rng.seed = 67
	
	var speed: float = remap(burst_bullets_shot_total, 0, total_bullets_to_shoot, 100, 400)
	
	#for i in range(2):
	var direction = Vector2(burst_rng.randf_range(-speed, speed), speed)
	
	#game.bullets.append(Foreshadow.new(game.boss.position, direction))
	game.bullets.append(Foreshadow.new(Vector2(burst_rng.randf_range(64, 256), 8), direction))
	burst_bullets_shot_total += 1
	
	#print("(%s / %s) = %s" % [burst_bullets_shot_total, total_bullets_to_shoot, speed])

	# Detect pattern being re-used
	if burst_bullets_shot_total >= total_bullets_to_shoot:
		burst_bullets_shot_total = 0


func jumpscare(beat_type: BeatType, easy: bool = true) -> void:
	if easy:
		wall(Vector2(1, 0), 180, 15, 200, true)
	else:
		wall(Vector2(1, 0), 180, 15, 200, false)


var chorus_bubble: bool = false
var chorus_rng := RandomNumberGenerator.new()
var chorus_initialized: bool = false
func chorus(beat_type: BeatType, hard: bool = false) -> void:
	if not chorus_initialized:
		chorus_rng.seed = 61
		chorus_initialized = true
	
	const BUBBLE_SPEED: float = 200
	const BULLET_SPEED: float = 100
	
	if beat_type == BeatType.Beat:
		chorus_bubble = not chorus_bubble
		if chorus_bubble:
			var direction: Vector2 = -(game.boss.global_position - game.player.global_position)
			direction = direction.normalized() * BUBBLE_SPEED
			game.bullets.append(Bubble.new(game.boss.position, direction))
	
	#if beat_type == BeatType.Beat or beat_type == BeatType.Half or beat_type == BeatType.Quarter:
	if beat_type == BeatType.Beat or beat_type == BeatType.Half:
		for i in range(int(hard) + 1):
			var bullet_position := Vector2(0, chorus_rng.randf_range(8, 232))
			var bullet_velocity := Vector2(0, 0)
			
			if hard:
				bullet_position.x = chorus_rng.randf_range(8, 256)
				bullet_position.y = 8
				
				bullet_velocity.x = chorus_rng.randf_range(-1, 1)
				bullet_velocity.y = 1.0
			else:
				var left: bool = chorus_rng.randi() & 1
				if left:
					bullet_position.x = 64
					bullet_velocity.x = 1.0
				else:
					bullet_position.x = 256
					bullet_velocity.x = -1.0
			
			bullet_velocity *= BULLET_SPEED
			
			#var snowball: bool = chorus_rng.randi() & 1
			#if snowball:
				#game.bullets.append(Snowball.new(bullet_position, bullet_velocity))
			#else:
			game.bullets.append(Light.new(bullet_position, bullet_velocity))


# Chordjack
var chordjack_rng := RandomNumberGenerator.new()
var chordjack_initialized: bool = false
func chordjack(beat_type: BeatType) -> void:
	if not chordjack_initialized:
		chordjack_initialized = true
		chordjack_rng.seed = 69
	
	const BULLET_SPEED: float = 150
	
	if beat_type == BeatType.Beat:
		
		for i: int in range(6):
			
			var bullet_position := Vector2(64 + 16 + (32 * i), 0)
			
			bullet_position.x += chordjack_rng.randf_range(-10, 10)
			
			var random_number = chordjack_rng.randi_range(1, 3)
			match random_number:
				1:
					game.bullets.append(Snowball.new(bullet_position, Vector2(0, BULLET_SPEED)))
				2:
					game.bullets.append(Noball.new(bullet_position, Vector2(0, BULLET_SPEED)))
				3:
					game.bullets.append(Light.new(bullet_position, Vector2(0, BULLET_SPEED)))
