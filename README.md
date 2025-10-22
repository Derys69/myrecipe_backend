# 🧑‍🍳 MyRecipeApp - Full Stack Recipe Management Application

A comprehensive recipe management application built with **Go backend** and **Flutter frontend**, featuring user authentication, recipe management, favorites system, and admin panel.

## 📋 Table of Contents
- [Features](#-features)
- [Tech Stack](#-tech-stack)
- [Project Structure](#-project-structure)
- [Quick Start](#-quick-start)
- [API Documentation](#-api-documentation)
- [Testing Reports](#-testing-reports)
- [Development](#-development)

## ✨ Features

### Backend (Go + MySQL)
- 🔐 **JWT Authentication** - Secure user registration and login
- 📝 **Recipe Management** - CRUD operations for recipes
- 🔍 **Search Functionality** - Search recipes by ingredients
- ❤️ **Favorites System** - Add/remove recipes from favorites
- 👨‍💼 **Admin Panel** - Admin-only recipe creation
- 🗄️ **Database** - MySQL with proper relationships

### Frontend (Flutter)
- 📱 **Cross-platform** - Runs on mobile, web, and desktop
- 🎨 **Material Design** - Modern UI with light/dark themes
- 🔄 **State Management** - Provider pattern for reactive UI
- 🌐 **API Integration** - Seamless backend communication
- 💾 **Session Management** - Persistent login with SharedPreferences
- 🧭 **Navigation** - Go Router for smooth page transitions

## 🛠 Tech Stack

| Component | Technology |
|-----------|------------|
| **Backend** | Go 1.24, GORM, JWT |
| **Database** | MySQL 8.0 |
| **Frontend** | Flutter 3.9+, Provider, Go Router |
| **Deployment** | Docker, Docker Compose |
| **Testing** | curl, Postman Collection |

## 📁 Project Structure

```
myrecipeapp/
├── backend/                 # Go REST API
│   ├── cmd/main.go         # Application entry point
│   ├── internal/           # Internal packages
│   │   ├── handlers/       # HTTP handlers
│   │   ├── models/         # Data models
│   │   ├── routes/         # API routes
│   │   ├── middleware/     # Auth middleware
│   │   └── config/         # Configuration
│   └── pkg/database/       # Database connection
├── frontend_flutter/        # Flutter mobile app
│   ├── lib/
│   │   ├── src/
│   │   │   ├── pages/      # UI pages
│   │   │   ├── api_client.dart # HTTP client
│   │   │   └── session.dart    # Session management
│   │   └── main.dart       # App entry point
├── db/                     # Database schema & data
│   ├── myrecipe.sql       # Database schema
│   └── query_dummy.sql    # Sample data
├── postman/               # API testing collection
├── docker-compose.yml     # Container orchestration
└── README.md             # This file
```

## 🚀 Quick Start

### Prerequisites
- Docker & Docker Compose
- Go 1.21+ (for local development)
- Flutter 3.9+ (for frontend development)
- MySQL 8+ (for local development)

### Option A: Docker (Recommended)

1. **Clone and navigate to project:**
   ```bash
   cd /path/to/myrecipeapp
   ```

2. **Start services:**
   ```bash
   docker compose up -d --build
   ```

3. **Services running:**
   - **Backend API:** http://localhost:8081
   - **MySQL Database:** localhost:3306
   - **Database:** `myrecipe` (auto-created with sample data)

4. **Test the API:**
   ```bash
   curl -sS http://localhost:8081/recipes/ | jq
   ```

### Option B: Local Development

1. **Setup Database:**
   ```bash
   mysql -u root -p < db/myrecipe.sql
   mysql -u root -p myrecipe < db/query_dummy.sql
   ```

2. **Configure Environment:**
   ```bash
   cp db/.env.example backend/.env
   # Edit backend/.env with your database credentials
   ```

3. **Run Backend:**
   ```bash
   cd backend
   go run cmd/main.go
   ```

4. **Run Frontend:**
   ```bash
   cd frontend_flutter
   flutter pub get
   flutter run
   ```

## 📚 API Documentation

### Authentication Endpoints
```bash
# Register new user
curl -X POST http://localhost:8081/auth/register \
  -H 'Content-Type: application/json' \
  -d '{"email":"user@example.com","password":"password123"}'

# Login user
curl -X POST http://localhost:8081/auth/login \
  -H 'Content-Type: application/json' \
  -d '{"email":"user@example.com","password":"password123"}'
```

### Recipe Endpoints
```bash
# Get all recipes
curl http://localhost:8081/recipes/

# Search recipes by ingredient
curl 'http://localhost:8081/recipes/search?ingredient=telur'

# Toggle favorite (requires JWT token)
curl -X POST http://localhost:8081/favorites/toggle \
  -H 'Content-Type: application/json' \
  -H "Authorization: Bearer YOUR_JWT_TOKEN" \
  -d '{"user_id":1,"recipe_id":2}'
```

### Admin Endpoints
```bash
# Create recipe (admin only)
curl -X POST http://localhost:8081/admin/recipes \
  -H 'Content-Type: application/json' \
  -H "Authorization: Bearer ADMIN_JWT_TOKEN" \
  -d '{"title":"New Recipe","description":"Recipe description","ingredients":"ingredient1,ingredient2","steps":"step1,step2","category_id":1}'
```

**📋 Complete API Collection:** Import `postman/MyRecipeApp_API_Collection.json` into Postman for full API testing.

## 📊 Testing Reports

### 📄 Available Reports
- **`LAPORAN_PENGUJIAN_LENGKAP_ALP.pdf`** - Comprehensive testing report (Backend + Frontend)
- **`ALP_Laporan.pdf`** - Simple progress report with GitHub link

### 🧪 Test Results Summary
| Component | Test Cases | Passed | Success Rate |
|-----------|------------|--------|--------------|
| Backend API | 8 | 6 | 75% |
| Frontend UI | 10 | 10 | 100% |
| Database | 3 | 3 | 100% |
| Integration | 5 | 4 | 80% |
| **TOTAL** | **26** | **23** | **88%** |

### ✅ Working Features
- ✅ User authentication (register/login)
- ✅ Recipe listing and search
- ✅ Favorites management
- ✅ Admin recipe creation
- ✅ Flutter UI with state management
- ✅ API integration
- ✅ Session persistence

### ⚠️ Known Issues
- ❌ Recipe detail endpoint (`/recipes/{id}`) - Not implemented
- ❌ Categories endpoint (`/categories`) - Not implemented  
- ❌ User favorites list (`/favorites/{user_id}`) - Not implemented
- ⚠️ Authentication middleware inconsistency on favorites

## 🔧 Development

### Backend Development
```bash
cd backend
go mod tidy
go run cmd/main.go
```

### Frontend Development
```bash
cd frontend_flutter
flutter pub get
flutter run
```

### Database Management
```bash
# Connect to MySQL container
docker exec -it myrecipe-mysql mysql -uroot -pyourpassword

# View tables
SHOW TABLES FROM myrecipe;

# Check data
SELECT * FROM myrecipe.recipes LIMIT 5;
```

### Logs and Debugging
```bash
# Backend logs
docker logs -f myrecipe-backend

# Database logs  
docker logs -f myrecipe-mysql

# Check service status
docker compose ps
```

## 🌐 GitHub Repository
**Repository:** https://github.com/Derys69/myrecipe_backend

## 📝 Notes
- Default admin credentials: `admin@mail.com` / `admin123`
- Sample user credentials: `user1@mail.com` / `12345`
- Database automatically initializes with sample data on first run
- All sensitive data (passwords, tokens) should be configured via environment variables

## 🤝 Contributing
1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

---

**Built with ❤️ for ALP (Applied Learning Project) - Modul 4**

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

