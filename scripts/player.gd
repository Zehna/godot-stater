extends CharacterBody3D

## Player third-person: gerak WASD relatif terhadap kamera, lompat Spasi,
## kamera orbit via mouse (SpringArm3D). Di HP paling nyaman pakai keyboard
## + mouse; sentuh saja belum ada joystick virtual di starter ini.

@export var speed: float = 6.0
@export var jump_velocity: float = 8.0
@export var mouse_sensitivity: float = 0.003

@onready var spring_arm: SpringArm3D = $SpringArm3D

var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity") as float
var yaw: float = 0.0
var pitch: float = -0.35


func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED else Input.MOUSE_MODE_CAPTURED
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		yaw -= event.relative.x * mouse_sensitivity
		pitch = clampf(pitch - event.relative.y * mouse_sensitivity, -1.2, 0.6)
		rotation.y = yaw
		spring_arm.rotation.x = pitch


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y -= gravity * delta
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity
	var input_dir := Input.get_vector("move_left", "move_right", "move_forward", "move_back")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction != Vector3.ZERO:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
	else:
		velocity.x = move_toward(velocity.x, 0.0, speed)
		velocity.z = move_toward(velocity.z, 0.0, speed)
	move_and_slide()
