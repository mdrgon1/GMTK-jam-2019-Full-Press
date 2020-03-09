extends "State.gd"

const FRICTION = 0.05

func enter():
	owner.emit_signal("Doing", "Falling")
	print("falling")

func update(delta):
	owner.motion.y += GRAVITY
	
	if owner.action("ui_right"):
		owner.motion.x += (SPEED - owner.motion.x) * FRICTION
	if owner.action("ui_left"):
		owner.motion.x += (-SPEED - owner.motion.x) * FRICTION
	
	if owner.is_on_floor():
		return "running"
	
	owner.motion = owner.move_and_slide(owner.motion, UP)