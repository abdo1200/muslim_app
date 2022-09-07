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
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        ontap();
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 2,
        child: Container(
          alignment: Alignment.center,
          width: width * .47,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.all(10),
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
                  child: Image.asset(img, height: width * .10)),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  title,
                  style:
                      TextStyle(fontSize: width * .044, fontFamily: 'Arabic'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
