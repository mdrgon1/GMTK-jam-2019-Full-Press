extends Node2D

onready var buttons = [
	$Down,
	$Left,
	$Right,
	$Shift,
	$Up
]


func reset_all():
	for label in buttons:
		label.reset()

func _on_Player_Doing(doing):
	if doing == "Dying":
		reset_all()

func _on_Player_StartLevel():
	reset_all()


func _on_Player_Pressed(button):
	for label in buttons:
		label.turn_off(button)
