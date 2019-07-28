extends Label


const Player = preload("res://characters/player/player.gd")

var _state_text = {
	Player.States.IDLE: "idle",
	Player.States.WALK: "walk",
	Player.States.RUN: "run",
	Player.States.BUMP: "bump",
	Player.States.JUMP: "jump",
	Player.States.FALL: "fall",
	Player.States.RESPAWN: "respawn"
}


func setup(character: KinematicBody2D) -> void:
	character.connect("state_changed", self, "_on_Character_state_changed")


func _on_Character_state_changed(state):
	text = _state_text[state]