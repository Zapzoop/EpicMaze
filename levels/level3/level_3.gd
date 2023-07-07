extends Node2D

@export var level:int

func _on_start_body_entered(body):
	pass # Replace with function body.


func _on_end_body_entered(body):
	GlobalSceneTree.change_scene_on_exit(level,body)
