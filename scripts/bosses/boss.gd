@abstract
class_name Boss
extends Sprite2D

signal beat
signal half
signal quarter


enum BeatType {
	Beat, Half, Quarter
}

var game: Game
var moves_on: bool = true

# Song settings
var bpm: float
var measures: int
var start_offset_beats: int
var song_offset_seconds: float
var song_length_beats: int

# Song stuff
var seconds_per_beat: float # Assigned in ready
var last_reported_beat: int = 0
var last_reported_half: int = 0
var last_reported_quarter: int = 0

# DEBUG
var hit_test: AudioStream = load("res://assets/sounds/normal-hitnormal.wav")

# This gets set to the length of the move (how many beats the move should be done for)
# When this is 0 we move on to the next move in the moveset

var audio_stream_player: AudioStreamPlayer


func _ready() -> void:
	audio_stream_player = AudioStreamPlayer.new()
	audio_stream_player.name = "Song"
	seconds_per_beat = 60.0 / bpm


func start(game_to_start: Game) -> void:
	game = game_to_start
	game.add_child(audio_stream_player)
	audio_stream_player.play()
	
	# TEST
	if Globals.test_skip_beats < 0:
		return
	
	audio_stream_player.seek((Globals.test_skip_beats + start_offset_beats + 1) * seconds_per_beat)
	
	#var song_position = audio_stream_player.get_playback_position() + AudioServer.get_time_since_last_mix()
	#song_position -= AudioServer.get_output_latency()
	#var song_position_in_beats = ((song_position / seconds_per_beat) + song_offset_seconds) - (start_offset_beats + Globals.universal_offset_seconds)
	#
	#var current_quarter: int = round(song_position_in_beats * 4)
	#print(song_position_in_beats + start_offset_beats)
	#
	#for i in range(current_quarter):
		#process_move(BeatType.Quarter)
	#
	#game.bullets.clear()


func _process(_delta: float) -> void:
	if last_reported_beat >= song_length_beats:
		return
	
	var song_position = audio_stream_player.get_playback_position() + AudioServer.get_time_since_last_mix()
	song_position -= AudioServer.get_output_latency()
	var song_position_in_beats = ((song_position / seconds_per_beat) + song_offset_seconds) - (start_offset_beats + Globals.universal_offset_seconds)
	
	var current_beat: int = floor(song_position_in_beats)
	var current_half: int = floor(song_position_in_beats * 2)
	var current_quarter: int = floor(song_position_in_beats * 4)
	
	if current_beat > last_reported_beat:
		print("Beat")
		beat.emit()
		play_audio()
		
		process_move(current_quarter, BeatType.Beat)
		last_reported_beat = current_beat
	elif current_half > last_reported_half and (current_half / 2.0) > last_reported_beat and current_half > 2:
		print("Half")
		half.emit()
		play_audio(-5.0)
		
		process_move(current_quarter, BeatType.Half)
		last_reported_half = current_half
	elif current_quarter > last_reported_quarter and (current_quarter / 2.0) > last_reported_half and (current_quarter / 4.0) > last_reported_beat and current_quarter > 4:
		print("Quarter")
		quarter.emit()
		play_audio(-10.0)
		
		process_move(current_quarter, BeatType.Quarter)
		last_reported_quarter = current_quarter


func process_move(current_quarter: int, beat_type: BeatType) -> void:
	if not moves_on:
		return
	
	# TESTING this will error if there is no beat label
	$BeatLabel.text = str(int((current_quarter / 4.0) - 1.0))
	# TESTING testing purposes only
	
	for move: Dictionary in get_moveset():
		if current_quarter - 4 >= move.start and current_quarter - 4 < (move.start + move.length):
			print(current_quarter - 4)
			if move.has("argument"):
				move.function.call(beat_type, move.argument)
			else:
				move.function.call(beat_type)
	## Check if we need to do the next move
	#if not current_move or current_move.length <= 0:
		## Not run out of moves yet?
		#if get_moveset().size() > 0:
			#current_move = get_moveset()[0]
			#get_moveset().pop_front()
		#else:
			#return # We're out of moves so just return
	#
	#if current_move.has("function"):
		#current_move.function.call(beat_type)
	#
	## Decrease length
	#current_move.length -= 1

func get_moveset() -> Array[Dictionary]:
	return []


# DEBUG
func play_audio(volume: float = 0.0) -> void:
	pass
	#var audio := AudioStreamPlayer.new()
	#audio.volume_db = volume
	#audio.stream = hit_test
	#game.add_child(audio)
	#audio.play()
	#await audio.finished
	#audio.queue_free()
