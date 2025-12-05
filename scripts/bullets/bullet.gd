@abstract
class_name Bullet

var texture: Texture2D
var position: Vector2
var size: int
var velocity: Vector2
var collisions: bool = true
var parryable: bool = true
var parry_back: bool = false # Gives the player their parry back when they parry this bullet


func _init(bullet_position: Vector2, bullet_velocity: Vector2) -> void:
	position = bullet_position
	velocity = bullet_velocity


func process(game: Game, delta: float) -> void:
	return


# For custom drawing only
func draw_below(game: Game) -> void:
	return


func draw_above(game: Game) -> void:
	return
