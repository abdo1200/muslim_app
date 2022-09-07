import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:muslim_app/data.dart';

class Sunnah extends StatelessWidget {
  const Sunnah({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map map = sunnah[0];
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/images/pattern.png',
                ),
                repeat: ImageRepeat.repeat,
                opacity: .1),
            gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [
                Colors.green,
                Colors.blue,
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back),
                      iconSize: 25),
                ],
              ),
              for (int i = 0; i < map.length; i++)
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: ExpansionTileCard(
                    trailing: Text(map.keys.elementAt(i),
                        style: const TextStyle(
                            fontSize: 20, fontFamily: 'Arabic')),
                    title: Row(
                      children: const [
                        Icon(Icons.arrow_drop_down_outlined),
                      ],
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            for (int j = 0;
                                j < map[map.keys.elementAt(i)].length;
                                j++)
                              Column(
                                children: [
                                  Text(map[map.keys.elementAt(i)][j],
                                      textAlign: TextAlign.end,
                                      style: const TextStyle(
                                          fontSize: 20, fontFamily: 'Arabic')),
                                  const SizedBox(
                                    height: 10,
                                  )
                                ],
                              ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              //   StoryCard(
              //     name: islamStories[i]['title'],
              //     image: islamStories[i]['image'],
              //     id: i,
              //   )
            ]),
          ),
        ),
      ),
    );
  }
}
