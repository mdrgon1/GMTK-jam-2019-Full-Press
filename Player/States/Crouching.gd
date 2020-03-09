extends "State.gd"

const FRICTION = 0.05

func enter():
	owner.emit_signal("Doing", "Crouching")
	print("crouching")
	owner.emit_signal("Crouching", true)

func exit():
	owner.emit_signal("Crouching", false)

func update(delta):
	owner.motion.y += GRAVITY
	
	if !owner.is_on_floor():
		return "falling"
		
	if !owner.action("ui_down"):
		return "running"
	
	if owner.action("ui_up"):
		return "jumping"
	
	owner.motion.x += -owner.motion.x * FRICTION
	
	owner.motion = owner.move_and_slide(owner.motion, UP)