extends Node2D

var bullet_scene: PackedScene = preload("res://scenes//projectiles/bullet.tscn")

func _on_player_bullet(pos,direction):
	var bullet = bullet_scene.instantiate() as Area2D
	bullet.position = pos
	bullet.rotation_degrees = rad_to_deg(direction.angle()) + 90
	bullet.direction = direction
	$Projectiles.add_child(bullet)
