# 🧑‍🍳 MyRecipeApp Backend

Progress aplikasi sementara ini adalah pada bagian backend .

## 🚀 Cara Menjalankan Program

### ⚙️ Persiapan Database (MySQL)

1.  **Siapkan Database:** Buat database MySQL baru dengan nama **`myrecipe`**.
2.  **Jalankan Script SQL:** Jalankan *file* SQL berikut secara berurutan untuk menyiapkan skema dan data:
    * `myrecipe.sql` → Digunakan untuk membuat struktur tabel utama (skema).
    * `query_dummy.sql` → Digunakan untuk mengisi data dummy untuk pengujian API.

### 🔧 Konfigurasi Environment

1.  **Cek File `.env`:** Pastikan *file* `.env` Anda sudah terisi dengan konfigurasi koneksi database dan *secret key* yang benar.

    **Contoh Isi `.env`:**

    ```env
    DB_USER=root
    DB_PASSWORD=yourpassword
    DB_HOST=localhost
    DB_PORT=3306
    DB_NAME=myrecipe
    JWT_SECRET=supersecretkey
    APP_PORT=8080
    ```

### ▶️ Menjalankan Aplikasi

1.  **Jalankan Program:** Gunakan perintah berikut di terminal Anda:

    ```bash
    go run cmd/main.go
    ```

2.  **Verifikasi:** Jika konfigurasi benar, terminal akan menampilkan pesan koneksi dan server berjalan:

    ```
    Database connected.
    🚀 Server running at http://localhost:8080
    ```

### 🧪 Pengujian API

1.  **Gunakan Postman:** Buka Postman dan impor *file* **`MyRecipeApp_API_Collection.json`** untuk melakukan pengujian ke semua *endpoint* API.

***

## 📂 Struktur Backend

Struktur proyek diatur berdasarkan peran dan tanggung jawab setiap direktori.

| Direktori/File | Deskripsi |
| :--- | :--- |
| `cmd/main.go` | **Entry Point** aplikasi; inisialisasi server, koneksi database, dan pendaftaran rute. |
| `internal/config/config.go` | Memuat konfigurasi aplikasi (DB, JWT *secret*, *port*) dari *file* `.env`. |
| `internal/database/mysql.go` | Mengelola koneksi ke database MySQL (menggunakan GORM). |
| `internal/authservice/jwt.go` | Logika untuk pembuatan dan validasi JWT token. |
| **Handlers** | |
| `internal/handlers/auth_handler.go` | Mengatur *endpoint* **Register** dan **Login** pengguna. |
| `internal/handlers/recipe_handler.go` | Menangani *endpoint* untuk mendapatkan daftar dan pencarian resep. |
| `internal/handlers/favorite_handler.go` | Menangani proses **menambah** atau **menghapus** resep favorit. |
| **Models (Struktur Tabel)** | |
| `internal/models/user.go` | Struktur tabel data pengguna. |
| `internal/models/recipe.go` | Struktur tabel data resep. |
| `internal/models/category.go` | Struktur tabel untuk kategori resep. |
| `internal/models/rating.go` | Struktur tabel untuk sistem *rating* resep. |
| `internal/models/favorite.go` | Struktur tabel untuk fitur favorit. |
| **Routes (Endpoint)** | |
| `internal/routes/auth_routes.go` | Rute API yang terkait dengan **autentikasi**. |
| `internal/routes/recipe_routes.go` | Rute untuk menampilkan daftar resep dan detail. |
| `internal/routes/admin.go` | Rute API khusus untuk **Admin** (CRUD resep). |
| **Aset SQL & Postman** | |
| `myrecipe.sql` | Skrip SQL pembuatan skema tabel. |
| `query_dummy.sql` | Skrip SQL data dummy. |
| `MyRecipeApp_API_Collection.json` | Koleksi *endpoint* untuk diuji di **Postman**. |

***

## 🗺️ Progress & Arsitektur

Berikut adalah diagram yang menunjukkan arsitektur dan modul utama dari proyek backend ini.

**Struktur Backend (Diagram)**

<p align="center">
  <img src="https://github.com/user-attachments/assets/f5114a2c-4029-4a8a-b671-8c910c3b7d62" alt="Struktur diagram backend" width="650"/>
</p>
