import 'dart:ui';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter_intro/flutter_intro.dart';
import 'stage-3.dart';
import 'list-makanan.dart' as _list;

void main() {
  runApp(MaterialApp(
    title: 'Piring Makanku',
    home: Stage2(),
    debugShowCheckedModeBanner: false,
  ));
}

String pokok = '';
String lauk = '';
String sayur = '';
String buah = '';
String minuman = '';
double totalKalori = 0;

List<_list.Makanan> _listMakanan = [];

class Resultoverlay extends ModalRoute<void> {
  @override
  Duration get transitionDuration => Duration(milliseconds: 500);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor => Colors.blue.shade700.withOpacity(0.7);

  @override
  String get barrierLabel => '';

  @override
  bool get maintainState => true;

  @override
  Widget buildPage(
    BuildContext stage2,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    // This makes sure that text and other content follows the material style
    return Material(
      type: MaterialType.transparency,
      // make sure that the overlay content is not cut off
      child: SafeArea(
        child: _buildOverlayContent(stage2),
      ),
    );
  }

  Widget _buildOverlayContent(BuildContext stage2) {
    return Container(
      margin: EdgeInsets.only(top: 80),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Text(
              'Yey \nKamu Berhasil!'.toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Roboto",
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.w700,
                letterSpacing: 3.9,
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(20, 80, 0, 0),
                child: Image(
                  image: AssetImage("assets/images/rectangle.png"),
                  width: 10,
                ),
              ),
              Container(
                alignment: Alignment.bottomLeft,
                margin: EdgeInsets.fromLTRB(20, 70, 0, 0),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Text(
                        'Siang ini kamu baru saja \nMakan dengan jumlah kalori sebesar : $totalKalori kkal'
                            .toUpperCase(),
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: "Roboto",
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 3.9,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 160),
                      child: Text(
                        'Saran : Coba atur lagi asupan makan kamu\ndengan memperhatikan kalori ya!'
                            .toUpperCase(),
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: "Roboto",
                          color: Colors.white,
                          fontSize: 15.3,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 3.9,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          Container(
            padding: EdgeInsets.fromLTRB(30.0, 0, 30.0, 0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  // Spacer(),
                  Align(),

                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          stage2,
                          MaterialPageRoute(builder: (stage2) => Stage3()),
                        );
                      },
                      child: Text(
                        'Melanjutkan'.toUpperCase(),
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: "Roboto",
                          color: Colors.blue.shade300,
                          fontSize: 15.3,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 3.9,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                      ),
                    ),
                  ),
                ]),
            // RaisedButton(
            //   onPressed: () => Navigator.pop(stage2),
            //   child: Text('Dismiss'),
          ),
          // RaisedButton(
          //   onPressed: () => Navigator.pop(stage2),
          //   child: Text('Dismiss'),
          // )
        ],
      ),
    );
  }

  @override
  Widget buildTransitions(BuildContext stage2, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    // You can add your own animations for the overlay content
    return FadeTransition(
      opacity: animation,
      child: ScaleTransition(
        scale: animation,
        child: child,
      ),
    );
  }
}

class Stage2 extends StatefulWidget {
  @override
  _Stage2State createState() => _Stage2State();
}

class _Stage2State extends State<Stage2> {
  Intro intro = Intro(
    /// You can set it true to disable animation
    noAnimation: false,

    /// The total number of guide pages, must be passed
    stepCount: 1,

    /// Click on whether the mask is allowed to be closed.
    maskClosable: true,

    /// When highlight widget is tapped.
    onHighlightWidgetTap: (introStatus) {
      print(introStatus);
    },

    /// The padding of the highlighted area and the widget
    padding: EdgeInsets.all(8),

    /// Border radius of the highlighted area
    borderRadius: BorderRadius.all(Radius.circular(4)),

    /// Use the default useDefaultTheme provided by the library to quickly build a guide page
    /// Need to customize the style and content of the guide page, implement the widgetBuilder method yourself
    /// * Above version 2.3.0, you can use useAdvancedTheme to have more control over the style of the widget
    /// * Please see https://github.com/tal-tech/flutter_intro/issues/26
    widgetBuilder: StepWidgetBuilder.useDefaultTheme(
      /// Guide page text
      texts: [
        'Sekarang ada indikator kalori makanan yang menunjukan jumlah asupan kalori yang kamu makan',
      ],

      /// Button text
      buttonTextBuilder: (curr, total) {
        return curr < total - 1 ? 'Sipp, lanjut!' : 'Okeyy!';
      },
    ),
  );

