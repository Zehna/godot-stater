extends Node3D
## Scene utama starter 3D: skor koin, respawn saat kena musuh,
## tombol LOMPAT di HUD (sentuh) + joystick virtual (lihat virtual_joystick.gd).

var score: int = 0
var total_coins: int = 5
var spawn_position: Vector3 = Vector3(0, 1, 0)
var status_timer: float = 0.0

@onready var player: CharacterBody3D = $Player
@onready var score_label: Label = $HUD/ScoreLabel
@onready var status_label: Label = $HUD/StatusLabel
@onready var jump_button: Button = $HUD/JumpButton


func _ready() -> void:
	_update_score_label()
	jump_button.button_down.connect(_on_jump_button_down)
	jump_button.button_up.connect(_on_jump_button_up)
	print("Godot 4 Starter 3D siap. WASD gerak, Spasi lompat, mouse putar kamera.")


func _process(delta: float) -> void:
	if status_timer > 0.0:
		status_timer -= delta
		if status_timer <= 0.0:
			status_label.text = ""


func add_coin() -> void:
	score += 1
	_update_score_label()
	if score >= total_coins:
		show_status("Semua koin didapat!")


func respawn_player() -> void:
	player.global_position = spawn_position
	player.velocity = Vector3.ZERO
	player.rotation.y = 0.0
	show_status("Kena musuh! Respawn di awal.")


func show_status(text: String) -> void:
	status_label.text = text
	status_timer = 2.0


func _update_score_label() -> void:
	score_label.text = "Koin: %d/%d" % [score, total_coins]


func _on_jump_button_down() -> void:
	Input.action_press("jump")


func _on_jump_button_up() -> void:
	Input.action_release("jump")
