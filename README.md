# Godot Stater

Starter project Godot 4 — 3D third-person, GDScript. Satu scene yang langsung
bisa di-Run: Player (CharacterBody3D) di atas tanah, gerak WASD, lompat Spasi,
kamera third-person orbit dengan mouse (SpringArm3D). Dibuat untuk dibuka di
editor Godot Android (HP) maupun Godot PC.

## Fitur

- **Koin (5x):** Area3D emas berputar. Sentuh Player -> hilang, skor +1 di HUD.
  Ambil semua 5 koin -> pesan "Semua koin didapat!". 2 koin ada di atas platform,
  jadi harus lompat.
- **Platform & rintangan:** 2 platform (hijau) yang bisa dinaiki buat ambil koin,
  1 dinding rintangan rendah (cokelat) di tengah yang bisa dilompati.
- **Musuh:** 1 kotak merah patroli bolak-balik (x -6 sampai 6, z = 6).
  Sentuh musuh -> Player respawn di awal (0, 1, 0), pesan "Kena musuh!".
- **Joystick virtual (HP):** lingkaran di kiri bawah — seret buat gerak
  (atas = maju). Tombol **LOMPAT** di kanan bawah buat lompat.
  Di PC juga bisa drag joystick pakai mouse (setelah Esc buat lepas mouse).

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
| `scenes/main.tscn` | Scene utama: langit, cahaya, Ground, Platform, Obstacle, 5 Coin, Enemy, Player + SpringArm3D/Camera3D, HUD |
| `scripts/player.gd` | Gerak third-person + lompat + orbit kamera |
| `scripts/main.gd` | Skor koin, respawn, tombol LOMPAT |
| `scripts/coin.gd` | Koin berputar + collect saat Player menyentuh |
| `scripts/enemy.gd` | Musuh patroli bolak-balik + respawn Player saat sentuh |
| `scripts/virtual_joystick.gd` | Joystick sentuh -> Input action move_* |
| `icon.svg` | Ikon project |

## Pengembangan selanjutnya

- Export ke Android (butuh export template: Project — Export — Android)
- Level 2 / koin lebih banyak / musuh lebih cepat

## Catatan workflow

Project ini disinkronkan lewat GitHub, bukan live-sync: edit di satu sisi
(HP atau repo), commit, baru giliran sisi satunya pull. Jangan edit di HP dan
di repo bersamaan tanpa pull dulu — bisa bentrok.

## Lisensi

MIT — lihat `LICENSE`.
