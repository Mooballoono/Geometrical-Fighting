extends StaticBody2D

const max_health: int = 10
var health: int = 10
@warning_ignore("integer_division")
var health_percent = float((health/max_health)*100)

func hit(damage):
	health -= damage
	if health <= 0:
		print("dead")
		queue_free()
