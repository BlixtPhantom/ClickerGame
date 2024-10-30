extends Control

var phantomTokens = 0.0
var phantomTokensAdd = .01
var multiplier = .01


func addPhantomTokens(multiplier):
	phantomTokens += phantomTokensAdd * (multiplier)
	
	print("Phantom Tokens: ", "%6.2f" % phantomTokens)
	print("Your multiplier: ", "%6.2f" % multiplier)
	$"Phantom Tokens Label".text = str("PhantomTokens: " , "%6.2f" % phantomTokens)

func _ready():
	$"Phantom Tokens Button".pressed.connect(func():
		multiplier += .01
		addPhantomTokens(multiplier)
	)
