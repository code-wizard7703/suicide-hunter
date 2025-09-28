extends Area2D

# Static variable to track deaths across reloads
static var death_count := 0

func _ready() -> void:
	connect("body_entered", Callable(self, "_on_body_entered"))

func _on_body_entered(body: Node) -> void:	
	# Increment death count
	death_count += 1
	print("Deaths: ", death_count)  # optional: shows in console
	# Reload the scene safely
	call_deferred("_reload_scene")
	if body.has_method("die"):
		body.die()  # Call the die() function


func _reload_scene() -> void:
	get_tree().reload_current_scene()
func die():
	Global.death_count += 1
	print("Player died! Total deaths: %d" % Global.death_count)
