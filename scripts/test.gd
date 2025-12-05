extends Control


func _on_160_pressed() -> void:
	go(160)


func _on_176_pressed() -> void:
	go(176)


func go(beat: int) -> void:
	Globals.test_skip_beats = beat
	get_tree().change_scene_to_file("res://scenes/game.tscn")


func _on_112_pressed() -> void:
	go(112)


func _on_216_pressed() -> void:
	go(216)


func _on_0_pressed() -> void:
	go(0)


func _on_128_pressed() -> void:
	go(128)


func _on_246_pressed() -> void:
	go(246)


func _on_344_pressed() -> void:
	go(344)


func _on_312_pressed() -> void:
	go(312)


func _on_32_pressed() -> void:
	go(32)
