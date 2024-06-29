extends Node2D

var bullet_scene: PackedScene = preload("res://scenes//projectiles/bullet.tscn")
var boss1_scene: PackedScene = preload("res://scenes//enemies//boss1.tscn")
var rng = RandomNumberGenerator.new()

func _ready():
	var boss1 = boss1_scene.instantiate() as StaticBody2D
	boss1.dead.connect(_on_boss_1_dead)
	boss1.position = Vector2(100,100)
	$Enemies.add_child(boss1)
	#DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	pass

func _process(_delta):
	if Input.is_action_just_pressed("escape"):
		get_tree().quit()

func _on_player_bullet(pos,direction):
	var bullet = bullet_scene.instantiate() as Area2D
	bullet.position = pos
	bullet.rotation_degrees = rad_to_deg(direction.angle()) + 90
	bullet.direction = direction
	$Projectiles.add_child(bullet)

func _on_boss_1_dead():
	var boss1 = boss1_scene.instantiate() as StaticBody2D
	boss1.dead.connect(_on_boss_1_dead)
	boss1.position = Vector2(rng.randi_range(0,1200),rng.randi_range(0,700))
	print("spawned")
	$Enemies.call_deferred("add_child",boss1)
