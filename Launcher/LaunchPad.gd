extends Area2D

var deactivation_timer = 0

signal launch_player

func _physics_process(delta):
	if overlaps_body(get_node("../../Player")) && deactivation_timer > 30:
		$LauncherSprite.set_frame(0)
		$LauncherSprite._set_playing(true)
		emit_signal("launch_player")
		deactivation_timer = 0
	deactivation_timer += 1