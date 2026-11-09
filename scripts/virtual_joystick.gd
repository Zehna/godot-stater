extends Control
## Joystick virtual untuk sentuh di HP (juga bisa drag mouse buat tes di PC).
## Seret knob -> tekan Input action move_left/right/forward/back.
## Atas = maju (move_forward), bawah = mundur, kiri/kanan sesuai arah.

var radius: float = 80.0
var knob_radius: float = 32.0
var touch_index: int = -1
var mouse_dragging: bool = false
var knob_offset: Vector2 = Vector2.ZERO


func _gui_input(event: InputEvent) -> void:
	# Posisi event diubah ke koordinat lokal Control dulu — tanpa ini,
	# posisi sentuh (koordinat viewport) akan salah arah di HP.
	var local_event := make_input_local(event)
	if event is InputEventScreenTouch:
		if event.pressed:
			touch_index = event.index
			_update_knob(local_event.position)
		elif event.index == touch_index:
			touch_index = -1
			knob_offset = Vector2.ZERO
			_release_all()
			queue_redraw()
	elif event is InputEventScreenDrag and event.index == touch_index:
		_update_knob(local_event.position)
	elif event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			mouse_dragging = true
			_update_knob(local_event.position)
		else:
			mouse_dragging = false
			knob_offset = Vector2.ZERO
			_release_all()
			queue_redraw()
	elif event is InputEventMouseMotion and mouse_dragging:
		_update_knob(local_event.position)


func _update_knob(local_pos: Vector2) -> void:
	var center := size * 0.5
	var offset := local_pos - center
	if offset.length() > radius:
		offset = offset.normalized() * radius
	knob_offset = offset
	_apply_actions()
	queue_redraw()


func _apply_actions() -> void:
	var v := knob_offset / radius
	_set_action("move_left", -v.x)
	_set_action("move_right", v.x)
	_set_action("move_forward", -v.y)
	_set_action("move_back", v.y)


func _set_action(action: StringName, strength: float) -> void:
	if strength > 0.2:
		Input.action_press(action, clampf(strength, 0.0, 1.0))
	else:
		Input.action_release(action)


func _release_all() -> void:
	for a in ["move_left", "move_right", "move_forward", "move_back"]:
		Input.action_release(a)


func _draw() -> void:
	var center := size * 0.5
	draw_circle(center, radius, Color(1, 1, 1, 0.12))
	draw_arc(center, radius, 0, TAU, 48, Color(1, 1, 1, 0.35), 2.0)
	draw_circle(center + knob_offset, knob_radius, Color(1, 1, 1, 0.4))
