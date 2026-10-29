
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0785C9),
      appBar: AppBar(
        title: const Text('Ini Halaman Home'),
        backgroundColor: const Color(0xFF0785C9),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Banyak aplikasi memiliki beberapa layar untuk '
                  'menampilkan informasi yang berbeda. Contohnya, '
                  'ada layar produk, dan ketika pengguna mengklik '
                  'produk, akan muncul layar dengan detail produk tersebut.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),

            const SizedBox(height: 28),

            Center(
              child: Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(
                  Icons.home_rounded,
                  size: 120,
                  color: Color(0xFF0785C9),
                ),
              ),
            ),

            const SizedBox(height: 28),

            const Text(
              'Pertama, kita perlu membuat dua halaman atau '
                  '"routes" yang ingin kita tampilkan. Selanjutnya, '
                  'kita gunakan perintah Navigator.pushNamed() untuk '
                  'berpindah dari halaman pertama ke halaman kedua. '
                  'Terakhir, kita bisa kembali dari halaman kedua '
                  'ke halaman pertama menggunakan Navigator.pop().',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),

            const SizedBox(height: 28),

            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF4B2B),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/tujuan');
                },
                child: const Text('Ke halaman tujuan ❯'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
