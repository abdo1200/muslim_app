import 'package:flutter/material.dart';
import 'package:muslim_app/data.dart';
import 'package:muslim_app/Widgets/story_card.dart';

class Stories extends StatelessWidget {
  const Stories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              for (int i = 0; i < islamStories.length; i++)
                StoryCard(
                  name: islamStories[i]['title'],
                  image: islamStories[i]['image'],
                  id: i,
                )
            ]),
          ),
        ),
      ),
    );
  }
}
