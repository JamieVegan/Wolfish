class_name Bubble
extends Bullet


func _init(bullet_position: Vector2, bullet_velocity: Vector2) -> void:
	super(bullet_position, bullet_velocity)
	texture = Globals.textures.BUBBLE
	#size = 24
	size = 16
