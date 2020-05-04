extends Camera2D

var level = 1
var target_position = Vector2(0, 0)

func _ready():
	target_position = get_node(String(level).insert(0, "../Level")).position

func _process(delta):
	if (target_position - position).length() < 4:
		position = target_position
	if target_position != position:
		position += (target_position - position).normalized() * delta * 60 * 8

func _on_Level_End(body):
	if body == get_node("../Player"):
		level += 1
		var level_node = get_node(String(level).insert(0, "../Level"))
		if(level_node):
			target_position = level_node.position
		if level >= 11:
			set_z_index(5)
			$endscreen.set_z_index(5)