extends RigidBody2D

const max_health: int = 3
var health: float = 3
var health_percent: float = 1
var run_speed: float = 100
var collide = true

func _ready():
	position = position

func _process(delta):
	if Global.player != null:
		position += position.direction_to(Global.player.position) * run_speed * delta
		#apply_central_impulse(position.direction_to(player.position) * run_speed * delta)

func hit(damage):
	health -= damage
	health_percent = float(health/max_health)
	$TextureProgressBar.set_value(ceil(health_percent*100))
	if health <= 0:
		queue_free()