
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'screen_arguments.dart';
import 'tujuan.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? title;
  String? thumbnail;
  String? shortDescription;
  String? description;
  String? genre;
  String? platform;
  String? publisher;
  String? release;
  String? cover;

  bool isLoading = true;
  String? errorMessage;

  Future<void> getGame(String gameId) async {
    try {
      final response = await http.get(
        Uri.parse(
          'https://www.freetogame.com/api/game?id=$gameId',
        ),
      );

      if (response.statusCode != 200) {
        throw Exception(
          'Gagal mengambil data game (${response.statusCode}).',
        );
      }

      final Map<String, dynamic> result =
      jsonDecode(response.body) as Map<String, dynamic>;

      final List<dynamic> screenshots =
          result['screenshots'] as List<dynamic>? ?? [];

      if (!mounted) return;

      setState(() {
        title = result['title']?.toString() ?? 'Tanpa judul';
        thumbnail = result['thumbnail']?.toString() ?? '';
        shortDescription =
            result['short_description']?.toString() ?? '';
        description = result['description']?.toString() ??
            'Deskripsi tidak tersedia.';
        genre = result['genre']?.toString() ?? '-';
        platform = result['platform']?.toString() ?? '-';
        publisher = result['publisher']?.toString() ?? '-';
        release = result['release_date']?.toString() ?? '-';

        cover = screenshots.isNotEmpty
            ? screenshots[0]['image']?.toString() ?? thumbnail
            : thumbnail;

        isLoading = false;
        errorMessage = null;
      });
    } catch (e) {
      if (!mounted) return;

      setState(() {
        isLoading = false;
        errorMessage = 'Data game gagal dimuat.\n$e';
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getGame('475');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0081C9),
      body: SafeArea(
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator(
            color: Colors.white,
          )
              : errorMessage != null
              ? Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  errorMessage!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isLoading = true;
                      errorMessage = null;
                    });
                    getGame('475');
                  },
                  child: const Text('Coba lagi'),
                ),
              ],
            ),
          )
              : GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                Tujuan.routeName,
                arguments: ScreenArguments(
                  cover ?? thumbnail ?? '',
                  title ?? 'Tanpa judul',
                  description ?? 'Deskripsi tidak tersedia.',
                  shortDescription ?? '',
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.network(
                    thumbnail ?? '',
                    height: 130,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const SizedBox(
                        height: 130,
                        child: Icon(
                          Icons.videogame_asset,
                          size: 70,
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 12),
                  Text(
                    title ?? '',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Genre: ${genre ?? "-"}',
                              style: const TextStyle(
                                color: Colors.black87,
                                fontSize: 11,
                              ),
                            ),
                            Text(
                              'Platform: ${platform ?? "-"}',
                              style: const TextStyle(
                                color: Colors.black87,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Publisher: ${publisher ?? "-"}',
                              style: const TextStyle(
                                color: Colors.black87,
                                fontSize: 11,
                              ),
                            ),
                            Text(
                              'Release: ${release ?? "-"}',
                              style: const TextStyle(
                                color: Colors.black87,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
