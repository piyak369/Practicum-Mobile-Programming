# 📱 Katalog Produk Flutter

Aplikasi katalog produk berbasis Flutter yang mengambil data dari [DummyJSON API](https://dummyjson.com/products?limit=100). Proyek ini dibuat untuk memenuhi tugas Ujian Tengah Semester (UTS) mata kuliah Mobile Programming.

## 📖 Deskripsi Proyek

Katalog Produk Flutter merupakan aplikasi mobile yang menampilkan informasi produk dari API secara dinamis. Aplikasi ini dikembangkan menggunakan Flutter dan bahasa pemrograman Dart, dengan HTTP request untuk mengambil data serta JSON decoding untuk mengolah respons API.

Melalui aplikasi ini, pengguna dapat melihat daftar produk, mencari produk berdasarkan kata kunci, mengurutkan harga, dan membuka halaman detail produk.

## ✨ Fitur Aplikasi

- **Daftar Produk** — menampilkan data produk yang diperoleh dari API.
- **Pencarian Produk** — membantu pengguna menemukan produk berdasarkan kata kunci.
- **Pengurutan Harga** — mengurutkan produk berdasarkan harga dari terendah atau tertinggi.
- **Detail Produk** — menampilkan informasi lebih lanjut mengenai produk yang dipilih.
- **Memuat Ulang Data** — memungkinkan pengguna mengambil kembali data produk.
- **Penanganan Loading dan Error** — memberikan respons saat data sedang dimuat atau terjadi kendala.
- **Penanganan Hasil Pencarian Kosong** — memberikan informasi ketika produk yang dicari tidak ditemukan.

## 🛠️ Teknologi yang Digunakan

| Teknologi | Kegunaan |
|---|---|
| Flutter | Framework pengembangan aplikasi mobile |
| Dart | Bahasa pemrograman aplikasi |
| HTTP | Mengirim permintaan ke API |
| `dart:convert` | Mengolah data JSON |
| DummyJSON API | Menyediakan data produk |
| Visual Studio Code | Editor kode |

## 🌐 Sumber Data API

Aplikasi menggunakan endpoint berikut untuk mengambil data produk:

`https://dummyjson.com/products?limit=100`

API menyediakan data produk dalam format JSON yang kemudian diolah dan ditampilkan pada antarmuka aplikasi.

## 📂 Struktur Proyek

```text
Mobile-Programming/
├── android/
├── lib/
├── test/
├── README.md
├── pubspec.yaml
└── pubspec.lock
```

Keterangan:

- `android/` — konfigurasi dan berkas pendukung platform Android.
- `lib/` — kode sumber utama aplikasi Flutter.
- `test/` — berkas pengujian aplikasi.
- `README.md` — dokumentasi proyek.
- `pubspec.yaml` — konfigurasi proyek dan dependensi.
- `pubspec.lock` — catatan versi dependensi yang digunakan.

## ⚙️ Persyaratan

Sebelum menjalankan aplikasi, pastikan perangkat pengembangan sudah memiliki:

- Flutter SDK.
- Dart SDK yang sesuai dengan versi Flutter.
- Visual Studio Code atau editor Flutter lainnya.
- Android Emulator atau perangkat Android.
- Koneksi internet untuk mengambil data dari API.

## 🚀 Cara Menjalankan Aplikasi

1. Clone repository:

   ```bash
   git clone https://github.com/piyak369/Mobile-Programming.git
   ```

2. Masuk ke direktori proyek:

   ```bash
   cd Mobile-Programming
   ```

3. Unduh dependensi:

   ```bash
   flutter pub get
   ```

4. Periksa konfigurasi Flutter:

   ```bash
   flutter doctor
   ```

5. Jalankan aplikasi pada emulator atau perangkat yang terhubung:

   ```bash
   flutter run
   ```

Pastikan perangkat memiliki akses internet agar aplikasi dapat mengambil data produk dari API.

## 🧪 Pengujian Aplikasi

Pengujian dapat dilakukan untuk memeriksa beberapa fungsi berikut:

| No. | Skenario Pengujian | Hasil yang Diharapkan |
|---|---|---|
| 1 | Membuka aplikasi | Daftar produk ditampilkan |
| 2 | Mencari produk | Produk sesuai kata kunci ditampilkan |
| 3 | Mengurutkan harga terendah | Produk diurutkan dari harga terendah |
| 4 | Mengurutkan harga tertinggi | Produk diurutkan dari harga tertinggi |
| 5 | Memilih produk | Halaman detail produk terbuka |
| 6 | Memuat ulang data | Aplikasi mencoba mengambil data kembali |
| 7 | Mencari produk yang tidak tersedia | Informasi hasil pencarian kosong ditampilkan |
| 8 | Koneksi internet bermasalah | Aplikasi menangani kegagalan pengambilan data |

*Catatan: hasil pengujian perlu disesuaikan dengan hasil yang benar-benar diperoleh saat aplikasi dijalankan.*

## 🎯 Tujuan Pembelajaran

Proyek ini bertujuan untuk menerapkan konsep pengembangan aplikasi mobile menggunakan Flutter, meliputi:

- Pembuatan antarmuka aplikasi.
- Pengambilan data dari REST API.
- Pengolahan respons JSON.
- Pengelolaan dan penampilan data produk.
- Implementasi pencarian dan pengurutan data.
- Penanganan kondisi loading dan error.
- Pengujian fungsi aplikasi.

## 👩‍💻 Identitas Pengembang

- **Nama:** Tria Nur Hidayah
- **Program Studi:** Teknik Informatika
- **Fakultas:** Sains dan Teknologi
- **Perguruan Tinggi:** UIN Maulana Malik Ibrahim Malang
- **Mata Kuliah:** Mobile Programming
- **Jenis Tugas:** Ujian Tengah Semester (UTS)

## 📝 Penutup

Proyek Katalog Produk Flutter merupakan implementasi pembelajaran pengembangan aplikasi mobile yang mengintegrasikan antarmuka Flutter dengan pengambilan data dari API. Diharapkan proyek ini dapat membantu memahami proses pengembangan aplikasi yang mampu menampilkan dan mengelola data secara dinamis.
