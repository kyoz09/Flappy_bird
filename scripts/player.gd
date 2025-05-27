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
		$AnimatedSprite2D.play("up")

func game_over():
	get_tree().paused = true

func raise_score():
	score += 1
	
