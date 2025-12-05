class_name Fake
extends Snowball

const MAX_TIME: float = 0.75
var time: float = 0
var erased: bool = false


func _init(bullet_position: Vector2, bullet_velocity: Vector2) -> void:
	super(bullet_position, bullet_velocity)


func process(game: Game, delta: float) -> void:
	if not erased:
		time += delta
		if time >= MAX_TIME:
			game.bullets.erase(self)
			erased = true
