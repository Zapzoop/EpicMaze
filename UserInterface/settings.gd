extends Control

@onready var music_slider: HSlider = get_node("Panel/VBoxContainer/MuscicBoxContainer/MusicSlider")
@onready var sound_effect_slider: HSlider = get_node("Panel/VBoxContainer/EffectBoxContainer/EffectSlider")

var music = AudioServer.get_bus_index("Music")
var sound_effect = AudioServer.get_bus_index("SoundEffect")

func _ready():
	music_slider.set_slider_value(db_to_linear(music))
	sound_effect_slider.set_slider_value(db_to_linear(sound_effect))

func set_bus_volume(audio_bus, value) -> void:
	AudioServer.set_bus_volume_db(audio_bus, linear_to_db(value))
	AudioServer.set_bus_mute(
		audio_bus,
		true if not value else false
	)

func _on_music_slider_value_changed(value):
	set_bus_volume(music, value)

func _on_effect_slider_value_changed(value):
	set_bus_volume(sound_effect, value)


func _on_back_button_pressed():
	hide()
