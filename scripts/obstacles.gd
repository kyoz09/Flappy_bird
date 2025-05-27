extends Node2D

var speed = 150

func _ready() -> void:
	randomize()
	position.x += 300
	position.y = randf_range(59.0,293.0)
	
func _process(delta: float) -> void:
	position.x -= speed * delta
	if position.x <= -350:
		call_deferred("queue_free")
	
func _on_tuberia_1_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.game_over()

func _on_tuberia_2_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.game_over()

func _on_score_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.raise_score()
