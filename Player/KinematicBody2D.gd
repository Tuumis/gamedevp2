extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 50
const SPEED = 300
const JUMP_HEIGHT = -550
var motion = Vector2()
var is_allowed_to_jump = false

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _physics_process(delta):
	motion.y +=GRAVITY
	
	if Input.is_action_pressed("ui_right"):
		motion.x = SPEED
		$Sprite.flip_h = false
		$Sprite.play("Run")

	elif Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
		$Sprite.flip_h = true
		$Sprite.play("Run")
	else: 
		motion.x = 0
		$Sprite.play("Idle")
		
	if is_on_floor():
		is_allowed_to_jump = true
		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMP_HEIGHT
		#if Input.is_action_just_pressed("ui_down"):
		#	motion.y = JUMP_HEIGHT
	else:
		if Input.is_action_just_pressed("ui_up") and is_allowed_to_jump:
			is_allowed_to_jump = false
			motion.y = JUMP_HEIGHT
			
		if motion.y > 0:
			$Sprite.play("Fall")
		else : 
			$Sprite.play("Jump")
	
	motion = move_and_slide(motion, UP)
	pass
