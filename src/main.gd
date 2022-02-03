extends Node

export(PackedScene) var vill_scene
var score
func _ready():
	randomize()
	new_game() 
	$player.connect('hit', self, 'game_over')
	

func new_game():
	score = 0
	$starttimer.start()
	$player.start($startposition.position)
	$HUD.update_score(score)
	$HUD.show_messade("Get Ready!!")
	get_tree().call_group("vill", "queue_free")
	$music.play()
	
func game_over():
	$scoretimer.stop()
	$villtimer.stop()
	$HUD.show_game_ove()
	$music.stop()
	$death.play()

	

func _on_villtimer_timeout():
	var vill_spawn_location = get_node("vill_path/spawnlocation");
	vill_spawn_location.unit_offset = randf()
	
	var vill = vill_scene.instance()
	add_child(vill)
	
	var dirtn = vill_spawn_location.rotation + PI/2 
	#perpendicular to point of origin(so it will be straight line)
	
	vill.position = vill_spawn_location.position
	
	dirtn += rand_range(-PI/4, PI/4)
	vill.rotation = dirtn
	
	var velocity = Vector2(rand_range(150, 300), 0)
	vill.linear_velocity = velocity.rotated(dirtn)


func _on_scoretimer_timeout():
	score = score + 1
	$HUD.update_score(score)
	


func _on_starttimer_timeout():
	$villtimer.start()
	$scoretimer.start()

