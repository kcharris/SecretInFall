extends KinematicBody2D

export (int) var speed = 100 #character speed needs to be lower at certain locations such as the puzzle
#at speed 100, reducing to 50 works
#I could also change the switches to activate when the player is directly, by a single pixel basically, over it. To prevent overlap.
export (int) var multiplier = 2
export (bool) var run = false

var velocity = Vector2()

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if Input.is_action_pressed("up"):
		velocity.y -= 1
	if Input.is_action_just_pressed("shift"):
		run = !run
	if run:
		velocity = velocity.normalized() * (speed * multiplier)
	else:
		velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
