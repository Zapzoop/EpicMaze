extends Node2D

var level1 = preload("res://levels/level1/level_1.tscn")
var instance = level1.instantiate()


#WARNING DONT CHANGE THE BUTTON FUNCTIONALITY UNTIL LEVEL MENU IS COMPLETED
func _on_button_pressed(): 
	GlobalSceneTree.add_child(instance)
	GlobalSceneTree.add_player(1)	
	self.queue_free()
