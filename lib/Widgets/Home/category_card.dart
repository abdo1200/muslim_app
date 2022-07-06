import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String img;
  final String title;
  final Function ontap;
  const CategoryCard({
    Key? key,
    required this.img,
    required this.title,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: GestureDetector(
        onTap: () {
          ontap();
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(img, height: 50),
            Text(
              title,
              style: const TextStyle(fontSize: 15, fontFamily: 'Arabic'),
            ),
          ],
        ),
      ),
    );
  }
}
