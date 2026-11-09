extends Node3D

## Scene utama starter 3D. Ide pengembangan selanjutnya (pilih satu):
## - Rintangan / platform (StaticBody3D) + koin (Area2D) + skor di HUD.
## - Musuh sederhana (CharacterBody3D yang bergerak bolak-balik).
## - Joystick virtual untuk kontrol sentuh di HP.
## - Export ke Android (Project > Export > Android, butuh export template).


func _ready() -> void:
	print("Godot 4 Starter 3D siap. WASD gerak, Spasi lompat, mouse putar kamera.")
