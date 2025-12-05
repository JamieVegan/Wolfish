extends Node

enum Difficulty {
	Easy, Normal, Hard, Lunatic
}

var textures: Dictionary[String, Texture2D] = {
	"SNOWBALL": load("res://assets/textures/Snowball.png"),
	"NOBALL": load("res://assets/textures/Noball.png"),
	"BUBBLE": load("res://assets/textures/Bubble.png"),
	"LIGHT": load("res://assets/textures/Light.png"),
	"PLAYER_HITBOX": load("res://assets/textures/PlayerHitbox.png"),
}

var sounds: Dictionary[String, AudioStream] = {
	"WOLFISH": load("res://assets/sounds/Wolfish.mp3"),
	"PARRY": load("res://assets/sounds/525175__sophia_c__metal-impact-5-soft.ogg")
}

var paused: bool = false
var universal_offset_seconds: float = 0.0

var can_leave: bool = true

# In seconds
var DEATHBOMB_TIME: float = 0.5
var PARRY_COOLDOWN: float = 2.5
var CAN_PARRY: bool = true
var DIFFICULTY: Difficulty = Difficulty.Normal

var test_skip_beats: int = -1 # TEST: length worth of moves to skip when testing (this gets set in main.gd)


func _unhandled_input(event: InputEvent) -> void:
	if event.is_echo():
		return
	
	if event is InputEventKey:
		if event.keycode == KEY_F11:
			if event.is_pressed():
				if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN:
					DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
				else:
					DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
		# DEBUG
		if event.keycode == KEY_ESCAPE:
			if event.is_pressed() and can_leave:
				Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
				
				if AudioServer.get_bus_effect_count(0) >= 1:
					AudioServer.remove_bus_effect(0, 0)
				
				paused = false
				get_tree().change_scene_to_file("res://scenes/main.tscn")
