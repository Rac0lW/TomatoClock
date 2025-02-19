extends Label

@onready var work_or_long_rest_timer: Timer = $"../WorkOrLongRestTimer"
@onready var rest_timer: Timer = $"../RestTimer"

func _ready() -> void:
	text = "Waiting for start"

func _on_timer_timeout() -> void:
	match Settings.current_states:
		Settings.States.Working:
			if work_or_long_rest_timer.time_left > 60:
				text = "Time remaining: %2.f mins" % (work_or_long_rest_timer.time_left / 60)
			else:
				text = "Time remaining: %2.f s" % (work_or_long_rest_timer.time_left)
		Settings.States.Resting:
			if rest_timer.time_left > 60:
				text = "Time remaining: %2.f mins" % (rest_timer.time_left / 60)
			else:
				text = "Time remaining: %2.f s" % rest_timer.time_left 
		Settings.States.LongResting:
			if work_or_long_rest_timer.time_left > 60:
				text = "Time remaining: %2.f mins" % (work_or_long_rest_timer.time_left / 60)
			else:
				text = "Time remaining: %2.f s" % work_or_long_rest_timer.time_left 
