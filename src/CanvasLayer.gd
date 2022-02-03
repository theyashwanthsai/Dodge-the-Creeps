extends CanvasLayer

signal start_game

func show_messade(text):
	$message.text = text
	$message.show()
	$messagetimer.start()
	
func show_game_ove():
	show_messade("Game Over")
	
	yield($messagetimer, "timeout")
	$message.text = "Dodge the\nCreeps"
	$message.show()
	
	yield(get_tree().create_timer(1), "timeout")
	$startbutton.show()
	
func update_score(score):
	$scorelabel.text = str(score)


func _on_messagetimer_timeout():
	$message.hide()


func _on_startbutton_pressed():
	$startbutton.hide()
	emit_signal("start_game")
