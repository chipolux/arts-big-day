extends Node2D

var sample_player
var buzz_voice

func _ready():
    sample_player = get_node('SamplePlayer')
    buzz_voice = sample_player.play('buzz')

    var interaction_area = get_node('Interaction Area')
    interaction_area.connect('body_enter', self, 'body_entered')
    interaction_area.connect('body_exit', self, 'body_left')

func body_entered(body):
    if body.get_name() == 'Player':
        body.interactable = self

func body_left(body):
    if body.get_name() == 'Player' and body.interactable == self:
        body.interactable = null

func interact(player):
    if player.facing == 'U':
        sample_player.stop_voice(buzz_voice)
        sample_player.play('alert')
        get_node('Interaction Area').queue_free()
