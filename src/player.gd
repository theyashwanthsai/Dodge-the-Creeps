extends Area2D
signal hit

export var speed = 400
var scsize
func _ready():
	scsize = get_viewport_rect().size
	#hide()
func _process(delta):
	var velo = Vector2.ZERO
	if Input.is_action_pressed("move_d"):
		velo.y += 1
	if Input.is_action_pressed("move_l"):
		velo.x -= 1
	if Input.is_action_pressed("move_u"):
		velo.y -= 1
	if Input.is_action_pressed("move_r"):
		velo.x += 1
	if velo.length() > 0:
		velo = velo.normalized() * speed
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
	position += velo*delta
	position.x = clamp(position.x, 0, scsize.x)
	position.y = clamp(position.y, 0, scsize.y)
	if velo.x != 0:
	   $AnimatedSprite.animation = "walk"
	   $AnimatedSprite.flip_v = false
	   $AnimatedSprite.flip_h = velo.x < 0
	elif velo.y != 0:
	   $AnimatedSprite.animation = "up"
	   $AnimatedSprite.flip_v = velo.y > 0

	
	
		


func _on_player_body_entered(body):
	hide()
	emit_signal("hit")
	$CollisionShape2D.set_deferred("disabled", true)
func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false

