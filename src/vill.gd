extends RigidBody2D
func _ready():
	$AnimatedSprite.playing = true
	var vill_types = $AnimatedSprite.frames.get_animation_names()
	$AnimatedSprite.animation = vill_types[randi()%vill_types.size()]
	


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	
