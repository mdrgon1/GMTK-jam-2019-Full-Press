extends "State.gd"

const JUMP_POWER = 300
const FRICTION = 0.05

func enter():
	owner.emit_signal("Doing", "Jumping")
	owner.motion.y -= JUMP_POWER
	print("jumping")
	
func update(delta):
	owner.motion.y += GRAVITY * 0.7
	
	if owner.action("ui_right"):
		owner.motion.x += (SPEED - owner.motion.x) * FRICTION * delta
	if owner.action("ui_left"):
		owner.motion.x += (-SPEED - owner.motion.x) * FRICTION * delta
	
	if owner.motion.y > 0 || !owner.action("ui_up"):
		return "falling"
	
	owner.motion = owner.move_and_slide(owner.motion, UP)