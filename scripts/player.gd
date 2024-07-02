extends CharacterBody2D

signal bullet(direction)

var can_shoot: bool = true
var speed: int = 400

func _ready():
	Global.player = self

func _process(delta):
	var direction: Vector2 = Input.get_vector("left","right","up","down")
	velocity = direction * speed
	move_and_collide(velocity*delta)
	rotation_degrees = rad_to_deg(get_global_mouse_position().angle_to_point(position))-90
	$PlayerImage.rotation_degrees = (rad_to_deg(get_global_mouse_position().angle_to_point(position))-90)*-1
	
	if Input.is_action_pressed("primary") and can_shoot:
		var player_direction = (get_global_mouse_position() - position).normalized()
		can_shoot = false
		$ShootTimer.start()
		bullet.emit($GunImage/BulletSpawn.global_position ,player_direction)

func _on_shoot_timer_timeout():
	can_shoot = true
