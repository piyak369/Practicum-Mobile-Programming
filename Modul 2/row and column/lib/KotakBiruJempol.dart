import 'package:flutter/material.dart';

class KotakBiruJempol extends StatelessWidget {
  final Color warna;
  final String teks;
  final double ukuran;

  const KotakBiruJempol({
    super.key,
    this.warna = Colors.blue,
    required this.teks,
    this.ukuran = 100,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: ukuran,
          height: ukuran,
          decoration: BoxDecoration(
            color: warna,
            border: Border.all(
              color: Colors.black,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.center,
          child: const Icon(
            Icons.favorite,
            color: Colors.red,
            size: 40,
          ),
        ),
        const SizedBox(height: 8),
        Text(teks),
      ],
    );
  }
}
