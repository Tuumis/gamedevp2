extends Area2D

const player_area_name = "PlayerInteractionArea"

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_gem_area_entered(area):
	if area.get_name() == player_area_name:
		queue_free()
