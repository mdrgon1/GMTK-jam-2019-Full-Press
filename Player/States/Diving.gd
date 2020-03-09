extends "State.gd"

const STAGE_1 = 10
const STAGE_2 = 25

var dive_timer = 0

func exit():
	owner.emit_signal("Diving", false)

func enter():
	owner.emit_signal("Doing", "Diving")
	owner.emit_signal("Diving", true)
	owner.motion.x += 100
	dive_timer = 0

func update(delta):
	dive_timer += 1
	if dive_timer < STAGE_1:
		owner.motion = Vector2(SPEED * 1.5 * sign(owner.motion.x), -SPEED * 1.5)
	elif dive_timer > STAGE_2:
		return "falling"
	else:
		owner.motion.y = 0
		
	owner.motion = owner.move_and_slide(owner.motion, UP)