# 🧑‍🍳 MyRecipeApp - Aplikasi Resep Masakan

Aplikasi untuk mengelola resep masakan yang terdiri dari **aplikasi mobile** (Flutter) dan **server backend** (Go). Aplikasi ini memungkinkan pengguna untuk melihat resep, mencari berdasarkan bahan, dan menyimpan resep favorit.

## 🎯 Apa yang Bisa Dilakukan?

### Untuk Pengguna Biasa:
- 📱 **Lihat Resep** - Daftar semua resep masakan
- 🔍 **Cari Resep** - Cari resep berdasarkan bahan yang ada
- ❤️ **Simpan Favorit** - Tandai resep yang disukai
- 🔐 **Login/Register** - Buat akun dan masuk ke aplikasi

### Untuk Admin:
- ➕ **Tambah Resep** - Tambahkan resep baru ke database
- 👥 **Kelola User** - Lihat daftar pengguna

## 🛠 Teknologi yang Digunakan

| Bagian | Teknologi | Fungsi |
|--------|-----------|--------|
| **Aplikasi Mobile** | Flutter | Tampilan aplikasi di HP/komputer |
| **Server** | Go | Mengolah data dan API |
| **Database** | MySQL | Menyimpan data resep dan user |
| **Deployment** | Docker | Cara menjalankan aplikasi |

## 📁 Struktur Proyek

```
myrecipeapp/
├── backend/              # Server aplikasi (Go)
├── frontend_flutter/     # Aplikasi mobile (Flutter)  
├── db/                   # Database dan data contoh
├── postman/              # File untuk testing API
└── README.md            # File ini
```

## 🚀 Cara Menjalankan Aplikasi

### Cara Mudah (Pakai Docker)

1. **Pastikan Docker sudah terinstall**
2. **Buka terminal dan ketik:**
   ```bash
   cd /path/to/myrecipeapp
   docker compose up -d --build
   ```
3. **Tunggu sampai selesai, lalu buka:**
   - **API Server:** http://localhost:8081
   - **Database:** localhost:3306

### Cara Manual (Tanpa Docker)

1. **Setup Database MySQL:**
   - Buat database baru bernama `myrecipe`
   - Import file `db/myrecipe.sql` dan `db/query_dummy.sql`

2. **Jalankan Server:**
   ```bash
   cd backend
   go run cmd/main.go
   ```

3. **Jalankan Aplikasi Mobile:**
   ```bash
   cd frontend_flutter
   flutter pub get
   flutter run
   ```

## 📱 Cara Menggunakan API

### Login User
```bash
curl -X POST http://localhost:8081/auth/login \
  -H 'Content-Type: application/json' \
  -d '{"email":"user1@mail.com","password":"12345"}'
```

### Lihat Semua Resep
```bash
curl http://localhost:8081/recipes/
```

### Cari Resep Berdasarkan Bahan
```bash
curl 'http://localhost:8081/recipes/search?ingredient=telur'
```

### Tambah ke Favorit
```bash
curl -X POST http://localhost:8081/favorites/toggle \
  -H 'Content-Type: application/json' \
  -H "Authorization: Bearer TOKEN_ANDA" \
  -d '{"user_id":1,"recipe_id":2}'
```

## 📊 Hasil Testing

### 📄 Laporan yang Tersedia
- **`LAPORAN_PENGUJIAN_LENGKAP_ALP.pdf`** - Laporan lengkap testing
- **`ALP_Laporan.pdf`** - Laporan sederhana dengan link GitHub

### ✅ Fitur yang Sudah Bekerja
- ✅ Login dan register user
- ✅ Lihat daftar resep
- ✅ Cari resep berdasarkan bahan
- ✅ Simpan/hapus dari favorit
- ✅ Admin bisa tambah resep
- ✅ Aplikasi mobile dengan UI yang bagus
- ✅ Penyimpanan session login

### ❌ Fitur yang Belum Selesai
- ❌ Halaman detail resep per ID
- ❌ Daftar kategori resep
- ❌ Lihat daftar favorit user

### 📈 Statistik Testing
| Komponen | Jumlah Test | Berhasil | Persentase |
|----------|-------------|----------|------------|
| Server API | 8 | 6 | 75% |
| Aplikasi Mobile | 10 | 10 | 100% |
| Database | 3 | 3 | 100% |
| **TOTAL** | **21** | **19** | **90%** |

## 🔧 Untuk Developer

### Menjalankan Server
```bash
cd backend
go run cmd/main.go
```

### Menjalankan Aplikasi Mobile
```bash
cd frontend_flutter
flutter pub get
flutter run
```

