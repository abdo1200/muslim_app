import 'package:flutter/material.dart';

class PrayerTimeCard extends StatelessWidget {
  final String name;
  final String time;
  final String image;

  const PrayerTimeCard(
      {super.key, required this.name, required this.time, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(time,
              style: const TextStyle(fontSize: 25, fontFamily: 'Arabic')),
          Row(
            children: [
              Text(name,
                  style: const TextStyle(fontSize: 25, fontFamily: 'Arabic')),
              Image.asset(
                image,
                height: 50,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
