extends RigidBody2D

var speed = 300
var score = 0

func _ready() -> void:
	var viewport_size = get_viewport().get_visible_rect().size
	position = viewport_size/2
	
func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	if Input.is_action_just_pressed("volar"):
		linear_velocity = Vector2.ZERO
		apply_central_impulse(Vector2(0, -speed))
		$AnimatedSprite2D.play("move")

func game_over():
	get_tree().paused = true
	$"../message".show()
	$"../message/game over".show()

func raise_score():
	score += 1
	$"../Label".text = str(score)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("suelo"):
		game_over()
