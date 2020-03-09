extends "State.gd"

func enter():
	owner.emit_signal("Doing", "Running")
	print("running")

func update(delta):
	
	if owner.action("ui_up"):
		return "jumping"
		
	if owner.action("ui_down"):
		return "crouching"
	
	if owner.action("ui_sprint"):
		return "sprinting"
	
	if !owner.is_on_floor():
		return "falling"

	owner.motion.y += GRAVITY

	if owner.action("ui_right") && owner.action("ui_left"):
		owner.motion.x = 0
	elif owner.action("ui_right"):
		owner.emit_signal("Direction", 1)
		owner.motion.x = SPEED
	elif owner.action("ui_left"):
		owner.emit_signal("Direction", -1)		
		owner.motion.x = -SPEED
	else:
		owner.motion.x = 0
	
	if abs(owner.motion.x) < 1:
		owner.emit_signal("Doing", "Idle")
	else:
		owner.emit_signal("Doing", "Running")
	
	print(owner.motion)
	owner.motion = owner.move_and_slide(owner.motion, UP)