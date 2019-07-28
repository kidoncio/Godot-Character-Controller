extends KinematicBody2D


signal state_changed(state)

enum States {
	IDLE,
	WALK
}

var state: String = States.IDLE
var _transitions: Dictionary = {
	[IDLE, MOVE]: WALK
}


func _ready() -> void:
	connect_signals()


func change_state(event) -> void:
	var transition = [state, event]
	
	if not transition in _transitions:
		return
	
	state = _transitions[transition]
	
	enter_state()
	emit_signal("state_changed")


func enter_state() -> void:
	return


func connect_signals() -> void:
	$StateLabel.setup(self)