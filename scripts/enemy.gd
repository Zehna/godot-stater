extends CharacterBody3D
## Musuh sederhana: patroli bolak-balik di sumbu X.
## Sentuh Player -> Main.respawn_player() (Player kembali ke spawn).

@export var speed: float = 2.5
@export var patrol_min_x: float = -6.0
@export var patrol_max_x: float = 6.0

var direction: float = 1.0
var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity") as float


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y -= gravity * delta
	velocity.x = direction * speed
	velocity.z = 0.0
	move_and_slide()
	if global_position.x >= patrol_max_x:
		direction = -1.0
	elif global_position.x <= patrol_min_x:
		direction = 1.0
	for i in get_slide_collision_count():
		var collider := get_slide_collision(i).get_collider()
		if collider != null and collider.name == "Player":
			var main := get_tree().current_scene
			if main and main.has_method("respawn_player"):
				main.respawn_player()
			break
