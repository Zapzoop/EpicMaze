extends Node

#Path to levels
var level1_resource = preload("res://levels/level1/level_1.tscn")
var level2_resource = preload("res://levels/level2/level_2.tscn")
var level3_resource = preload("res://levels/level3/level_3.tscn")
var level4_resource = preload("res://levels/level4/level_4.tscn")

var player_resource = preload("res://objects/player/player.tscn")

var current_level

var memory = {}

#Transfer player between levels
func change_scene_on_exit(levelnum,player):
	match levelnum:
		1:
			var level_to_init = level2_resource.instantiate()
			change_scene_complete(level_to_init,player,levelnum)
		2:
			var level_to_init = level3_resource.instantiate()
			change_scene_complete(level_to_init,player,levelnum)
		3:
			var level_to_init = level4_resource.instantiate()
			change_scene_complete(level_to_init,player,levelnum)
		4:
			var level_to_init = level1_resource.instantiate()
			change_scene_complete(level_to_init,player,levelnum)

func change_scene_complete(level_to_init,player,levelnum):
	make_inactive()
	player.queue_free()
	memory[levelnum] = current_level
	self.remove_child(current_level)
	add_next_level(levelnum + 1,level_to_init)
	add_player(levelnum + 1)

func add_next_level(level_to_add,level_to_init):
	if isadded(level_to_add):
		self.add_child(memory[level_to_add])
		make_active(memory[level_to_add])
	else:
		self.add_child(level_to_init)

		
func isadded(level_to_add):
	if level_to_add in memory.keys():
		return true
	else:
		return false

func add_player(level):
	current_level = get_child(-1)
	var player = player_resource.instantiate()
	current_level.add_child(player)
	player.set_global_position(Vector2(8,40))

func make_inactive():
	for i in current_level.get_children():
		if  i.is_in_group("end"):
			i.set_deferred("monitoring", false)
		else:
			i.set_process_mode(4)
	current_level.set_process_mode(4)

	
func make_active(obj):
	for i in obj.get_children():
		if  i.is_in_group("end"):
			i.set_deferred("monitoring", true)
		else:
			i.set_process_mode(0)
	obj.set_process_mode(0)
