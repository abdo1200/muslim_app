import 'package:flutter/material.dart';
import 'package:muslim_app/Providers/api_provider.dart';
import 'package:muslim_app/Providers/provider.dart';
import 'package:muslim_app/Screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ApiProvider()),
      ChangeNotifierProvider(create: (context) => CustomProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
