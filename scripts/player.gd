extends RigidBody2D

export var walk_speed = 175
var velocity = Vector2()

func _ready():
    set_fixed_process(true)
    set_process_input(true)

func _get_movement_velocity():
    var left = Input.is_action_pressed('ui_left')
    var right = Input.is_action_pressed('ui_right')
    var up = Input.is_action_pressed('ui_up')
    var down = Input.is_action_pressed('ui_down')
    if left and not right:
        velocity.x = -walk_speed
    elif right and not left:
        velocity.x = walk_speed
    else:
        velocity.x = 0

    if up and not down:
        velocity.y = -walk_speed
    elif down and not up:
        velocity.y = walk_speed
    else:
        velocity.y = 0

    return velocity

func _fixed_process(delta):
    var velocity = _get_movement_velocity()
    set_linear_velocity(velocity)

func _input(event):
    if Input.is_action_pressed('ui_accept'):
        var bodies = get_colliding_bodies()
        for body in bodies:
            print(body.get_name())
