extends Control

@onready var difficulty_vbox: VBoxContainer = $VBoxContainer/Center/DifficultyVBox
@onready var buttons_vbox: VBoxContainer = $VBoxContainer/Center/ButtonsVBox


func _ready() -> void:
	Globals.test_skip_beats = -1
	
	buttons_vbox.show()
	difficulty_vbox.hide()
	
	if OS.is_debug_build():
		$VBoxContainer/Center/ButtonsVBox/Test.show()
	# DEBUG
	#await get_tree().process_frame
	#get_tree().change_scene_to_file("res://scenes/game.tscn")


func _on_play_pressed() -> void:
	buttons_vbox.hide()
	difficulty_vbox.show()



func _on_test_pressed() -> void:
	Globals.DEATHBOMB_TIME = 0.4
	Globals.PARRY_COOLDOWN = 2.0
	Globals.CAN_PARRY = true
	Globals.DIFFICULTY = Globals.Difficulty.Normal
	get_tree().change_scene_to_file("res://scenes/test.tscn")


func _on_easy_pressed() -> void:
	Globals.DEATHBOMB_TIME = 1.0
	Globals.PARRY_COOLDOWN = 1.0
	Globals.CAN_PARRY = true
	Globals.DIFFICULTY = Globals.Difficulty.Easy
	play()


func _on_normal_pressed() -> void:
	Globals.DEATHBOMB_TIME = 0.4
	Globals.PARRY_COOLDOWN = 2.0
	Globals.CAN_PARRY = true
	Globals.DIFFICULTY = Globals.Difficulty.Normal
	play()


func _on_hard_pressed() -> void:
	Globals.DEATHBOMB_TIME = 0.2
	Globals.PARRY_COOLDOWN = 4.0
	Globals.CAN_PARRY = true
	Globals.DIFFICULTY = Globals.Difficulty.Hard
	play()


func _on_lunatic_pressed() -> void:
	Globals.CAN_PARRY = false
	Globals.DIFFICULTY = Globals.Difficulty.Lunatic
	play()


func _on_back_pressed() -> void:
	buttons_vbox.show()
	difficulty_vbox.hide()


func _on_tutorial_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/tutorial.tscn")


func _on_exit_pressed() -> void:
	get_tree().quit()


# Go to game scene
func play():
	get_tree().change_scene_to_file("res://scenes/game.tscn")
