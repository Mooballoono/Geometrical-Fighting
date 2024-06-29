extends Area2D

signal hit

@export var speed: int = 1000
var direction: Vector2 = Vector2.UP
var damage: float = 1

func _process(delta):
	position += direction * speed * delta

func _on_body_entered(body:Node2D):
	if body.is_in_group("ENEMIES"):
		print("hit")
		print(body)
		if body.has_method('hit'):
			body.hit(damage)
		queue_free()
