extends Node

const MAX_HEALTH = 5
var health = MAX_HEALTH
var health_bar

func _ready() -> void:
	# Find the HealthBar node within the CanvasLayer
	health_bar = get_node("CanvasLayer/HealthBar")
	
	# Check if the HealthBar node was found
	if health_bar == null:
		print("Error: HealthBar node not found.")
	else:
		# Set the maximum value of the HealthBar
		health_bar.max_value = MAX_HEALTH
		# Set the initial value of the HealthBar
		health_bar.value = health

func _input(event: InputEvent) -> void:
	# Handle input events
	if event.is_action_pressed("damage"):
		damage()

func damage() -> void:
	# Decrease health
	health -= 1
	# If health goes below 0, reset it to MAX_HEALTH
	if health < 0:
		health = MAX_HEALTH
	# Update the value of the HealthBar
	health_bar.value = health
