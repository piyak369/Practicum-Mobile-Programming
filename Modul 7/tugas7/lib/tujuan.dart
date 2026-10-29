
import 'package:flutter/material.dart';

class TujuanPage extends StatelessWidget {
  const TujuanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFF492F),
      appBar: AppBar(
        title: const Text('Ini Halaman Tujuan'),
        backgroundColor: const Color(0xFFFF492F),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Untuk berpindah ke halaman baru, gunakan metode '
                  'Navigator.push(). Metode push() akan menambahkan '
                  'route ke dalam tumpukan Route yang dikelola oleh '
                  'Navigator. Kamu juga dapat menggunakan '
                  'MaterialPageRoute, yang memiliki animasi transisi '
                  'sesuai dengan platform yang digunakan.',
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
                  Icons.beach_access_rounded,
                  size: 120,
                  color: Color(0xFFFF492F),
                ),
              ),
            ),

            const SizedBox(height: 28),

            const Text(
              'Untuk menutup halaman kedua dan kembali ke '
                  'halaman pertama, gunakan metode Navigator.pop(). '
                  'Metode pop() akan menghapus route saat ini dari '
                  'tumpukan Route yang dikelola oleh Navigator.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),

            const SizedBox(height: 28),

            Center(
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0785C9),
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
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.chevron_left),
                label: const Text('Kembali ke home'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
