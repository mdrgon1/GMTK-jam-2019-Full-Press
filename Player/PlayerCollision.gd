extends CollisionShape2D

const CROUCH_SHAPE = Vector2(1, 0.4166666666)
const DIVE_SHAPE = Vector2(1.5, 0.666)
const SLIDE_SHAPE = Vector2(1.5, 0.416666666)

func _on_Player_Crouching(isCrouching):
	if isCrouching:
		set_scale(CROUCH_SHAPE)
		set_position(Vector2(0, 14))
	else:
		set_scale(Vector2(1, 1))
		set_position(Vector2(0, 0))



func _on_Player_Diving(isDiving):
	if isDiving:
		set_scale(DIVE_SHAPE)
		set_position(Vector2(0, 8))
	else:
		set_scale(Vector2(1, 1))
		set_position(Vector2(0, 0))


func _on_Player_Sliding(isSliding):
	if isSliding:
		set_scale(SLIDE_SHAPE)
		set_position(Vector2(0, 14))
	else:
		set_scale(Vector2(1, 1))
		set_position(Vector2(0, 0))
