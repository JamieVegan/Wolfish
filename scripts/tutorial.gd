extends Control


func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("down"):
		$Scroll.scroll_vertical += 20
	if Input.is_action_just_pressed("up"):
		$Scroll.scroll_vertical -= 20
