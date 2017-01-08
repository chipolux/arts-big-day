extends Sprite

const UP_TEXTURE = preload('res://textures/character-up.png')
const LEFT_TEXTURE = preload('res://textures/character-left.png')
const RIGHT_TEXTURE = preload('res://textures/character-right.png')
# const DOWN_TEXTURE = preload('res://textures/character-down.png')

func _ready():
    set_process_input(true)

func _input(event):
    if Input.is_action_pressed('ui_up'):
        set_texture(UP_TEXTURE)
    elif Input.is_action_pressed('ui_left'):
        set_texture(LEFT_TEXTURE)
    elif Input.is_action_pressed('ui_right'):
        set_texture(RIGHT_TEXTURE)
