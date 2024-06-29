extends StaticBody2D

signal dead

const max_health: int = 10
var health: float = 10
var health_percent: float = 1

var files = []
var dir = DirAccess.open("E://Programs//Godot//Geometrical Fighting//graphics//health_bar")

func _ready():
	dir.list_dir_begin()
	while true:
		var file = dir.get_next()
		if file == "":
			break
		elif file.begins_with("health_bar") and not file.ends_with(".import"):
			files.append("E://Programs//Godot//Geometrical Fighting//graphics//health_bar//" + file)
	files.reverse()

func _process(_delta):
	pass

func hit(damage):
	health -= damage
	health_percent = float(health/max_health)
	var health_bar_index: int = ceil(health_percent*len(files))
	$HealthBarSprite2D.texture = load(files[health_bar_index])
	if health <= 0:
		dead.emit()
		queue_free()
