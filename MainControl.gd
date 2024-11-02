extends Control

# Initialize variables for Phantom Tokens and multiplier mechanics
var phantom_tokens: float = 0.0  # Tracks the total number of Phantom Tokens
var phantom_tokens_increment: float = 0.01  # Increment amount per click
var multiplier: float = 1.0  # Multiplier that adjusts the rate of token gain
var rng: RandomNumberGenerator = RandomNumberGenerator.new()  # Random number generator instance

# Function to add Phantom Tokens, adjusted by the multiplier
func add_phantom_tokens():
	# Increases phantom tokens based on the increment and multiplier
	phantom_tokens += phantom_tokens_increment * multiplier
	
	# Outputs the current state of phantom tokens and multiplier to the console for debugging
	print("Phantom Tokens: ", "%6.2f" % phantom_tokens)
	print("Your multiplier: ", "%6.2f" % multiplier)
	
	# Updates the UI labels to display current phantom token count and multiplier
	$"Phantom Tokens Label".text = "Phantom Tokens: %6.2f" % phantom_tokens
	$"Multiplier Label".text = "Multiplier: %6.2f" % multiplier

# Built-in function called when the scene is loaded and nodes are ready
func _ready():
	# Connects the button's pressed signal to an anonymous function
	# This starts a timer and attempts to increase the multiplier based on random chance
	$"Phantom Tokens Button".pressed.connect(func():
		$"Phantom Tokens Button/Multiplier Timer".start()  # Starts a timer that resets the multiplier
		var chance_multiplier = rng.randi_range(1, 10)  # Generates a random number between 1 and 10
		
		# If the random number is 5, slightly increase the multiplier
		if chance_multiplier == 5:
			multiplier += 0.1
		add_phantom_tokens()  # Adds phantom tokens with the current multiplier
	)

# Function to handle timer timeout event, resetting multiplier back to default
func _on_multiplier_timer_timeout():
	multiplier = 1.0  # Resets multiplier to default value when timer times out

