import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'kalori.dart';
import 'stage-1.dart';
import 'pengetahuan.dart';
import 'latar-belakang.dart';

// import 'gradient.dart';

void main() {
  runApp(MaterialApp(
    title: 'Piring Makanku',
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

final ButtonStyle style = ElevatedButton.styleFrom(
  textStyle: const TextStyle(fontSize: 20),
  padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
  minimumSize: Size(150.0, 50.0),
  primary: Colors.blue[300],
  onPrimary: Colors.white,
);

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext main) {
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
              margin: EdgeInsets.only(bottom: 50),
              child: Center(
                child: Image(
                  image: AssetImage("assets/images/Ellipse_1.png"),
                  width: 180,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 95),
              child: Center(
                child: Text(
                  "Piring Makanku",
                  style: TextStyle(
                    fontFamily: "Sacramento",
                    color: Colors.blue.shade200,
                    fontSize: 70,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  // Spacer(),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: ElevatedButton(
                      style: style,
                      child: Text(
                        "INFO",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: "Roboto"),
                      ),
                      onPressed: () {
                        Navigator.push(
                          main,
                          MaterialPageRoute(builder: (main) => InfoPage()),
                        );
                      },
                    ),
                  ),
                  // Spacer(),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                      style: style,
                      child: Text(
                        "MULAI",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: "Roboto"),
                      ),
                      onPressed: () {
                        Navigator.push(
                          main,
                          MaterialPageRoute(builder: (main) => Stage1()),
                        );
                      },
                    ),
                  ),
                  // Spacer(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      style: style,
                      child: Text(
                        "TENTANG",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: "Roboto"),
                      ),
                      onPressed: () {
                        Navigator.push(
                          main,
                          MaterialPageRoute(builder: (main) => TentangPage()),
                        );
                      },
                    ),
                  ),
                  // Spacer(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TentangPage extends StatelessWidget {
  @override
  Widget build(BuildContext tentang) {
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
              margin: EdgeInsets.only(bottom: 280),
              child: Center(
                child: Text(
                  "Tim \nPengembang".toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Roboto",
                    color: Colors.blue.shade300,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 20.5,
                  ),
                ),
              ),
            ),
            Container(
                margin: const EdgeInsets.fromLTRB(47.0, 102.0, 47.0, 70.0),
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue.shade200, width: 6),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Desain dan Konten\n\n\n Ika Anwar Safitri",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Roboto",
                          color: Colors.blue.shade300,
                          fontSize: 20,
                          // fontWeight: FontWeight.w700,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Sistem dan Antarmuka\n\n\n Rio Ramadhan",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Roboto",
                          color: Colors.blue.shade300,
                          fontSize: 20,
                          // fontWeight: FontWeight.w700,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ),
                  ],
                )),
            Container(
              margin: EdgeInsets.only(bottom: 15),
              padding: EdgeInsets.fromLTRB(30.0, 0, 30.0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  // Spacer(),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: TextButton(
                        onPressed: () {
                          Navigator.pop(tentang);
                        },
                        child: Row(
                          children: [
                            Icon(Icons.arrow_back),
                            Text(
                              "Kembali".toUpperCase(),
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: "Roboto",
                                color: Colors.blue[300],
                              ),
                            ),
                          ],
                        )),
                  ),

                  // Spacer(),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            tentang,
                            MaterialPageRoute(
                                builder: (tentang) => LatarBelakang()),
                          );
                        },
                        child: Row(
                          children: [
                            Text(
                              "Lanjut".toUpperCase(),
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: "Roboto",
                                color: Colors.blue[300],
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

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext info) {
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
              image: DecorationImage(
                image: AssetImage("assets/images/bg.png"),
                repeat: ImageRepeat.repeat,
              ),
            )),
            Container(
              margin: EdgeInsets.only(bottom: 260),
              child: Center(
                child: Text(
                  "Informasi \nSeputar Gizi".toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Roboto",
                    color: Colors.blue.shade300,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 20.5,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 70),
              padding: EdgeInsets.fromLTRB(47.0, 0, 47.0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  // Spacer(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: GestureDetector(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(55, 55, 55, 55),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment(0.0, 0.7),
                            colors: <Color>[
                              Colors.blue.shade300,
                              Colors.blue.shade600
                            ],
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ButtonTheme(
                          minWidth: 150,
                          height: 500,
                          child: Text(
                            "Kalori \nDari Makanan".toUpperCase(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontFamily: "Roboto",
                              letterSpacing: 6,
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          info,
                          MaterialPageRoute(builder: (info) => KaloriPage()),
                        );
                      },
                    ),
                  ),
                  // Spacer(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: GestureDetector(
                        child: Container(
                          padding: EdgeInsets.fromLTRB(55, 55, 55, 55),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment(0.0, 0.7),
                              colors: <Color>[
                                Colors.blue.shade300,
                                Colors.blue.shade600
                              ],
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            "Pedoman \nGizi Seimbang".toUpperCase(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontFamily: "Roboto",
                              letterSpacing: 6,
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              info,
                              MaterialPageRoute(
                                  builder: (info) => PedomanGiziSeimbang()));
                        }),
                  )
                  // Spacer(),
                  // Spacer(),
                ],
              ),
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
                          Navigator.pop(info);
                        },
                        child: Row(
                          children: [
                            Text(
                              "Kembali".toUpperCase(),
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: "Roboto",
                                color: Colors.blue[300],
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
