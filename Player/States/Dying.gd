extends "State.gd"

var respawn_timer = 0

func enter():
	owner.motion = Vector2(0, 0)
	owner.dying = true
	respawn_timer = 0
	owner.emit_signal("Doing", "Dying")

func update(delta):
	respawn_timer += delta
	
	if respawn_timer > 24:
		owner.position = owner.level_start_position
		for action in owner.actions_used:
			owner.actions_used[action] = false
		owner.dying = false
		return "running"
