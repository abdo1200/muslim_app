import 'package:flutter/material.dart';
import 'package:muslim_app/Screens/ayaa.dart';
import 'package:muslim_app/Screens/azkar_details.dart';

class AzkarCard extends StatelessWidget {
  final String name;

  const AzkarCard({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => AzkarDetails(name: name)));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(name,
                style: const TextStyle(fontSize: 20, fontFamily: 'Arabic')),
          ],
        ),
      ),
    );
  }
}
