extends Node2D

onready var crouch = 0
onready var sprint = 0

func _process(delta):
	
	
	pass

func _on_DownPickup_body_entered(body):
	crouch += 1


func _on_SprintPickup_body_entered(body):
	sprint += 1
