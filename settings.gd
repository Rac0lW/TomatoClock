extends Node


var current_states:States = States.Resting

var current_time:Dictionary
var next_time:Dictionary

var loop_count:int = 4
var current_count:int = 0

enum States{
	Working,
	Resting,
	LongResting,
	Stoping
}
