extends CanvasLayer

signal start_game


func show_message(text):
	$MessageLabel.text = text
	$MessageLabel.show()
	$MessageTimer.start()


func show_game_over():
	show_message("Game Over")
	await $MessageTimer.timeout
	$MessageLabel.text = "Dodge the\nCreeps"
	$MessageLabel.show()
	await get_tree().create_timer(1).timeout
	buttons_hide()
	$StartButton.show()
	


func update_score(score):
	$ScoreLabel.text = str(score)

func buttons_show():
	$Button_Down.show()
	$Button_Left.show()
	$Button_Right.show()
	$Button_Up.show()
	
func  buttons_hide():
	$Button_Down.hide()
	$Button_Left.hide()
	$Button_Right.hide()
	$Button_Up.hide()
	
func _on_StartButton_pressed():
	$StartButton.hide()
	buttons_show()
	start_game.emit()
	

func _on_MessageTimer_timeout():
	$MessageLabel.hide()

