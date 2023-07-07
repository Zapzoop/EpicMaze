extends HSlider

func _on_mouse_exited():
	release_focus()


func set_slider_value(_value: float) -> void:
	self.value = _value
