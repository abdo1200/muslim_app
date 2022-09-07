import 'package:flutter/material.dart';
import 'package:muslim_app/Providers/provider.dart';
import 'package:muslim_app/data.dart';
import 'package:provider/provider.dart';

class Tasbeh extends StatelessWidget {
  const Tasbeh({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    var provider = Provider.of<CustomProvider>(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.blue.withOpacity(.2),
          image: const DecorationImage(
              image: AssetImage(
                'assets/images/pattern.png',
              ),
              repeat: ImageRepeat.repeat,
              opacity: .3),
        ),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back),
                    iconSize: 25),
              ],
            ),
            const SizedBox(height: 50),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    width: width * .20,
                  ),
                  for (int i = 0; i < tasbeh.length; i++)
                    Card(
                      elevation: 5,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: const DecorationImage(
                              image: AssetImage(
                                'assets/images/pattern.png',
                              ),
                              repeat: ImageRepeat.repeat,
                              opacity: .1),
                          gradient: const LinearGradient(
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft,
                            colors: [
                              Color.fromARGB(255, 99, 216, 103),
                              Color.fromARGB(255, 42, 137, 214),
                            ],
                          ),
                        ),
                        child: Text(
                          tasbeh[i]['title'],
                          style: const TextStyle(
                              fontSize: 40, fontFamily: 'Arabic'),
                        ),
                      ),
                    ),
                  SizedBox(
                    width: width * .15,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/images/digital.png',
                  height: 250,
                  fit: BoxFit.cover,
                ),
                Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 140,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 5,
                              blurRadius: 1,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ]),
                      child: Text(
                        provider.count.toString(),
                        style: const TextStyle(fontSize: 40),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(width: 100),
                        GestureDetector(
                          onTap: () {
                            provider.reset();
                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    spreadRadius: 5,
                                    blurRadius: 1,
                                    offset: const Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ]),
                            child: const Icon(Icons.restart_alt, size: 20),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    GestureDetector(
                      onTap: () {
                        provider.increasecount();
                      },
                      child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  spreadRadius: 5,
                                  blurRadius: 1,
                                  offset: const Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ]),
                          child: const Icon(Icons.add, size: 40)),
                    )
                  ],
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
