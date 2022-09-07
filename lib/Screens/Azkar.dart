import 'package:flutter/material.dart';
import 'package:muslim_app/data.dart';
import 'package:muslim_app/Screens/sabah.dart';
import 'package:muslim_app/Widgets/azkar_card.dart';

class Azkar extends StatelessWidget {
  const Azkar({Key? key}) : super(key: key);

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
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const Sabah(name: 'أذكار الصباح و المساء')));
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text('أذكار الصباح و المساء',
                          style: TextStyle(fontSize: 20, fontFamily: 'Arabic')),
                    ],
                  ),
                ),
              ),
              for (int i = 0; i < azkar[0].keys.length; i++)
                AzkarCard(
                  name: azkar[0].keys.elementAt(i),
                )
            ]),
          ),
        ),
      ),
    );
  }
}
