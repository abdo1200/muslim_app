import 'package:flutter/material.dart';

import 'package:muslim_app/Screens/ayaa.dart';
import 'package:muslim_app/Screens/story_details.dart';

class StoryCard extends StatelessWidget {
  final String name;
  final int id;
  final String image;

  const StoryCard({
    Key? key,
    required this.name,
    required this.id,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => StoryDetails(id: id)));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        margin: const EdgeInsets.symmetric(vertical: 10),
        height: height * .2,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                image,
              ),
              fit: BoxFit.cover,
              opacity: .8),
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [
                          Colors.blue,
                          Colors.green,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(name,
                      style:
                          const TextStyle(fontSize: 25, fontFamily: 'Arabic')),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
