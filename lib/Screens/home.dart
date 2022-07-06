import 'package:flutter/material.dart';
import 'package:muslim_app/Model/prayertime.dart';
import 'package:muslim_app/Providers/api_provider.dart';
import 'package:muslim_app/Providers/provider.dart';
import 'package:muslim_app/Screens/Azkar.dart';
import 'package:muslim_app/Screens/Stories.dart';
import 'package:muslim_app/Screens/Sunnah.dart';
import 'package:muslim_app/Screens/hijri.dart';
import 'package:muslim_app/Screens/pray_times.dart';
import 'package:muslim_app/Screens/sabah.dart';
import 'package:muslim_app/Screens/verses.dart';
import 'package:muslim_app/Widgets/Home/bottom_card.dart';
import 'package:muslim_app/Widgets/Home/category_card.dart';
import 'package:muslim_app/Widgets/Home/home_nav.dart';
import 'package:muslim_app/Widgets/Home/today_message.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var custom = Provider.of<CustomProvider>(context);
    var api = Provider.of<ApiProvider>(context);
    final now = DateTime.now().toString();
    final dateFormat = DateFormat('HH:mm');
    final stringFormat = dateFormat.format(DateTime.parse(now));
    int time = int.parse(stringFormat.substring(0, 2));
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            const HomeNav(),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(10),
              child: FutureBuilder<Data>(
                  future: api.getApiData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      Timings time = snapshot.data!.data.timings;
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                                image: AssetImage(
                                  'assets/images/pattern.png',
                                ),
                                repeat: ImageRepeat.repeat,
                                opacity: .1),
                            gradient: const LinearGradient(
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft,
                              colors: [
                                Colors.green,
                                Color.fromARGB(255, 11, 56, 94),
                              ],
                            ),
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
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  }),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CategoryCard(
                    img: 'assets/images/time.png',
                    title: 'مواقيت الصلاة',
                    ontap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PrayTimes()));
                    }),
                CategoryCard(
                    img: 'assets/images/quran.png',
                    title: 'القرآن',
                    ontap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Verses()));
                    }),
                CategoryCard(
                    img: 'assets/images/book.png',
                    title: 'قصص الأنبياء',
                    ontap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Stories()));
                    }),
                CategoryCard(
                    img: 'assets/images/beads.png',
                    title: 'أذكار وأدعية',
                    ontap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Azkar()));
                    }),
              ],
            ),
            const SizedBox(height: 20),
            const TodayMessage(),
            const SizedBox(height: 20),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BottomCard(
                    color1: Colors.lime,
                    color2: Colors.limeAccent,
                    img: 'assets/images/hegry.png',
                    title: 'التوقيت الهجري',
                    ontap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const hijri()));
                    },
                  ),
                  BottomCard(
                    color1: Colors.green,
                    color2: Color.fromARGB(255, 52, 120, 55),
                    img: 'assets/images/snn.png',
                    title: 'سُنَن الرسول',
                    ontap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Sunnah()));
                    },
                  ),
                  BottomCard(
                    color1: Colors.blue,
                    color2: Color.fromARGB(255, 12, 53, 124),
                    img: (time < 12)
                        ? 'assets/images/azkar.png'
                        : 'assets/images/moon.png',
                    title: (time < 12) ? 'أذكار الصباح' : 'أذكار المساء',
                    ontap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Sabah(name: 'أذكار الصباح و المساء')));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
