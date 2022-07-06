import 'package:flutter/material.dart';
import 'package:muslim_app/Providers/api_provider.dart';
import 'package:provider/provider.dart';

class Sabah extends StatelessWidget {
  final String name;
  const Sabah({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var api = Provider.of<ApiProvider>(context);
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: FutureBuilder<Map>(
            future: api.getAzkarApi(),
            builder: (context, snapshot) {
              // print(quran?[22]);
              if (snapshot.hasData) {
                List? list = snapshot.data!['أذكار الصباح والمساء'];

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
                          SizedBox(height: 20),
                          for (int i = 0; i < list!.length; i++)
                            Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Text(list[i]['ARABIC_TEXT'],
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                          fontSize: 20, fontFamily: 'Arabic')),
                                ),
                                SizedBox(height: 10),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                return Container(
                    height: height,
                    child: Center(child: const CircularProgressIndicator()));
              }
            }),
      ),
    );
  }
}
