extends StaticBody2D

const max_health: int = 10
var health: int = 10
var health_percent = health/max_health

func hit(damage):
	health -= damage
	if health <= 0:
		queue_free()
