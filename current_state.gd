extends Label
@onready var timer: Timer = $"../Timer"
@onready var work_or_long_rest_timer: Timer = $"../WorkOrLongRestTimer"
@onready var rest_timer: Timer = $"../RestTimer"
@onready var start_button: Button = $"../StartButton"

func _ready() -> void:
	text = "Stoping"

func _on_timer_timeout() -> void:
	match Settings.current_states:
		Settings.States.Working:
			text = "Working"
		Settings.States.Resting:
			text = "Resting"
		Settings.States.LongResting:
			text = "Go out for relax"
		_:
			text = "Stoping"

func _on_start_button_pressed() -> void:
	Settings.current_states = Settings.States.Working
	work_or_long_rest_timer.start()
	start_button.text = "Restart"
		

func _on_big_timer_timeout() -> void:
	Settings.current_states = Settings.States.Resting
	rest_timer.start()
		
func _on_s_timer_timeout() -> void:
	Settings.current_count += 1
	if Settings.current_count == 4:
		Settings.current_count = 0
		Settings.current_states = Settings.States.LongResting
		work_or_long_rest_timer.start()
	else:
		Settings.current_states = Settings.States.Working
		work_or_long_rest_timer.start()
		
func _on_stop_button_pressed() -> void:
	#TODO;
	pass
