import 'package:flutter/material.dart';
import 'package:muslim_app/Screens/ayaa.dart';

class VerseCard extends StatelessWidget {
  final String name;
  final int num;
  final int id;

  const VerseCard(
      {Key? key, required this.name, required this.num, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Ayaa(num: id)));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('آيه ($num)',
                style: const TextStyle(fontSize: 25, fontFamily: 'Arabic')),
            Text(name,
                style: const TextStyle(fontSize: 25, fontFamily: 'Arabic')),
          ],
        ),
      ),
    );
  }
}
