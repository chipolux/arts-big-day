extends RigidBody2D

const UP_TEXTURE = preload('res://textures/character-up.png')
const LEFT_TEXTURE = preload('res://textures/character-left.png')
const RIGHT_TEXTURE = preload('res://textures/character-right.png')
const DOWN_TEXTURE = preload('res://textures/character-down.png')

export var walk_speed = 175

var interactable
var facing = 'D'  # Which direction are we facing, Up, Down, Left, or Right

func _ready():
    set_fixed_process(true)
    set_process_input(true)

func _fixed_process(delta):
    var left = Input.is_action_pressed('ui_left')
    var right = Input.is_action_pressed('ui_right')
    var up = Input.is_action_pressed('ui_up')
    var down = Input.is_action_pressed('ui_down')

    var velocity = Vector2()
    if left and not right:
        facing = 'L'
        velocity.x = -walk_speed
    elif right and not left:
        facing = 'R'
        velocity.x = walk_speed
    else:
        velocity.x = 0

    if up and not down:
        facing = 'U'
        velocity.y = -walk_speed
    elif down and not up:
        facing = 'D'
        velocity.y = walk_speed
    else:
        velocity.y = 0

    set_linear_velocity(velocity)

func _input(event):
    # Handle pause
    if event.is_action_pressed('pause'):
        get_tree().set_pause(true)
        get_node('Camera/PauseScreen').show()

    # Handle interactions
    if event.is_action_pressed('ui_accept') and interactable:
        interactable.interact(self)

    # Change sprite
    if event.is_action_pressed('ui_up'):
        get_node('Sprite').set_texture(UP_TEXTURE)
    elif event.is_action_pressed('ui_left'):
        get_node('Sprite').set_texture(LEFT_TEXTURE)
    elif event.is_action_pressed('ui_right'):
        get_node('Sprite').set_texture(RIGHT_TEXTURE)
    elif event.is_action_pressed('ui_down'):
        get_node('Sprite').set_texture(DOWN_TEXTURE)
