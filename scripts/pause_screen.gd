extends Panel

func unpause():
    hide()
    get_tree().set_pause(false)

func quit_game():
    get_tree().quit()
