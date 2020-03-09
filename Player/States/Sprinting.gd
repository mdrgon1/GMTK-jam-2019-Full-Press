extends "State.gd"

const SPRINT_MODIFIER = 1.5

func enter():
	owner.emit_signal("Doing", "Sprinting")

func update(delta):
	owner.motion.y += GRAVITY
	print("sprinting")

	if owner.action("ui_right") && owner.action("ui_left"):
		owner.motion.x = 0
	elif owner.action("ui_right"):
		owner.emit_signal("Direction", 1)
		owner.motion.x = SPEED * SPRINT_MODIFIER
	elif owner.action("ui_left"):
		owner.emit_signal("Direction", -1)
		owner.motion.x = -SPEED * SPRINT_MODIFIER
	else:
		owner.motion.x = 0
	
	if owner.action("ui_up"):
		return "diving"
		
	if owner.action("ui_down"):
		return "sliding"
	
	if !owner.action("ui_sprint"):
		return "running"
	
	if !owner.is_on_floor():
		return "falling"
	
	owner.motion = owner.move_and_slide(owner.motion, UP)