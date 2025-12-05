class_name Noball
extends Snowball

func _init(bullet_position: Vector2, bullet_velocity: Vector2) -> void:
	super(bullet_position, bullet_velocity)
	
	parryable = false
	texture = Globals.textures.NOBALL
