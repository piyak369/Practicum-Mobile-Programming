import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Program Pertamaku"),
        ),
        body: const Center(
          child: Text(
            "Tria Nur Hidayah",
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}