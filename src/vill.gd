extends RigidBody2D
func _ready():
	$AnimatedSprite.playing = true
	var mob_types = $AnimatedSprite.frame.get_animation_name()
	$AnimatedSprite.animation = mob_types[randi()%mob_types.size()]
	


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	