  // String _targetImageUrl = '';

  // Play BGM
  // AudioCache = _audioController = AudioCache();

  void initState() {
    super.initState();
    _listMakanan = _list.pokok;
    Timer(
        Duration(
          milliseconds: 500,
        ), () {
      /// start the intro
      intro.start(context);
    });
  }

  void _showResult(BuildContext stage2) {
    Navigator.of(stage2).push(Resultoverlay());
  }

  void restart() {
    setState(() {
      pokok = '';
      lauk = '';
      sayur = '';
      buah = '';
      minuman = '';
      totalKalori = 0;
      _listMakanan = _list.pokok;
    });
  }

  @override
  Widget build(BuildContext stage2) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    SystemChrome.setEnabledSystemUIOverlays([]);

    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: () {
            restart();
          },
        ),
        body: Stack(
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.fromLTRB(25, 25, 0, 0),
              child: Text(
                "Kalori $totalKalori kkal".toUpperCase(),
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontFamily: "Roboto",
                  color: Colors.blue.shade300,
                  fontSize: 20,
                  fontWeight: FontWeight.w200,
                  letterSpacing: 8.5,
                ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.fromLTRB(25, 9, 0, 0),
              child: Image(
                key: intro.keys[0],
                image: AssetImage("assets/images/indicator.png"),
                width: 340,
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(bottom: 10),
              child: Image(
                image: AssetImage("assets/images/piring_base.png"),
                width: 280,
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.fromLTRB(0, 38, 500, 0),
              child: Image(
                image: AssetImage("assets/images/minuman_base.png"),
                width: 100,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 45, 119, 19),
              alignment: Alignment.center,
              child: DragTarget<_list.Makanan>(
                onWillAccept: (data) {
                  if (data?.category != "1") {
                    return false;
                  } else {
                    return true;
                  }
                },
                onAccept: (makanan) {
                  setState(() {
                    pokok = makanan.image;
                    totalKalori += makanan.kalori;
                    _listMakanan = _list.lauk;
                  });
                },
                builder: (stage2, candidateData, rejectedData) {
                  return Container(
                    alignment: Alignment.center,
                    child: pokok != ''
                        ? Image(
                            image: AssetImage(pokok),
                            width: 50,
                          )
                        : Container(
                            child: Image(
                              image: AssetImage("assets/images/pokok.png"),
                              width: 120,
                            ),
                          ),
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 86, 129),
              alignment: Alignment.center,
              child: DragTarget<_list.Makanan>(
                onWillAccept: (data) {
                  if (data?.category != "2") {
                    return false;
                  } else {
                    return true;
                  }
                },
                onAccept: (makanan) {
                  setState(() {
                    lauk = makanan.image;
                    totalKalori += makanan.kalori;
                    _listMakanan = _list.sayur;
                  });
                },
                builder: (stage2, candidateData, rejectedData) {
                  return Container(
                    alignment: Alignment.center,
                    child: lauk != ''
                        ? Container(
                            margin: EdgeInsets.fromLTRB(25, 0, 0, 30),
                            child: Image(
                              image: AssetImage(lauk),
                              width: 50,
                            ),
                          )
                        : Container(
                            child: Image(
                              image: AssetImage("assets/images/lauk.png"),
                              width: 86,
                            ),
                          ),
                  );
                },
              ),
            ),
            Container(
                margin: EdgeInsets.fromLTRB(120, 94, 0, 69),
                alignment: Alignment.center,
                child: DragTarget<_list.Makanan>(
                  onWillAccept: (data) {
                    if (data?.category != "3") {
                      return false;
                    } else {
                      return true;
                    }
                  },
                  onAccept: (makanan) {
                    setState(() {
                      sayur = makanan.image;
                      totalKalori += makanan.kalori;
                      _listMakanan = _list.buah;
                    });
                  },
                  builder: (stage2, candidateData, rejectedData) {
                    return Container(
                      alignment: Alignment.center,
                      child: sayur != ''
                          ? Image(
                              image: AssetImage(sayur),
                              width: 50,
                            )
                          : Container(
                              child: Image(
                                image: AssetImage("assets/images/sayur.png"),
                                width: 120,
                              ),
                            ),
                    );
                  },
                )),
            Container(
              margin: EdgeInsets.fromLTRB(86, 0, 0, 129),
              alignment: Alignment.center,
              child: DragTarget<_list.Makanan>(
                onWillAccept: (data) {
                  if (data?.category != "4") {
                    return false;
                  } else {
                    return true;
                  }
                },
                onAccept: (makanan) {
                  setState(() {
                    buah = makanan.image;
                    totalKalori += makanan.kalori;
                    _list.finalResult += totalKalori;
                    _listMakanan = _list.minuman;
                  });
                },
                builder: (stage2, candidateData, rejectedData) {
                  return Container(
                    alignment: Alignment.center,
                    child: buah != ''
                        ? Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 30, 30),
                            child: Image(
                              image: AssetImage(buah),
                              width: 50,
                            ),
                          )
                        : Container(
                            child: Image(
                              image: AssetImage("assets/images/buah.png"),
                              width: 86,
                            ),
                          ),
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 30, 500, 0),
              alignment: Alignment.center,
              child: DragTarget<_list.Makanan>(
                onWillAccept: (data) {
                  if (data?.category != "5") {
                    return false;
                  } else {
                    return true;
                  }
                },
                onAccept: (makanan) {
                  setState(() {
                    minuman = makanan.image;
                    totalKalori += makanan.kalori;
                    _list.finalResult += totalKalori;
                    _showResult(stage2);
                  });
                },
                builder: (stage2, candidateData, rejectedData) {
                  return Container(
                    alignment: Alignment.center,
                    child: minuman != ''
                        ? Container(
                            margin: EdgeInsets.only(bottom: 40),
                            child: Image(
                              image: AssetImage(minuman),
                              width: 50,
                            ))
                        : Container(
                            child: Image(
                              image: AssetImage("assets/images/minuman.png"),
                              width: 100,
                            ),
                          ),
                  );
                },
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.only(bottom: 5),
              child: CarouselSlider(
                items: _listMakanan.map((makanan) {
                  double kalori = makanan.kalori;
                  return Row(children: [
                    Expanded(
                      flex: 1,
                      child: LongPressDraggable<_list.Makanan>(
                        data: makanan,
                        child: Stack(children: <Widget>[
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 30, 30),
                            alignment: Alignment.center,
                            child: Image(
                              image: AssetImage(makanan.image),
                              fit: BoxFit.contain,
                              // width: 80,
                            ),
                          ),
                          Container(
                            width: 90,
                            height: 20,
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(15)),
                            padding: EdgeInsets.fromLTRB(2, 1, 2, 1),
                            margin: EdgeInsets.fromLTRB(0, 45, 0, 0),
                            alignment: Alignment.center,
                            child: Text(
                              makanan.nama,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: "Roboto",
                                color: Colors.white,
                                fontSize: 10,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                        ]),
                        feedback: Stack(children: <Widget>[
                          Container(
                            child: Image(
                              image: AssetImage(makanan.image),
                              fit: BoxFit.contain,
                              width: 80,
                            ),
                          ),
                          Container(
                            width: 90,
                            height: 20,
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(15)),
                            padding: EdgeInsets.fromLTRB(2, 1, 2, 1),
                            margin: EdgeInsets.fromLTRB(45, 0, 0, 50),
                            alignment: Alignment.center,
                            child: Text(
                              "$kalori kkal ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: "Roboto",
                                color: Colors.white,
                                fontSize: 10,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                        ]),
                        childWhenDragging: Container(),
                      ),
                    ),
                  ]);
                }).toList(),
                options: CarouselOptions(
                  height: 70,
                  autoPlay: false,
                  enlargeCenterPage: true,
                  // aspectRatio: 2.0,
                  enableInfiniteScroll: false,
                  viewportFraction: 0.15,
                ),
              ),
            ),
            Container(
              alignment: Alignment.topRight,
              margin: EdgeInsets.fromLTRB(0, 25, 25, 0),
              child: Text(
                "Stage 2".toUpperCase(),
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontFamily: "Roboto",
                  color: Colors.blue.shade300,
                  fontSize: 20,
                  fontWeight: FontWeight.w200,
                  letterSpacing: 8.5,
                ),
              ),
            ),
            Container(
              alignment: Alignment.topRight,
              margin: EdgeInsets.fromLTRB(0, 68, 32, 0),
              child: Text(
                "Makan Siang".toUpperCase(),
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontFamily: "Roboto",
                  color: Colors.blue.shade300,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 2.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
