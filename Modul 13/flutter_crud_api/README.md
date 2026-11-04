# 📱 Flutter CRUD API

Aplikasi Flutter untuk operasi CRUD (Create, Read, Update, Delete) yang terhubung dengan REST API eksternal [JSONPlaceholder](https://jsonplaceholder.typicode.com/posts). Proyek ini dibuat untuk memenuhi tugas Praktikum Modul XIII mata kuliah Mobile Programming.

## 📖 Deskripsi Proyek

Flutter CRUD API merupakan aplikasi mobile yang menunjukkan cara aplikasi client berkomunikasi dengan server melalui REST API. Aplikasi ini dikembangkan menggunakan Flutter dan bahasa pemrograman Dart, dengan HTTP request untuk mengirim dan menerima data serta JSON decoding untuk mengubah respons server menjadi objek Dart (Model Class).

Melalui aplikasi ini, pengguna dapat menambahkan data baru, melihat data yang tersimpan, memperbarui data, dan menghapus data melalui antarmuka yang interaktif.

## ✨ Fitur Aplikasi

- **Create (Tambah Data)** — menambahkan data baru melalui dialog input Nama dan Pekerjaan menggunakan HTTP POST.
- **Read (Tampil Data)** — menampilkan data hasil respons server dalam bentuk Card yang memuat judul, isi, id, userID, dan waktu pembuatan.
- **Update (Perbarui Data)** — mengubah data melalui menu Update pada PopupMenuButton menggunakan HTTP PUT.
- **Delete (Hapus Data)** — menghapus data menggunakan HTTP DELETE setelah pengguna menyetujui dialog konfirmasi.
- **Validasi Input** — memastikan kolom Nama dan Pekerjaan terisi sebelum data dikirim.
- **Notifikasi SnackBar** — memberikan informasi saat operasi berhasil atau gagal.
- **Penanganan Error** — menampilkan pesan error ketika permintaan ke API gagal, misalnya saat tidak ada koneksi internet.

## 🛠️ Teknologi yang Digunakan

| Teknologi | Kegunaan |
|---|---|
| Flutter | Framework pengembangan aplikasi mobile |
| Dart | Bahasa pemrograman aplikasi |
| `http` (^1.1.0) | Mengirim permintaan ke API (POST, PUT, DELETE) |
| `dart:convert` | Mengolah data JSON |
| `intl` (^0.18.1) | Memformat tanggal dan waktu |
| `google_fonts` (^6.1.0) | Kustomisasi font (Montserrat dan Open Sans) |
| JSONPlaceholder API | Menyediakan REST API untuk pengujian |
| Android Studio | Editor kode dan emulator |

## 🌐 Sumber Data API

Aplikasi menggunakan endpoint berikut:

`https://jsonplaceholder.typicode.com/posts`

| Operasi | Metode HTTP | Endpoint | Status Sukses |
|---|---|---|---|
| Create | POST | `/posts` | 201 |
| Update | PUT | `/posts/1` | 200 |
| Delete | DELETE | `/posts/{id}` | 200 |

JSONPlaceholder merupakan fake API, sehingga permintaan POST, PUT, dan DELETE dibalas seolah-olah berhasil tetapi data tidak benar-benar tersimpan di server. Proses update menggunakan id bernilai 1 karena endpoint tersebut tersedia pada JSONPlaceholder.

## 📂 Struktur Proyek

```text
flutter_crud_api/
├── android/
├── ios/
├── lib/
│   └── main.dart
├── test/
├── README.md
├── pubspec.yaml
└── pubspec.lock
```

Keterangan:

- `android/` — konfigurasi dan berkas pendukung platform Android.
- `ios/` — konfigurasi dan berkas pendukung platform iOS.
- `lib/main.dart` — kode sumber utama yang memuat Model Class `Post`, `MyApp`, dan `HomePage`.
- `test/` — berkas pengujian aplikasi.
- `README.md` — dokumentasi proyek.
- `pubspec.yaml` — konfigurasi proyek dan dependensi.
- `pubspec.lock` — catatan versi dependensi yang digunakan.

## ⚙️ Persyaratan

Sebelum menjalankan aplikasi, pastikan perangkat pengembangan sudah memiliki:

- Flutter SDK.
- Dart SDK yang sesuai dengan versi Flutter.
- Android Studio atau editor Flutter lainnya.
- Android Emulator atau perangkat Android.
- Koneksi internet untuk mengakses API.

## 🚀 Cara Menjalankan Aplikasi

1. Clone repository:

   ```bash
   git clone https://github.com/<username>/flutter_crud_api.git
   ```

2. Masuk ke direktori proyek:

   ```bash
   cd flutter_crud_api
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

Pastikan perangkat memiliki akses internet agar aplikasi dapat berkomunikasi dengan API.

## 🧪 Pengujian Aplikasi

Pengujian dapat dilakukan untuk memeriksa beberapa fungsi berikut:

| No. | Skenario Pengujian | Hasil yang Diharapkan |
|---|---|---|
| 1 | Membuka aplikasi | Tampilan awal dan tombol + ditampilkan |
| 2 | Menekan tombol + | Dialog Tambah Post terbuka |
| 3 | Menyimpan data dengan kolom terisi | Data tampil pada Card |
| 4 | Menyimpan data dengan kolom kosong | SnackBar peringatan ditampilkan |
| 5 | Memilih menu Update | Dialog Update Post terbuka dengan data lama |
| 6 | Menyimpan hasil update | Card diperbarui dan SnackBar berhasil ditampilkan |
| 7 | Memilih menu Delete | Dialog Konfirmasi Hapus ditampilkan |
| 8 | Menekan tombol Hapus | Data terhapus dan SnackBar berhasil ditampilkan |
| 9 | Koneksi internet bermasalah | Pesan error ditampilkan melalui SnackBar |

*Catatan: hasil pengujian perlu disesuaikan dengan hasil yang benar-benar diperoleh saat aplikasi dijalankan.*

## 🎯 Tujuan Pembelajaran

Proyek ini bertujuan untuk menerapkan konsep pengembangan aplikasi mobile menggunakan Flutter, meliputi:

- Pemahaman konsep operasi CRUD dan arsitektur REST API.
- Penggunaan package `http` untuk permintaan POST, PUT, dan DELETE.
- Pengelolaan operasi asinkron dengan `async` dan `await`.
- Parsing data JSON menjadi objek Dart (Model Class).
- Pengelolaan state pada StatefulWidget.
- Pembuatan antarmuka interaktif dengan Card, Dialog, TextField, dan SnackBar.

## 👩‍💻 Identitas Pengembang

- **Nama:** Tria Nur Hidayah
- **Program Studi:** Teknik Informatika
- **Fakultas:** Sains dan Teknologi
- **Perguruan Tinggi:** UIN Maulana Malik Ibrahim Malang
- **Mata Kuliah:** Mobile Programming
- **Jenis Tugas:** Praktikum Modul XIII

## 📝 Penutup

Proyek Flutter CRUD API merupakan implementasi pembelajaran pengembangan aplikasi mobile yang mengintegrasikan antarmuka Flutter dengan REST API. Diharapkan proyek ini dapat membantu memahami proses pembuatan, penampilan, pembaruan, dan penghapusan data secara dinamis.
