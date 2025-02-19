extends Label
@onready var timer: Timer = $Timer


func _on_timer_timeout() -> void:
	var time = Time.get_time_dict_from_system()
	var ts = "%02d:%02d:%02d" % [time.hour, time.minute, time.second]
	text = ts
