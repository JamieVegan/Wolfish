class_name Foreshadow
extends Snowball

func _init(bullet_position: Vector2, bullet_velocity: Vector2) -> void:
	super(bullet_position, bullet_velocity)


func draw_below(game: Game) -> void:
	game.draw_line(position, position + (velocity * 1024), Color.from_rgba8(255, 0, 0, 128), 4.0)
