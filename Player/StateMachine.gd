extends Node

var current_state = null
var motion = Vector2(0, 0)
var level_start_position = Vector2(112, -112)
var starting_level = false
var dying = false

signal Crouching
signal Diving
signal Sliding
signal Direction
signal Doing
signal NextLevel
signal StartLevel
signal Pressed

var actions_used = {
	"ui_left"	: false,
	"ui_right"	: false,
	"ui_up"		: false,
	"ui_sprint"	: false,
	"ui_down"	: false,
}

onready var states_map = {
	"running"	: $States/Running,
	"jumping"	: $States/Jumping,
	"falling"	: $States/Falling,
	"crouching"	: $States/Crouching,
	"diving"	: $States/Diving,
	"sprinting"	: $States/Sprinting,
	"dying"		: $States/Dying,
	"sliding"	: $States/Sliding
}

func action(action):
	if Input.is_action_pressed(action) && !actions_used[action] && !starting_level:
		if action != "ui_down" && action != "ui_sprint":
			return true
		elif action == "ui_down" && owner.crouch > 1:
			return true
		elif action == "ui_sprint" && owner.sprint > 1:
			return true
	else:
		return false

func update_state(state_name):
	if state_name:
		if states_map[state_name] != current_state:
			current_state.exit()
			current_state = states_map[state_name]
			current_state.enter()

func _ready():
	current_state = $States/Running
	return

func is_any_action_pressed():
	var output = false
	for action in actions_used:
		if Input.is_action_pressed(action):
			output = true
	return output

func _physics_process(delta):
	delta = delta * 60

	if Input.is_action_just_pressed("ui_respawn"):
		current_state = states_map["dying"]
		for action in actions_used:
			actions_used[action] = false
		states_map["dying"].enter()
	
	for action in actions_used:
		if Input.is_action_just_released(action):
			if !starting_level && !dying:
				if action != "ui_down" && action != "ui_sprint":
					actions_used[action] = true
				elif action == "ui_down" && owner.crouch > 1:
					actions_used[action] = true
				elif action == "ui_sprint" && owner.sprint > 1:
					actions_used[action] = true
				else:
					actions_used[action] = false
				emit_signal("Pressed", action)
		if Input.is_action_just_released(action) || !is_any_action_pressed():
			if starting_level:
				for action in actions_used:
					actions_used[action] = false
				emit_signal("StartLevel")
				starting_level = false	
	
	update_state(current_state.update(delta))
#	update_state(get_node("States/Running").update(delta))

func _on_new_level():
	level_start_position = get_node("../LevelStart").position
	self.position = level_start_position
	current_state = states_map["dying"]
	current_state.enter()
	

func _on_LaunchPad_launch_player():
	motion.y = -400
	motion.x = motion.x * 0.2
	current_state = states_map["jumping"]
	current_state.enter()


func _on_Spikes_body_entered(body):
	if body == self:
		current_state = states_map["dying"]
		current_state.enter()
