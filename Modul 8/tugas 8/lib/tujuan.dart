
import 'package:flutter/material.dart';

import 'screen_arguments.dart';

class Tujuan extends StatelessWidget {
  const Tujuan({super.key});

  static const String routeName = '/extractArguments';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments
    as ScreenArguments;

    return Scaffold(
      backgroundColor: const Color(0xFFF94A29),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: const Color(0xFFF4F8FB),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (args.cover.isNotEmpty)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          args.cover,
                          width: double.infinity,
                          height: 180,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const SizedBox(
                              height: 180,
                              child: Center(
                                child: Icon(
                                  Icons.videogame_asset,
                                  size: 70,
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    else
                      const SizedBox(
                        height: 180,
                        child: Center(
                          child: Icon(Icons.videogame_asset, size: 70),
                        ),
                      ),

                    const SizedBox(height: 15),

                    Center(
                      child: Text(
                        args.title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF002F48),
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      args.description,
                      style: const TextStyle(
                        fontSize: 14,
                        height: 1.4,
                        color: Color(0xFF002F48),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 15,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0081C9),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.arrow_back_ios_outlined,
                        size: 15,
                        color: Color(0xFFF4F8FB),
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Kembali ke game',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFFF4F8FB),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
