USE myrecipe;

-- USERS (dengan role)
INSERT INTO users (email, password, role) VALUES
('admin@mail.com', 'admin123', 'admin'),
('member1@mail.com', '12345', 'member'),
('member2@mail.com', '12345', 'member');

-- CATEGORIES
INSERT INTO categories (name) VALUES
('Makanan Utama'),
('Makanan Ringan'),
('Minuman');

-- RECIPES
INSERT INTO recipes (title, description, ingredients, steps, category_id) VALUES
('Nasi Goreng Telur', 'Resep sederhana nasi goreng telur', 'nasi, telur, bawang, kecap', '1. Tumis bawang, 2. Masukkan telur, 3. Tambah nasi & kecap, 4. Sajikan', 1),
('Pisang Goreng', 'Cemilan manis dan ringan', 'pisang, tepung, minyak goreng', '1. Kupas pisang, 2. Celup tepung, 3. Goreng hingga kecoklatan', 2),
('Jus Alpukat', 'Minuman sehat dan lezat', 'alpukat, susu, gula, es batu', '1. Blender semua bahan, 2. Sajikan dingin', 3);

-- FAVORITES
INSERT INTO favorites (user_id, recipe_id) VALUES
(2, 1),
(2, 2),
(3, 3);

-- RATINGS
INSERT INTO ratings (user_id, recipe_id, score, comment) VALUES
(2, 1, 5, 'Enak banget!'),
(3, 2, 4, 'Cemilan sore yang pas.'),
(2, 3, 5, 'Segar dan creamy.');
