class_name Light
extends Bullet

func _init(bullet_position: Vector2, bullet_velocity: Vector2) -> void:
	super(bullet_position, bullet_velocity)
	texture = Globals.textures.LIGHT
	size = 4
	parry_back = true
