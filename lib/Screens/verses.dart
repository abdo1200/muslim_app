import 'package:flutter/material.dart';
import 'package:muslim_app/Providers/api_provider.dart';
import 'package:muslim_app/Widgets/Home/verse_card.dart';
import 'package:provider/provider.dart';

class Verses extends StatelessWidget {
  const Verses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var api = Provider.of<ApiProvider>(context);
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: FutureBuilder<List>(
            future: api.getQuranApi(),
            builder: (context, snapshot) {
              List? quran = snapshot.data;
              // print(quran?[22]);
              if (snapshot.hasData) {
                return Container(
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                        for (int i = 0; i < snapshot.data!.length; i++)
                          VerseCard(
                            id: i,
                            name: quran?[i]['name'],
                            num: quran?[i]['verses'].length,
                          ),
                      ],
                    ),
                  ),
                );
              } else {
                return SizedBox(
                    height: height,
                    child: const Center(child: CircularProgressIndicator()));
              }
            }),
      ),
    );
  }
}
