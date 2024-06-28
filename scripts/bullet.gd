extends Area2D

signal hit

@export var speed: int = 1000
var direction: Vector2 = Vector2.UP
var damage: int = 1

func _process(delta):
	position += direction * speed * delta

func on_body_entered(body):
	print("hit") 
	if body.has_method("hit"):
		body.hit(damage)
	queue_free()
