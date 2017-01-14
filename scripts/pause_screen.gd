extends Panel

func _ready():
    # Should start centered on it's parent and hidden
    var size = get_size()
    set_pos(Vector2(size.width * -0.5, size.height * -0.5))
    hide()

func unpause():
    hide()
    get_tree().set_pause(false)

func quit_game():
    get_tree().quit()
