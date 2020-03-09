extends AnimatedSprite

func _on_Player_Direction(Direction):
	set_scale(Vector2(Direction * 2, 2))

func _on_Player_Doing(doing):
	
	set_animation(doing)
	
	if doing == "Sliding":
		position.y = 8
	elif doing == "Diving":
		position.x = -2
	else:
		position = Vector2(0, 0)
