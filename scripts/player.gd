extends KinematicBody2D

export (int) var MOVEMENT_SPEED = 220

var last_impulse = Vector2()


func _process(delta):
	if last_impulse.y < 0:
		get_node("sprite").region_rect = Rect2(0, 64, 64, 64)
	elif last_impulse.y > 0:
		get_node("sprite").region_rect = Rect2(0, 0, 64, 64)
	elif last_impulse.x < 0:
		get_node("sprite").region_rect = Rect2(64, 64, 64, 64)
	elif last_impulse.x > 0:
		get_node("sprite").region_rect = Rect2(64, 0, 64, 64)


func _physics_process(delta):
	var impulse = Vector2(0, 0)
	if Input.is_action_pressed("ui_up"):
		impulse.y -= 1
	if Input.is_action_pressed("ui_down"):
		impulse.y += 1
	if Input.is_action_pressed("ui_left"):
		impulse.x -= 1
	if Input.is_action_pressed("ui_right"):
		impulse.x += 1
	last_impulse = impulse * MOVEMENT_SPEED
	self.move_and_slide(last_impulse)