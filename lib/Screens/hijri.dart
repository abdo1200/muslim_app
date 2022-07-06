import 'package:flutter/material.dart';
import 'package:muslim_app/Model/prayertime.dart';
import 'package:muslim_app/Providers/api_provider.dart';
import 'package:muslim_app/Providers/provider.dart';
import 'package:muslim_app/Widgets/pray_time_card.dart';
import 'package:provider/provider.dart';

class hijri extends StatelessWidget {
  const hijri({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var api = Provider.of<ApiProvider>(context);
    var custom = Provider.of<CustomProvider>(context);
    return Scaffold(
      body: FutureBuilder<Data>(
          future: api.getApiData(),
          builder: (context, snapshot) {
            //print(api.praylist!.data.timings.dhuhr);
            if (snapshot.hasData) {
              Hijri date = snapshot.data!.data.date.hijri;
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
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 67, 67, 67),
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              Icons.calendar_today_outlined,
                              size: 25,
                              color: Colors.white,
                            ),
                            Column(
                              children: const [
                                Text('التاريخ الهجري',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontFamily: 'Arabic')),
                                // Text(
                                //     snapshot.data!.data.date.hijri.weekday.ar
                                //         .toString(),
                                //     style: const TextStyle(
                                //         color:
                                //             Color.fromARGB(255, 188, 178, 178),
                                //         fontSize: 25,
                                //         fontFamily: 'Arabic')),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
                      Container(
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(date.date,
                                  style: TextStyle(
                                      fontSize: 25, fontFamily: 'Arabic')),
                              Text(' : التاريخ',
                                  style: TextStyle(
                                      fontSize: 20, fontFamily: 'Arabic')),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Container(
                            width: double.infinity,
                            height: 1,
                            color: Colors.black,
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(date.weekday.ar,
                                  style: const TextStyle(
                                      fontSize: 25, fontFamily: 'Arabic')),
                              const Text(' : اليوم',
                                  style: TextStyle(
                                      fontSize: 20, fontFamily: 'Arabic')),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Container(
                            width: double.infinity,
                            height: 1,
                            color: Colors.black,
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(date.month.ar,
                                  style: TextStyle(
                                      fontSize: 25, fontFamily: 'Arabic')),
                              Text(' : الشهر',
                                  style: TextStyle(
                                      fontSize: 20, fontFamily: 'Arabic')),
                            ],
                          ),
                        ]),
                      )
                    ],
                  ),
                ),
              );
            } else {
              return const CircularProgressIndicator();
            }
          }),
    );
  }
}
