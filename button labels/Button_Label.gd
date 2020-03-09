extends Sprite

var button = "button"

func _ready():
	set_self_modulate(Color(1, 1, 1, 1))

func _process(actions):
	if Input.is_action_just_pressed(button):
		set_self_modulate(Color(0.85, 0.27, 0.27, 1))

func turn_off(action):
	if action == button:
		set_self_modulate(Color(0, 0, 0, 0))

func reset():
	set_self_modulate(Color(1, 1, 1, 1))