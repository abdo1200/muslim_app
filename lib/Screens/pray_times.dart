import 'package:flutter/material.dart';
import 'package:muslim_app/Model/prayertime.dart';
import 'package:muslim_app/Providers/api_provider.dart';
import 'package:muslim_app/Providers/provider.dart';
import 'package:muslim_app/Widgets/pray_time_card.dart';
import 'package:provider/provider.dart';

class PrayTimes extends StatelessWidget {
  const PrayTimes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var api = Provider.of<ApiProvider>(context);
    var custom = Provider.of<CustomProvider>(context);
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: FutureBuilder<Data>(
            future: api.getApiData(),
            builder: (context, snapshot) {
              //print(api.praylist!.data.timings.dhuhr);
              if (snapshot.hasData) {
                Timings time = snapshot.data!.data.timings;

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
                  child: SingleChildScrollView(
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
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 67, 67, 67),
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  'assets/images/prayer.png',
                                  height: 50,
                                ),
                                Column(
                                  children: [
                                    const Text('   الصلاة القادمة',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontFamily: 'Arabic')),
                                    Text(custom.nextprayer(time),
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 25,
                                            fontFamily: 'Arabic')),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          PrayerTimeCard(
                            image: 'assets/images/fajr.png',
                            name: 'الفجر   ',
                            time: custom.convertTime(time.fajr),
                          ),
                          const SizedBox(height: 10),
                          PrayerTimeCard(
                            image: 'assets/images/sunrise.png',
                            name: 'الشروق   ',
                            time: custom.convertTime(time.sunrise),
                          ),
                          const SizedBox(height: 10),
                          PrayerTimeCard(
                            image: 'assets/images/dhuhr.png',
                            name: 'الظهر   ',
                            time: custom.convertTime(time.dhuhr),
                          ),
                          const SizedBox(height: 10),
                          PrayerTimeCard(
                            image: 'assets/images/asr.png',
                            name: 'العصر   ',
                            time: custom.convertTime(time.asr),
                          ),
                          const SizedBox(height: 10),
                          PrayerTimeCard(
                            image: 'assets/images/maghrib.png',
                            name: 'المغرب   ',
                            time: custom.convertTime(time.maghrib),
                          ),
                          const SizedBox(height: 10),
                          PrayerTimeCard(
                            image: 'assets/images/ishaa.png',
                            name: 'العشاء   ',
                            time: custom.convertTime(time.isha),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }
}
