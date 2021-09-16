import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_options.dart';

// import 'gradient.dart';

void main() {
  runApp(MaterialApp(
    title: 'Info Kalori Makanan',
    home: KaloriMinuman(),
    debugShowCheckedModeBanner: false,
  ));
}

class KaloriMinuman extends StatefulWidget {
  @override
  _KaloriMinumanState createState() => _KaloriMinumanState();
}

class _KaloriMinumanState extends State<KaloriMinuman> {
  static final List<String> imageSlider = [
    'assets/images/food_card/Air_putih.png',
    'assets/images/food_card/Susu.png',
    'assets/images/food_card/Boba.png',
    'assets/images/food_card/Cola.png',
    'assets/images/food_card/Es_kopi.png',
    'assets/images/food_card/Es_teh_manis.png',
    'assets/images/food_card/Jus.png',
  ];
  final CarouselSlider autoPlayImage = CarouselSlider(
    items: imageSlider.map((fileImage) {
      return Column(children: [
        Flexible(
          flex: 1,
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: Image.asset(
              fileImage,
              // width: 3000,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ]);
    }).toList(),
    options: CarouselOptions(
      height: 1000,
      autoPlay: true,
      enlargeCenterPage: true,
      aspectRatio: 2.0,
      enableInfiniteScroll: true,
      viewportFraction: 0.6,
    ),
  );

  @override
  Widget build(BuildContext kalori) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    SystemChrome.setEnabledSystemUIOverlays([]);

    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment(0.0, 0.7),
                  colors: <Color>[Colors.blue.shade300, Colors.blue.shade600],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 40),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 30),
              child: autoPlayImage,
            ),
            Container(
              margin: EdgeInsets.only(bottom: 15),
              padding: EdgeInsets.fromLTRB(30.0, 0, 30.0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  // Spacer(),
                  Align(),

                  // Spacer(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Row(
                          children: [
                            Text(
                              "Kembali".toUpperCase(),
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: "Roboto",
                                color: Colors.white,
                              ),
                            ),
                            Icon(Icons.arrow_forward),
                          ],
                        )),
                  ),
                  // Spacer(),
                  // Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
