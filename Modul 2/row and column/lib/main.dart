import 'package:flutter/material.dart';
import 'KotakBiruJempol.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Row and Column',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Row and Column'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  KotakBiruJempol(
                    warna: Colors.blue,
                    teks: 'Facebook',
                  ),
                  const SizedBox(width: 20),
                  KotakBiruJempol(
                    warna: Colors.yellow,
                    teks: 'Meet',
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  KotakBiruJempol(
                    warna: Colors.orange,
                    teks: 'Shopee',
                  ),
                  const SizedBox(width: 20),
                  KotakBiruJempol(
                    warna: Colors.purple,
                    teks: 'Instagram',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
