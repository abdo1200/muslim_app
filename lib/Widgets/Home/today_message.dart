import 'package:flutter/material.dart';
import 'package:muslim_app/Providers/provider.dart';

import 'package:share_plus/share_plus.dart';

import 'package:provider/provider.dart';

class TodayMessage extends StatefulWidget {
  const TodayMessage({Key? key}) : super(key: key);

  @override
  State<TodayMessage> createState() => _TodayMessageState();
}

class _TodayMessageState extends State<TodayMessage> {
  @override
  Widget build(BuildContext context) {
    var custom = Provider.of<CustomProvider>(context, listen: true);
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
              Colors.orangeAccent,
              Colors.deepOrangeAccent,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(custom.randomNum(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'Arabic',
                  )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () {
                      Share.share(custom.randomNum());
                    },
                    icon: const Icon(Icons.share)),
                IconButton(
                    onPressed: () {
                      custom.randomNum();
                      setState(() {});
                    },
                    icon: const Icon(Icons.change_circle_rounded))
              ],
            )
          ],
        ),
      ),
    );
  }
}
