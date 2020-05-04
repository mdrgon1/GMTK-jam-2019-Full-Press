extends Node2D

onready var level = 0

var level_ends = [
	Vector2(208, 80),
	Vector2(528, 176),
	Vector2(176, 464),
	Vector2(-208, 464),
	Vector2(-592, 464),
	Vector2(-672, 176),
	Vector2(-976, 144),
	Vector2(-1360, 48),
	Vector2(-1744, -48),
	Vector2(-2128, -48),
	Vector2(0, 0)
]

func _process(delta):
	pass

func _on_LevelEndArea_body_entered(body):
	if body == get_node("../Player"):
		level += 1
		position = level_ends[level]
		print(position)

