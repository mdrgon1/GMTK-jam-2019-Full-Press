extends "State.gd"

const FRICTION = 0.02
const SLIDE_THRESHOLD = 100

func exit():
	owner.emit_signal("Sliding", false)

func enter():
	owner.emit_signal("Doing", "Sliding")
	owner.emit_signal("Sliding", true)
	print("sliding")

func update(delta):
	owner.motion.y += GRAVITY
	
	if !owner.is_on_floor():
		return "falling"
		
	if !owner.action("ui_down"):
		return "sprinting"
	
	if owner.action("ui_up"):
		return "jumping"
	
	if abs(owner.motion.x) < SLIDE_THRESHOLD:
		return "crouching"
	
	owner.motion.x += -owner.motion.x * FRICTION
	
	owner.motion = owner.move_and_slide(owner.motion, UP)