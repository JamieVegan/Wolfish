extends Node2D

const SPEED: float = 150.0
const FOCUS_SPEED: float = 75.0

const PARRY_TIME: float = 0.25

var focusing: bool = false
var parry_time: float = 0.0
var parry_cooldown: float = 0.0

var dead: bool = false

@onready var hitbox_sprite: Sprite2D = $HitboxSprite
@onready var sprite: Sprite2D = $Sprite

func _draw() -> void:
	pass


func _physics_process(delta: float) -> void:
	if dead:
		return
	
	# Parry time
	if parry_cooldown > 0.0:
		parry_cooldown -= delta
		if parry_cooldown <= 0:
			parry_back()
	
	if parry_time > 0.0:
		parry_time -= delta
		if parry_time <= 0.0:
			parry_end()
	
	# Input
	var input := Vector2.ZERO
	
	# Parry
	if Input.is_action_just_pressed("parry") and Globals.CAN_PARRY:
		if parry_cooldown <= 0.0:
			parry_start()
	
	# WASD
	if Input.is_action_pressed("up"):
		input.y -= 1.0
	if Input.is_action_pressed("down"):
		input.y += 1.0
	if Input.is_action_pressed("left"):
		input.x -= 1.0
	if Input.is_action_pressed("right"):
		input.x += 1.0
	input = input.normalized()
	
	if input == Vector2.ZERO:
		position = round(position)
	
	# Focus
	focusing = Input.is_action_pressed("focus")
	
	# Movement
	if Globals.paused:
		return
	
	if focusing:
		position += input * delta * FOCUS_SPEED
	else:
		position += input * delta * SPEED
	
	position.x = clampf(position.x, 144.0 / 2, 496.0 / 2)
	position.y = clampf(position.y, 48.0 / 2, 432.0 / 2)


func parry_start() -> void:
	print("parry_start")
	hitbox_sprite.modulate = Color.from_hsv(0.667, 1.0, 1.0, 1.0)
	parry_time = PARRY_TIME
	parry_cooldown = Globals.PARRY_COOLDOWN + PARRY_TIME


func parry_end() -> void:
	print("parry_end")
	parry_time = 0 # parry_time is not always 0 when this gets called
	hitbox_sprite.modulate = Color.from_hsv(0.0, 1.0, 0.75, 1.0)


func is_parrying() -> bool:
	return parry_time > 0


func parry_back() -> void:
	hitbox_sprite.modulate = Color.from_hsv(0.0, 1.0, 1.0, 1.0)
	parry_cooldown = 0


func show_deathbomb() -> void:
	$Deathbomb.show()


func hide_deathbomb() -> void:
	$Deathbomb.hide()
