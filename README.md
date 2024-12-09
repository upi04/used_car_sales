# used_car_sales
Relational Database &amp; SQL Project
Used Car Sales Database Project
Deskripsi Proyek
Proyek ini bertujuan untuk menganalisis data penjualan mobil bekas menggunakan PostgreSQL. Database ini mencakup informasi tentang mobil, riwayat penawaran harga, dan data pengguna. Hasil analisis dari database ini dapat digunakan untuk memahami pola penawaran harga dan popularitas model mobil di pasar.

Struktur Database
Tabel Utama:
products: Menyimpan data mobil (merk, model, tahun, dan harga).
bids: Menyimpan riwayat penawaran harga yang dilakukan pengguna terhadap mobil.
users: Menyimpan informasi pengguna yang memberikan penawaran harga.
ERD:
Diagram hubungan antar tabel dapat ditemukan di folder docs/ dengan nama ERD.png.

Langkah-Langkah Proyek
Pembuatan Database:

Membuat tabel menggunakan perintah DDL.
Struktur tabel tersedia dalam file queries.sql di folder docs/.
Pengisian Data:

Dummy dataset dibuat untuk mengisi tabel utama. Dataset ini tersedia dalam file used_car_sales_backup.sql.
Query Transaksional:

Meliputi penambahan, pengubahan, dan penghapusan data. Contoh query tersedia dalam file queries.sql.
Query Analitik:

Perbandingan rata-rata harga mobil dengan harga penawaran dalam 6 bulan terakhir.
Identifikasi model mobil populer berdasarkan jumlah penawaran.
Backup dan Restore:

Proyek ini juga mencakup cara melakukan backup dan restore database menggunakan perintah pg_dump dan pg_restore.
Hasil Analisis
Model Mobil Paling Populer: Toyota Yaris memiliki jumlah penawaran tertinggi.
Perbedaan Harga Mobil dan Penawaran: Perbedaan harga rata-rata untuk Toyota Yaris dalam 6 bulan terakhir adalah 3,46%.
Analisis Harga Berdasarkan Waktu: Harga penawaran menunjukkan tren kenaikan dalam 6 bulan terakhir.
Kesimpulan
Proyek ini berhasil membangun database penjualan mobil bekas yang terstruktur dan melakukan analisis data untuk memberikan insight tentang pasar mobil bekas. Database ini siap digunakan untuk analisis lebih lanjut atau pengembangan fitur baru.

