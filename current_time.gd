extends Label

func _ready() -> void:
	text = "Press Start to Begin."

func _on_timer_timeout() -> void:
	Settings.current_time = Time.get_time_dict_from_system()
	var ts = "%02d:%02d:%02d" % [Settings.current_time.hour, Settings.current_time.minute, Settings.current_time.second]
	text = ts
