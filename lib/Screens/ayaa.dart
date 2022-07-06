import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:muslim_app/Providers/api_provider.dart';
import 'package:quran/quran.dart' as quran;

class Ayaa extends StatelessWidget {
  final int num;
  const Ayaa({
    Key? key,
    required this.num,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var api = Provider.of<ApiProvider>(context);
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: FutureBuilder<List>(
            future: api.getQuranApi(),
            builder: (context, snapshot) {
              // print(quran?[22]);
              if (snapshot.hasData) {
                List? verses = snapshot.data![num]['verses'];
                return Container(
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
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 67, 67, 67),
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('${snapshot.data![num]['id']} ',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontFamily: 'Arabic')),
                                Text('سورة ${snapshot.data![num]['name']} ',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontFamily: 'Arabic')),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            padding: EdgeInsets.all(10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              children: [
                                (snapshot.data![num]['verses'][0]['text'] ==
                                        'بِسۡمِ ٱللَّهِ ٱلرَّحۡمَٰنِ ٱلرَّحِيمِ')
                                    ? Container()
                                    : Column(
                                        children: const [
                                          SizedBox(
                                            width: double.infinity,
                                            child: Text(
                                                'بِسۡمِ ٱللَّهِ ٱلرَّحۡمَٰنِ ٱلرَّحِيمِ',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontFamily: 'Amiri',
                                                    fontSize: 25)),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                        ],
                                      ),
                                Text(
                                  api.sum(verses!, num),
                                  textAlign: TextAlign.end,
                                  style: const TextStyle(
                                      fontFamily: 'Amiri', fontSize: 25),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                return const CircularProgressIndicator();
              }
            }),
      ),
    );
  }
}
// ListTile(
//                                 title: Text(
//                                   quran.getVerse(num + 1, i + 1,
//                                       verseEndSymbol: true),
//                                   textAlign: TextAlign.right,
//                                   style: const TextStyle(
//                                       fontSize: 25, fontFamily: 'quran'),
//                                 ),
//                               );