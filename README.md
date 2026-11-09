# Godot Stater

Starter project Godot 4 — 3D third-person, GDScript. Satu scene yang langsung
bisa di-Run: Player (CharacterBody3D) di atas tanah, gerak WASD, lompat Spasi,
kamera third-person orbit dengan mouse (SpringArm3D). Dibuat untuk dibuka di
editor Godot Android (HP) maupun Godot PC.

## Yang dibutuhkan

- **Godot 4.4+** — renderer disetel `gl_compatibility`, jadi jalan di HP
  maupun PC low-end.
- Android: install editor Godot dari Play Store atau
  godotengine.org/download/android. Catatan: editor Android masih
  eksperimental, paling nyaman pakai keyboard + mouse.
- PC: download Godot dari godotengine.org/download.

## Cara buka

1. Clone repo ini, atau download ZIP-nya.
2. Buka Godot — Import — pilih `project.godot` di folder ini.
3. Tekan Run (F5). Player muncul di tengah tanah, gerakkan dengan WASD,
   lompat dengan Spasi, putar kamera dengan mouse.

## Struktur

| File | Isi |
| --- | --- |
| `project.godot` | Konfigurasi: main scene, input map, renderer GL Compatibility |
| `scenes/main.tscn` | Scene utama: langit, cahaya, Ground, Player + SpringArm3D/Camera3D, HUD |
| `scripts/player.gd` | Gerak third-person + lompat + orbit kamera |
| `scripts/main.gd` | Script scene utama + ide pengembangan |
| `icon.svg` | Ikon project |

## Pengembangan selanjutnya

- Rintangan / platform + koin (Area2D) + skor di HUD
- Musuh sederhana yang bergerak bolak-balik
- Joystick virtual untuk kontrol sentuh di HP
- Export ke Android (butuh export template: Project — Export — Android)

## Catatan workflow

Project ini disinkronkan lewat GitHub, bukan live-sync: edit di satu sisi
(HP atau repo), commit, baru giliran sisi satunya pull. Jangan edit di HP dan
di repo bersamaan tanpa pull dulu — bisa bentrok.

## Lisensi

MIT — lihat `LICENSE`.
