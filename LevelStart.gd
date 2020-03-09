extends Node2D

var level = 0
signal new_level

var level_starts = [
	Vector2(112, -112),
	Vector2(208, 80),
	Vector2(528, 208),
	Vector2(176, 464),
	Vector2(-208, 464),
	Vector2(-592, 464),
	Vector2(-720, 144),
	Vector2(-976, 144),
	Vector2(-1360, 48),
	Vector2(-1744, -48),
	Vector2(-1744, -48),
]

func _on_LevelEndArea_body_entered(body):
	if body == get_node("../Player"):
		level += 1
		position = level_starts[level]
		emit_signal("new_level")
