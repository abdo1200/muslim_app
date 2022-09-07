import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:muslim_app/Screens/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Home()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 91, 29, 230),
              Color.fromARGB(255, 4, 199, 106)
            ],
          ),
          image: DecorationImage(
              image: AssetImage(
                'assets/images/pattern.png',
              ),
              repeat: ImageRepeat.repeat,
              opacity: .1),
        ),
        child: Center(
            child: RubberBand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/splash_ic.png',
                height: 120,
              ),
              const Text(
                'مُسلِم',
                style: TextStyle(fontSize: 30, fontFamily: 'Arabic'),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
