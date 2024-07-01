extends StaticBody2D

signal dead

const max_health: int = 10
var health: float = 10
var health_percent: float = 1

func _ready():
	pass

func _process(_delta):
	pass

func hit(damage):
	health -= damage
	health_percent = float(health/max_health)
	$TextureProgressBar.set_value(ceil(health_percent*100))
	if health <= 0:
		dead.emit()
		queue_free()
