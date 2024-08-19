extends AudioStreamPlayer

const levelMusic = [
	preload("res://assets/sounds/Wormo Main Theme Rough.mp3"),
	
]

func play_sfx(new_stream: AudioStream, volume = 0.0):
	var fx_player = AudioStreamPlayer.new()
	fx_player.stream = new_stream
	fx_player.name = "FX_Player"
	fx_player.volume_db = volume
	add_child(fx_player)
	fx_player.play()
	
	await fx_player.finished
	fx_player.queue_free()

func play_music_level():
	_play_music(levelMusic[0], -12)

func _play_music(music: AudioStream, volume = 0.0):
	if stream == music:
		return
	stream = music
	volume_db = volume
	play()
	pass
