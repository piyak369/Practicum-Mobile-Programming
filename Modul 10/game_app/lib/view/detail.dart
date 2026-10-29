
import 'package:flutter/material.dart';
import 'package:game_app/viewmodel/fetchgame.dart';
import 'package:game_app/model/detailgame.dart';
import 'package:readmore/readmore.dart';

class Detail extends StatelessWidget {
  final int gameTerpilih;

  const Detail({super.key, required this.gameTerpilih});

  Future<DetailGame> fetchData() async {
    final jsonData = await fetchDataFromAPI(gameTerpilih);
    return DetailGame.fromJson(jsonData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent.shade400,
      body: FutureBuilder<DetailGame>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Terjadi kesalahan: ${snapshot.error}',
                  textAlign: TextAlign.center,
                ),
              ),
            );
          } else if (!snapshot.hasData) {
            return const Center(
              child: Text('Data tidak tersedia'),
            );
          } else {
            final game = snapshot.data!;

            return Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                        ),
                        child: Image.network(
                          game.thumbnail,
                          fit: BoxFit.cover,
                          height: 300,
                          width: double.infinity,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              height: 300,
                              width: double.infinity,
                              color: Colors.blueGrey.shade100,
                              alignment: Alignment.center,
                              child: const Icon(
                                Icons.broken_image_outlined,
                                size: 50,
                                color: Colors.blueGrey,
                              ),
                            );
                          },
                        ),
                      ),
                      Positioned(
                        top: 25,
                        left: 10,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.grey.withValues(alpha: 0.8),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.arrow_back_ios_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: double.maxFinite,
                              child: Text(
                                'Minimum System Requirements',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54.withValues(
                                    alpha: 0.8,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            _requirementRow(
                              'OS',
                              game.minimumSystemRequirements.os,
                            ),
                            _requirementRow(
                              'Processor',
                              game.minimumSystemRequirements.processor,
                            ),
                            _requirementRow(
                              'Memory',
                              game.minimumSystemRequirements.memory,
                            ),
                            _requirementRow(
                              'Graphics',
                              game.minimumSystemRequirements.graphics,
                            ),
                            _requirementRow(
                              'Storage',
                              game.minimumSystemRequirements.storage,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 200,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    itemCount: game.screenshots.length,
                    separatorBuilder: (context, index) {
                      return const SizedBox(width: 15);
                    },
                    itemBuilder: (context, index) {
                      return _itemList(
                        game.screenshots[index].image,
                      );
                    },
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  child: ReadMoreText(
                    game.description,
                    trimLines: 2,
                    colorClickableText: Colors.amberAccent.shade400,
                    trimMode: TrimMode.Line,
                    style: TextStyle(
                      color: Colors.black54.withValues(alpha: 0.8),
                      height: 1.5,
                    ),
                    trimCollapsedText: 'more',
                    trimExpandedText: 'less',
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

Widget _itemList(String url) {
  return SizedBox(
    width: 250,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.network(
        url,
        width: 250,
        height: 160,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }

          return Container(
            width: 250,
            color: Colors.blueGrey.shade100,
            alignment: Alignment.center,
            child: const CircularProgressIndicator(),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return Container(
            width: 250,
            color: Colors.blueGrey.shade100,
            alignment: Alignment.center,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.broken_image_outlined,
                  size: 40,
                  color: Colors.blueGrey,
                ),
                SizedBox(height: 8),
                Text('Gambar tidak tersedia'),
              ],
            ),
          );
        },
      ),
    ),
  );
}

Row _requirementRow(String title, String value) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        flex: 3,
        child: Text(
          title,
          style: TextStyle(
            color: Colors.black54.withValues(alpha: 0.8),
          ),
        ),
      ),
      Expanded(
        flex: 1,
        child: Text(
          ':',
          style: TextStyle(
            color: Colors.black54.withValues(alpha: 0.8),
          ),
        ),
      ),
      Expanded(
        flex: 8,
        child: Text(
          value,
          style: TextStyle(
            color: Colors.black54.withValues(alpha: 0.8),
          ),
        ),
      ),
    ],
  );
}
