import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pemutar Musik',
      theme: ThemeData.dark(),
      home: Scaffold(
        body: const Center(
          child: Text('Pemutar Musik'),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          color: Colors.black54,
          child: const Row(
            children: [
              Expanded(
                child: Icon(Icons.shuffle, color: Colors.white),
              ),
              Expanded(
                child: Icon(Icons.skip_previous, color: Colors.white),
              ),
              Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: Icon(Icons.play_circle_fill,
                    color: Colors.white, size: 56),
              ),
              Expanded(
                child: Icon(Icons.skip_next, color: Colors.white),
              ),
              Expanded(
                child: Icon(Icons.repeat, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
