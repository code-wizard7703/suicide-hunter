extends Area2D

func _on_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://world2.tscn")

func _go_to_world1():
	get_tree().change_scene_to_file("res://world2.tscn")
