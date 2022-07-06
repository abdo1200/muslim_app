import 'package:flutter/material.dart';

class BottomCard extends StatelessWidget {
  final String img;
  final String title;
  final Color color1;
  final Color color2;
  final Function ontap;
  const BottomCard({
    Key? key,
    required this.img,
    required this.title,
    required this.color1,
    required this.color2,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        ontap();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [
                color1,
                color2,
              ],
            ),
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
                image: AssetImage(
                  'assets/images/pattern.png',
                ),
                repeat: ImageRepeat.repeat,
                opacity: .2),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 10),
              Image.asset(img, height: width * .15),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Text(
                  title,
                  style:
                      TextStyle(fontSize: width * .045, fontFamily: 'Arabic'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