### Cek Database
```bash
docker exec -it myrecipe-mysql mysql -uroot -pyourpassword
```

### Lihat Log Aplikasi
```bash
docker logs -f myrecipe-backend
```

## 🌐 Link GitHub
**Repository:** https://github.com/Derys69/myrecipe_backend

## 📝 Informasi Penting
- **Akun Admin:** `admin@mail.com` / `admin123`
- **Akun User Contoh:** `user1@mail.com` / `12345`
- Database otomatis terisi data contoh saat pertama kali dijalankan
- Semua password dan token disimpan dengan aman

## 🤝 Cara Berkontribusi
1. Fork repository ini
2. Buat branch baru untuk fitur
3. Lakukan perubahan
4. Test dengan baik
5. Kirim pull request

---

**Dibuat untuk ALP (Applied Learning Project) - Modul 4** ❤️

### Opsi A: Jalankan dengan Docker (Direkomendasikan)

1. Pastikan Docker & Docker Compose terpasang.
2. Jalankan layanan:
   - `cd /home/fadi/Downloads/code/.vscode/UC_ALP/myrecipeapp`
   - `docker compose up -d --build`
3. Layanan yang berjalan:
   - MySQL: container `myrecipe-mysql` (port 3306)
   - Backend: container `myrecipe-backend` (host port 8081 → container 8080)
4. Database otomatis terbuat dan terisi data dummy dari `db/myrecipe.sql` dan `db/query_dummy.sql` saat container MySQL pertama kali start.
5. Uji cepat:
   - `curl -sS http://localhost:8081/recipes/ | jq` (list resep)

Catatan:
- Backend membaca konfigurasi dari environment container (sudah di-setup di `docker-compose.yml`).
- Jika port 8081 bentrok, ubah mapping di `docker-compose.yml` pada service `backend` bagian `ports`.

### Opsi B: Jalankan lokal (tanpa Docker)

1. Siapkan database MySQL dan buat database baru bernama 'myrecipe'.
2. Jalankan file SQL berikut secara berurutan:
   - `db/myrecipe.sql` → membuat tabel utama.
   - `db/query_dummy.sql` → menambahkan data dummy.
3. Pastikan file `.env` di folder `backend/` sudah berisi konfigurasi yang benar, contoh:

   DB_USER=root
   DB_PASSWORD=yourpassword
   DB_HOST=localhost
   DB_PORT=3306
   DB_NAME=myrecipe
   JWT_SECRET=supersecretkey
   PORT=8080

4. Jalankan aplikasi dengan perintah:
   - `cd backend`
   - `go run cmd/main.go`

Jika semua konfigurasi benar, log akan menampilkan:
   Connected to MySQL database
   Server running on port 8080

### Struktur Proyek (ringkas)

myrecipeapp/
  backend/        # Go source (cmd/main.go, internal/*, pkg/database/*)
  db/             # SQL schema dan data dummy
  postman/        # Koleksi Postman
  docker-compose.yml

### Contoh Pengujian dengan curl (Docker, port 8081)

# Recipes
curl -sS http://localhost:8081/recipes/ | jq
curl -sS 'http://localhost:8081/recipes/search?ingredient=telur' | jq

# Auth
curl -sS -X POST http://localhost:8081/auth/register \
  -H 'Content-Type: application/json' \
  -d '{"email":"user1@mail.com","password":"12345"}' | jq

curl -sS -X POST http://localhost:8081/auth/login \
  -H 'Content-Type: application/json' \
  -d '{"email":"user1@mail.com","password":"12345"}' | jq

# Simpan token (contoh):
# TOKEN=$(curl -sS -X POST http://localhost:8081/auth/login -H 'Content-Type: application/json' -d '{"email":"user1@mail.com","password":"12345"}' | jq -r '.token')

# Favorites (toggle)
curl -sS -X POST http://localhost:8081/favorites/toggle \
  -H 'Content-Type: application/json' \
  -H "Authorization: Bearer $TOKEN" \
  -d '{"user_id":1,"recipe_id":2}' | jq

### Pengujian per Modul (ringkas)

- cmd/main.go (server & koneksi DB)
  - Start: `docker compose up -d --build`
  - Cek hidup: `curl http://localhost:8081/recipes/`
  - Log backend: `docker logs -f myrecipe-backend`

- internal/authservice/jwt.go (JWT)
  - Login ambil token: `curl -sS -X POST http://localhost:8081/auth/login -H 'Content-Type: application/json' -d '{"email":"user1@mail.com","password":"12345"}'`

