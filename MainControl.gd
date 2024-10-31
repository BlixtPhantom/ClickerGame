extends Control

var phantomTokens = 0.0
var phantomTokensAdd = .01
var multiplier = 1.0


func addPhantomTokens(multiplier):
	phantomTokens += phantomTokensAdd * (multiplier)
	
	print("Phantom Tokens: ", "%6.2f" % phantomTokens)
	print("Your multiplier: ", "%6.2f" % multiplier)
	$"Phantom Tokens Label".text = str("PhantomTokens: " , "%6.2f" % phantomTokens)

func _ready():
	$"Phantom Tokens Button".pressed.connect(func():
		$"Phantom Tokens Button/Multiplier Timer".start()
		multiplier += .01
		addPhantomTokens(multiplier)
	)


func _on_multiplier_timer_timeout():
	multiplier = 1.00
