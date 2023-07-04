extends CharacterBody2D

# get nodes
@onready var torch: PointLight2D = $Torch
# stats
@export_range(100.0, 1000.0, 10.0) var SPEED = 300.0
@export_range(1.0, 100.0, 1.0) var FRICTION = 300.0
@export_range(1.0, 100.0, 1.0) var MOMENTUM = 300.0

func _physics_process(delta):
	movement(delta)
	#torch.look_at(get_global_mouse_position())
	move_and_slide()

func movement(delta):
	# get input
	var input_direction = Input.get_vector("Player_move_left", "Player_move_right", "Player_move_up", "Player_move_down")
	
	# horizontal movement
	if input_direction.x:
		velocity.x = move_toward(velocity.x, input_direction.x * SPEED, MOMENTUM)
	else:
		velocity.x = move_toward(velocity.x, 0, FRICTION)
	# vertical movement
	if input_direction.y:
		velocity.y = move_toward(velocity.y, input_direction.y * SPEED, MOMENTUM)
	else:
		velocity.y = move_toward(velocity.y, 0, FRICTION)