- internal/config/config.go (config/ENV)
  - Pada Docker: dicek via perilaku server (terhubung DB, endpoint OK). Ubah env di `docker-compose.yml` bila perlu.

- internal/handlers/auth_handler.go
  - Register: `curl -sS -X POST http://localhost:8081/auth/register -H 'Content-Type: application/json' -d '{"email":"someone@mail.com","password":"12345"}'`
  - Login: lihat contoh di atas (ambil `token`).

- internal/handlers/recipe_handler.go
  - List: `curl -sS http://localhost:8081/recipes/ | jq`
  - Search: `curl -sS 'http://localhost:8081/recipes/search?ingredient=telur' | jq`

- internal/handlers/favorite_handler.go
  - TOKEN dari login: `TOKEN=...`
  - Toggle: `curl -sS -X POST http://localhost:8081/favorites/toggle -H "Authorization: Bearer $TOKEN" -H 'Content-Type: application/json' -d '{"user_id":1,"recipe_id":2}' | jq`

- internal/models/*.go
  - Tervalidasi via endpoint terkait. Rating dapat dicek langsung di DB: `docker exec -it myrecipe-mysql mysql -uroot -pyourpassword -e "SELECT * FROM myrecipe.ratings LIMIT 5;"`

- internal/routes/*.go
  - Auth/Recipes/Favorites diuji via curl di atas. Admin endpoints (CRUD resep) gunakan token admin (`admin@mail.com` / `admin123`) jika tersedia.

### Catatan endpoint yang belum tersedia
- GET `/recipes/{id}` (detail resep) — belum diimplementasikan.
- GET `/favorites/{user_id}` (list favorit per user) — belum diimplementasikan.
- GET `/categories` (list kategori) — belum diimplementasikan.

- internal/database/mysql.go
  - Bukti koneksi: server start OK dan endpoint bekerja. Stress test koneksi: `docker stop myrecipe-mysql` → endpoint gagal; `docker start myrecipe-mysql` → pulih.

- SQL & Postman
  - SQL: `docker exec -it myrecipe-mysql mysql -uroot -pyourpassword -e "SHOW TABLES FROM myrecipe;"`
  - Postman: import `postman/MyRecipeApp_API_Collection.json`, set base URL `http://localhost:8081`, urutkan Auth → Recipes → Favorites → Categories → Admin (opsional).

### Catatan dari percapakan.txt
- Arsitektur mengikuti pola MVC sederhana: `cmd/`, `internal/config`, `internal/handlers`, `internal/models`, `internal/routes`, `pkg/database`.
- `.env` dan SQL (`myrecipe.sql`, `query_dummy.sql`) wajib ada untuk koneksi dan data awal.
- Koleksi Postman: `postman/MyRecipeApp_API_Collection.json` untuk uji endpoint.
## MyRecipeApp

Backend REST API for managing recipes, favorites, categories, and auth (JWT). Built with Go + MySQL. Includes Postman collection and SQL schema + seed data.

### Structure
```
myrecipeapp/
  backend/        # Go source (cmd/main.go, internal/*, pkg/database/*)
  db/             # SQL schema and dummy data, .env.example
  postman/        # Postman collection
```

### Requirements
- Go 1.21+ (recommended)
- MySQL 8+

### Database Setup
1) Create schema and tables:
```
mysql -u <user> -p < /home/fadi/Downloads/code/myrecipeapp/db/myrecipe.sql
```
2) Load sample data (optional):
```
mysql -u <user> -p myrecipe < /home/fadi/Downloads/code/myrecipeapp/db/query_dummy.sql
```

### Configuration
Environment variables needed by the backend:
```
DB_USER=your_db_user
DB_PASSWORD=your_db_password
DB_HOST=localhost
DB_PORT=3306
DB_NAME=myrecipe
JWT_SECRET=supersecretkey
PORT=8080
```
Quick start:
```
cp db/.env.example backend/.env
```

### Run the server
```
cd backend
go run cmd/main.go
```
Server will listen on http://localhost:8080 by default.

### Try the API (Postman)
Import `postman/MyRecipeApp_API_Collection.json` and use these sample endpoints:
- Auth: POST /auth/register, POST /auth/login
- Recipes: GET /recipes/, GET /recipes/search?ingredient=telur, GET /recipes/{id}
- Favorites: POST /favorites/toggle, GET /favorites/{user_id}
- Categories: GET /categories

Note: Protected routes require Authorization: Bearer <JWT> from the login response.

### Notes
- Roles: `admin` and `member`. Admin endpoints for managing recipes/categories may require admin JWT.
- If MySQL runs on a non-default host/port, adjust `.env` accordingly.

