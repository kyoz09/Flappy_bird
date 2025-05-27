extends Node2D

var obstaculos_escena = preload("res://escenas/obstacles.tscn")

func _on_timer_timeout() -> void:
	var obstaculos = obstaculos_escena.instantiate()
	add_child(obstaculos)
