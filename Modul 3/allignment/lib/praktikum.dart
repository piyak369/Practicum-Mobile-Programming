import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cuaca',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Nama kota
              Center(
                child: Text(
                  'Malang',
                  style: TextStyle(fontSize: 40),
                ),
              ),
              // Suhu saat ini
              Center(
                child: Text(
                  '25\u00B0',
                  style: TextStyle(fontSize: 120),
                ),
              ),
              // Prakiraan 3 hari
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  PrakiraanHari(
                    hari: 'Minggu',
                    ikon: Icons.sunny,
                    suhu: '20\u00B0C',
                  ),
                  PrakiraanHari(
                    hari: 'Senin',
                    ikon: Icons.cloudy_snowing,
                    suhu: '23\u00B0C',
                  ),
                  PrakiraanHari(
                    hari: 'Selasa',
                    ikon: Icons.cloud,
                    suhu: '22\u00B0C',
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

/// Widget kustom: satu kolom prakiraan (hari, ikon, suhu).
class PrakiraanHari extends StatelessWidget {
  final String hari;
  final IconData ikon;
  final String suhu;

  const PrakiraanHari({
    Key? key,
    required this.hari,
    required this.ikon,
    required this.suhu,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(hari, style: const TextStyle(fontSize: 14)),
        const SizedBox(height: 12),
        Icon(ikon, size: 32),
        const SizedBox(height: 12),
        Text(suhu, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}