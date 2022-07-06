import 'package:flutter/material.dart';
import 'package:muslim_app/data.dart';

class StoryDetails extends StatelessWidget {
  final int id;
  const StoryDetails({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: height * .35,
              child: Image.asset(islamStories[id]['image'], fit: BoxFit.cover),
            ),
            Column(
              children: [
                const SizedBox(height: 10),
                Row(
                  children: [
                    const SizedBox(width: 10),
                    Container(
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        gradient: const LinearGradient(
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                          colors: [
                            Colors.green,
                            Colors.blue,
                          ],
                        ),
                      ),
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back),
                          iconSize: 25,
                          color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              margin: EdgeInsets.only(top: height * .3),
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  )),
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [
                          Colors.green,
                          Colors.blue,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    islamStories[id]['title'],
                    style: const TextStyle(
                      fontSize: 25,
                      fontFamily: 'Arabic',
                    ),
                    textAlign: TextAlign.end,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  islamStories[id]['content'],
                  style: const TextStyle(fontSize: 25, fontFamily: 'Arabic'),
                  textAlign: TextAlign.end,
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
