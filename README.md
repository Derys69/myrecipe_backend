Progress 
Struktur Backend
<img width="650" height="1023" alt="image" src="https://github.com/user-attachments/assets/f5114a2c-4029-4a8a-b671-8c910c3b7d62" />

•	cmd/main.go → Entry point aplikasi, menjalankan server dan koneksi ke database.
•	internal/authservice/jwt.go → Bertanggung jawab atas pembuatan dan validasi JWT token.
•	internal/config/config.go → Memuat konfigurasi dari file .env seperti database, JWT secret, dan port server.
•	internal/handlers/auth_handler.go → Mengatur proses register dan login pengguna.
•	internal/handlers/recipe_handler.go → Menangani endpoint untuk mendapatkan daftar resep dan pencarian resep berdasarkan bahan.
•	internal/handlers/favorite_handler.go → Menangani proses menambah atau menghapus resep favorit pengguna.
•	internal/models/user.go → Menyimpan struktur tabel untuk data pengguna.
•	internal/models/recipe.go → Struktur tabel untuk data resep.
•	internal/models/category.go → Struktur tabel untuk kategori resep.
•	internal/models/rating.go → Struktur tabel untuk sistem rating resep.
•	internal/models/favorite.go → Struktur tabel untuk fitur favorit antar pengguna dan resep.
•	internal/routes/admin.go → Rute API untuk admin (CRUD resep).
•	internal/routes/auth_routes.go → Rute API untuk autentikasi (login dan register).
•	internal/routes/recipe_routes.go → Rute untuk menampilkan daftar resep.
•	internal/database/mysql.go → Mengatur koneksi ke database MySQL.
•	myrecipe.sql → Script pembuatan tabel database (struktur utama aplikasi).
•	query_dummy.sql → Script yang berisi data dummy untuk pengujian API.
•	.env → Menyimpan konfigurasi koneksi database, JWT secret, dan port server.
•	MyRecipeApp_API_Collection.json → Koleksi endpoint API untuk diuji di Postman.

Cara menjalankan program 

1. Siapkan database MySQL dan buat database baru bernama 'myrecipe'.
2. Jalankan file SQL berikut secara berurutan:
   - myrecipe.sql → untuk membuat tabel utama.
   - query_dummy.sql → untuk menambahkan data dummy.
3. Pastikan file .env sudah berisi konfigurasi yang benar, contoh:
   
   DB_USER=root
   DB_PASSWORD=yourpassword
   DB_HOST=localhost
   DB_PORT=3306
   DB_NAME=myrecipe
   JWT_SECRET=supersecretkey
   PORT=8080

4. Jalankan aplikasi dengan perintah:
   go run cmd/main.go

5. Buka Postman dan impor file MyRecipeApp_API_Collection.json untuk melakukan pengujian endpoint.

Jika semua konfigurasi benar, terminal akan menampilkan pesan:
   Connected to MySQL database
   Server running on port 8080
