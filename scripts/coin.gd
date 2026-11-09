extends Area3D
## Koin 3D: berputar, hilang saat Player menyentuhnya, tambah skor di Main.
## Hanya Player yang bisa mengambil (cek body.name).

var collected: bool = false


func _ready() -> void:
	body_entered.connect(_on_body_entered)


func _process(delta: float) -> void:
	var mesh := $MeshInstance3D
	if mesh:
		mesh.rotation.y += delta * 2.0


func _on_body_entered(body: Node3D) -> void:
	if collected:
		return
	if body.name != "Player":
		return
	collected = true
	var main := get_tree().current_scene
	if main and main.has_method("add_coin"):
		main.add_coin()
	queue_free()
