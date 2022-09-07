import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:muslim_app/Model/prayertime.dart';
import 'package:muslim_app/Providers/api_provider.dart';
import 'package:muslim_app/Providers/provider.dart';
import 'package:muslim_app/Screens/azkar.dart';
import 'package:muslim_app/Screens/qibla_compass.dart';
import 'package:muslim_app/Screens/stories.dart';
import 'package:muslim_app/Screens/sunnah.dart';
import 'package:muslim_app/Screens/hijri.dart';
import 'package:muslim_app/Screens/pray_times.dart';
import 'package:muslim_app/Screens/tasbeh.dart';
import 'package:muslim_app/Screens/verses.dart';
import 'package:muslim_app/Widgets/Home/bottom_card.dart';
import 'package:muslim_app/Widgets/Home/category_card.dart';
import 'package:muslim_app/Widgets/Home/home_nav.dart';
import 'package:muslim_app/Widgets/Home/today_message.dart';
import 'package:provider/provider.dart';
import 'package:timezone/data/latest.dart' as tz;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();

    tz.initializeTimeZones();
  }

  @override
  Widget build(BuildContext context) {
    var custom = Provider.of<CustomProvider>(context);

    var api = Provider.of<ApiProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            BounceInDown(child: const HomeNav()),
            const SizedBox(height: 20),
            BounceIn(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: FutureBuilder<Data>(
                    future: api.getApiData(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        Timings time = snapshot.data!.data.timings;
                        int end = custom
                                .convertDateTime(custom.nextprayerDate(time))
                                .millisecondsSinceEpoch +
                            (1000 * 30) +
                            086390000;

                        return Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
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
                                  Color(0xFF4CAF50),
                                  Color(0xFF0B385E),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CountdownTimer(
                                endTime: end,
                                widgetBuilder: (context, end) {
                                  if (end != null) {
                                    return Row(
                                      children: [
                                        Column(
                                          children: [
                                            Container(
                                                padding:
                                                    const EdgeInsets.all(5),
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                child: Text(
                                                    custom.replaceNumber(
                                                        end.sec.toString()),
                                                    style: const TextStyle(
                                                        fontSize: 15,
                                                        fontFamily: 'Arabic'))),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            const Text('ثانية',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                    fontFamily: 'Arabic')),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Column(
                                          children: [
                                            Container(
                                                padding:
                                                    const EdgeInsets.all(5),
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                child: Text(
                                                    custom.replaceNumber(
                                                        end.min.toString()),
                                                    style: const TextStyle(
                                                        fontSize: 15,
                                                        fontFamily: 'Arabic'))),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            const Text('دقيقة',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                    fontFamily: 'Arabic')),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Column(
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: Text(
                                                  (end.hours == null)
                                                      ? custom
                                                          .replaceNumber('0')
                                                      : custom.replaceNumber(
                                                          end.hours.toString()),
                                                  style: const TextStyle(
                                                      fontSize: 15,
                                                      fontFamily: 'Arabic')),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            const Text('ساعه',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                    fontFamily: 'Arabic')),
                                          ],
                                        ),
                                      ],
                                    );
                                  } else {
                                    // NotificationService().showNotification(
                                    //     1,
                                    //     custom.replaceNumber(
                                    //         custom.nextprayer(time)),
                                    //     'حان وقت الصلاة',
                                    //     5);
                                    return const Text('حان وقت الصلاة',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontFamily: 'Arabic'));
                                  }
                                },
                              ),
                              Column(
                                children: [
                                  const Text('   الصلاة القادمة',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontFamily: 'Arabic')),
                                  Text(
                                      custom.replaceNumber(
                                          custom.nextprayer(time)),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
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
            ),
            const SizedBox(height: 20),
            BounceInLeft(
              child: Row(
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
            ),
            const SizedBox(height: 20),
            BounceInRight(child: const TodayMessage()),
            const SizedBox(height: 20),
            BounceInUp(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BottomCard(
                    color1: Colors.lime,
                    color2: Colors.limeAccent,
                    img: 'assets/images/hegry.png',
                    title: 'التاريخ الهجري',
                    ontap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HijriDate()));
                    },
                  ),
                  BottomCard(
                    color1: Colors.green,
                    color2: const Color.fromARGB(255, 52, 120, 55),
                    img: 'assets/images/snn.png',
                    title: 'سُنَن الرسول',
                    ontap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Sunnah()));
                    },
                  ),
                ],
              ),
            ),
            BounceInUp(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BottomCard(
                    color1: const Color.fromARGB(255, 144, 194, 235),
                    color2: const Color.fromARGB(255, 74, 121, 202),
                    img: 'assets/images/tasbih.png',
                    title: 'تسبيح',
                    ontap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Tasbeh()));
                    },
                  ),
                  BottomCard(
                    color1: Colors.red,
                    color2: Colors.redAccent,
                    img: 'assets/images/qibla.png',
                    title: 'القبلة',
                    ontap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const QiblaCompass()));
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
