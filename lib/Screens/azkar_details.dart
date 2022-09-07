import 'package:flutter/material.dart';
import 'package:muslim_app/data.dart';

class AzkarDetails extends StatelessWidget {
  final String name;
  const AzkarDetails({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        width: double.infinity,
        height: height,
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
          child: SingleChildScrollView(
            child: Column(
              children: [
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
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 67, 67, 67),
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(name,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'Arabic')),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                for (int i = 0; i < azkar[0][name].length; i++)
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(azkar[0][name][i]['ARABIC_TEXT'],
                            textAlign: TextAlign.end,
                            style: const TextStyle(
                                fontSize: 20, fontFamily: 'Arabic')),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
