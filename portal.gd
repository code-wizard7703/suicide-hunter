extends Area2D
@onready var kill_zone: Area2D = $"../Kill Zone"

func _ready() -> void:
	# Optional: randomize required deaths if needed
	if Global.required_deaths == 5:
		Global.required_deaths = randi() % 9 + 2
		print("Portal will unlock after %d deaths." % Global.required_deaths)

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		if kill_zone.death_count >= Global.required_deaths:
			print("Portal unlocked! Loading res://world2.tscn...")
			if ResourceLoader.exists("res://world2.tscn"):
				get_tree().change_scene_to_file("res://world2.tscn")
			else:
				push_error("Target scene 'res://world2.tscn' does not exist!")
		else:
			print("Portal locked! Deaths so far: %d/%d" % [kill_zone.death_count, Global.required_deaths])


# Example: Player script
func die():
	Global.death_count += 1
	print("Player died! Total deaths: %d" % kill_zone.death_count)
	# Respawn or reload current scene
