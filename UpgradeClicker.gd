extends VBoxContainer

func _ready():
	var ui_script = get_node("..")
	$"Upgrade Button".pressed.connect(func():
		if ui_script.phantom_tokens >= 1.00:
			ui_script.phantom_tokens -= 1.0
			print("You have upgraded your click")
			ui_script.phantom_tokens_increment += .01
			
		else:
			print("you do not have enought tokens!")
		)
			
