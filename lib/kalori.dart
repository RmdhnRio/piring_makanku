import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'kalori-buah.dart';
import 'kalori-pokok.dart';
import 'kalori-lauk.dart';
import 'kalori-sayur.dart';
import 'kalori-minuman.dart';
import 'kalori-cemilan.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_options.dart';

// import 'gradient.dart';

void main() {
  runApp(MaterialApp(
    title: 'Info Kalori Makanan',
    home: KaloriPage(),
    debugShowCheckedModeBanner: false,
  ));
}

class KaloriPage extends StatefulWidget {
  @override
  _KaloriPageState createState() => _KaloriPageState();
}

class _KaloriPageState extends State<KaloriPage> {
  static final List<String> imageSlider = [
    'assets/images/Card_Jenis_Pokok.png',
    'assets/images/Card_Jenis_Lauk.png',
    'assets/images/Card_Jenis_Sayur.png',
    'assets/images/Card_Jenis_Buah.png',
    'assets/images/Card_Jenis_Minuman.png',
    'assets/images/Card_Jenis_Cemilan.png',
  ];

  navigateTo(imageSlider) {
    String image = imageSlider;
    switch (image) {
      case 'assets/images/Card_Jenis_Pokok.png':
        return '/pokok';

      case 'assets/images/Card_Jenis_Lauk.png':
        return '/lauk';
      case 'assets/images/Card_Jenis_Sayur.png':
        return '/sayur';
      case 'assets/images/Card_Jenis_Buah.png':
        return '/buah';
      case 'assets/images/Card_Jenis_Minuman.png':
        return '/minuman';
      case 'assets/images/Card_Jenis_Cemilan.png':
        return '/cemilan';

      default:
        return '/pokok';
    }
  }

  @override
  Widget build(BuildContext kalori) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    SystemChrome.setEnabledSystemUIOverlays([]);

    return MaterialApp(
      initialRoute: '/kalori',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/pokok': (kalori) => KaloriPokok(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/buah': (kalori) => KaloriBuah(),
        '/sayur': (kalori) => KaloriSayur(),
        '/lauk': (kalori) => KaloriLauk(),
        '/minuman': (kalori) => KaloriMinuman(),
        '/cemilan': (kalori) => KaloriCemilan(),
      },
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment(0.0, 0.7),
                  colors: <Color>[Colors.white, Colors.white],
                ),
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(top: 10),
              child: Text(
                'Pilih \nJenis Makanan'.toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Roboto",
                  color: Colors.blue.shade300,
                  fontSize: 25,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 4.8,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 80),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Container(
                  child: CarouselSlider.builder(
                options: CarouselOptions(
                  aspectRatio: 16 / 9,
                  initialPage: 1,
                  enlargeCenterPage: false,
                  viewportFraction: 0.46,
                  enableInfiniteScroll: false,
                  height: 260,
                ),
                itemCount: (imageSlider.length / 2).round(),
                itemBuilder: (kalori, index, realIdx) {
                  final int first = index * 2;
                  final int second = first + 1;
                  return Row(
                    children: [first, second].map((idx) {
                      return Expanded(
                        flex: 1,
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 2),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  kalori, navigateTo(imageSlider[idx]));
                            },
                            child: Container(
                              child: Image.asset(imageSlider[idx],
                                  fit: BoxFit.contain),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  );
                },
              )),
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
                                  color: Colors.blue.shade300),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.blue.shade300,
                            ),
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
