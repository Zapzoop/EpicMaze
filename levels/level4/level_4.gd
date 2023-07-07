extends Node2D

@export var level:int
# Called when the node enters the scene tree for the first time.


func _on_start_body_entered(body):
	pass # Replace with function body.


func _on_end_body_entered(body):
	GlobalSceneTree.change_scene_on_exit(level,body)
