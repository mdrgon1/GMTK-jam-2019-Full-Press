extends "Button_Label.gd"

func _process(delta):
	if owner.sprint < 2:
		position = Vector2(-320, 0)
	else:
		position = Vector2(-188, -116)

func _ready():
	position = Vector2(-320, 0)
	button = "ui_sprint"