import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';

// import 'gradient.dart';

void main() {
  runApp(MaterialApp(
    title: 'Info Kalori Makanan',
    home: KaloriBuah(),
    debugShowCheckedModeBanner: false,
  ));
}

class KaloriBuah extends StatefulWidget {
  @override
  _KaloriBuahState createState() => _KaloriBuahState();
}

class _KaloriBuahState extends State<KaloriBuah> {
  static final List<String> imageSlider = [
    'assets/images/food_card/Alpukat.png',
    'assets/images/food_card/Anggur.png',
    'assets/images/food_card/Apel.png',
    'assets/images/food_card/Buah_naga.png',
    'assets/images/food_card/Jambu_batu.png',
    'assets/images/food_card/Jeruk.png',
    'assets/images/food_card/Mangga.png',
    'assets/images/food_card/Melon.png',
    'assets/images/food_card/Pepaya.png',
    'assets/images/food_card/Pisang.png',
    'assets/images/food_card/Strawberry.png',
  ];
  int imageCount = (imageSlider.length / 2).round();

  final CarouselSlider autoPlayImage = CarouselSlider(
    items: imageSlider.map((fileImage) {
      return Column(children: [
        Flexible(
          flex: 1,
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: Image.asset(
              fileImage,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ]);
    }).toList(),
    options: CarouselOptions(
      height: 1000,
      autoPlay: true,
      enlargeCenterPage: false,
      aspectRatio: 2.0,
      enableInfiniteScroll: true,
      viewportFraction: 0.6,
    ),
  );

  @override
  Widget build(BuildContext kaloriBuah) {
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
                margin: EdgeInsets.only(bottom: 40), child: autoPlayImage),
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
                                  color: Colors.white),
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
