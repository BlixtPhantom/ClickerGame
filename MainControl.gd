extends Control

var copper = 0
var copperadd = 1
var silver = 0
var silveradd = 1


func addcopper():
	copper += copperadd
	print("You have ", copper, " copper")
	$CopperLabel
	
func addsilver():
	silver += silveradd
	print("You have ", silver, " silver")

func _ready():
	$"Copper Button".pressed.connect(func():
		addcopper()
	)
	
	$"Silver Button".pressed.connect(func():
		addsilver()
	)
	
	$"Upgrade Copper".pressed.connect(func():
		if silver > 5:
			silver -= 5
			print("You have spent 5 silver you now have ", silver, " silver")
			print("You have upgraded copper generation!")
			copperadd += 1
		
		else:
			print("You do not have da funds for dat mon")
	)
	
	$"Upgrade Silver".pressed.connect(func():
		pass
	)
