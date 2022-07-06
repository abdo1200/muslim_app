import 'package:flutter/material.dart';

class HomePrayTime extends StatelessWidget {
  const HomePrayTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: [
              Colors.blue,
              Colors.green,
            ],
          ),
          borderRadius: BorderRadius.circular(10),
          image: const DecorationImage(
              image: AssetImage(
                'assets/images/pattern.png',
              ),
              repeat: ImageRepeat.repeat,
              opacity: .1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                '6:45 pm',
                style: TextStyle(fontSize: 35, fontFamily: 'MomcakeBold'),
              ),
              Text(
                'صلاة المغرب',
                style: TextStyle(fontSize: 30, fontFamily: 'Arabic'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
