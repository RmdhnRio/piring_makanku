import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'stage-1.dart' as _stage1;
import 'stage-2.dart' as _stage2;
import 'list-makanan.dart' as _list;
import 'main.dart';

void main() {
  runApp(MaterialApp(
    title: 'Piring Makanku',
    home: Stage3(),
    debugShowCheckedModeBanner: false,
  ));
}

String _pokok = '';
String _lauk = '';
String _sayur = '';
String _buah = '';
String _minuman = '';

double _totalKalori = 0;

List<_list.Makanan> _listMakanan = [];

void reset() {
  _stage1.pokok = '';
  _stage1.lauk = '';
  _stage1.sayur = '';
  _stage1.buah = '';
  _stage1.minuman = '';
  _stage1.totalKalori = 0;
  _stage2.pokok = '';
  _stage2.lauk = '';
  _stage2.sayur = '';
  _stage2.buah = '';
  _stage2.minuman = '';
  _stage2.totalKalori = 0;
}

double result = _list.finalResult;

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
    BuildContext stage3,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    // This makes sure that text and other content follows the material style
    return Material(
      type: MaterialType.transparency,
      // make sure that the overlay content is not cut off
      child: SafeArea(
        child: _buildOverlayContent(stage3),
      ),
    );
  }

  Widget _buildOverlayContent(BuildContext stage3) {
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
                margin: EdgeInsets.fromLTRB(20, 19, 0, 0),
                child: Image(
                  image: AssetImage("assets/images/rectangle.png"),
                  width: 15,
                ),
              ),
              Container(
                alignment: Alignment.bottomLeft,
                margin: EdgeInsets.fromLTRB(10, 18, 0, 0),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 15),
                      child: Text(
                        'Hari ini kamu sudah makan \ndengan total jumlah kalori sebesar : $result kkal'
                            .toUpperCase(),
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: "Roboto",
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 3.9,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        'Asupan kalori yang disarankan buat kamu remaja usia 16-18 tahun yaitu :\n\nlaki-laki : 2675\nperempuan : 2125  '
                            .toUpperCase(),
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: "Roboto",
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 2.9,
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
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  // Spacer(),
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: () {
                        reset();
                        Navigator.push(
                          stage3,
                          MaterialPageRoute(builder: (stage3) => Home()),
                        );
                      },
                      child: Text(
                        'Selesai'.toUpperCase(),
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

                  Container(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: () {
                        reset();
                        Navigator.push(
                          stage3,
                          MaterialPageRoute(
                              builder: (stage3) => _stage1.Stage1()),
                        );
                      },
                      child: Text(
                        'Ulangi'.toUpperCase(),
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
            //   onPressed: () => Navigator.pop(stage3),
            //   child: Text('Dismiss'),
          ),
          // RaisedButton(
          //   onPressed: () => Navigator.pop(stage3),
          //   child: Text('Dismiss'),
          // )
        ],
      ),
    );
  }

  @override
  Widget buildTransitions(BuildContext stage3, Animation<double> animation,
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

class Stage3 extends StatefulWidget {
  @override
  _Stage3State createState() => _Stage3State();
}

class _Stage3State extends State<Stage3> {
  // String _targetImageUrl = '';

  // Play BGM
  // AudioCache = _audioController = AudioCache();

  void initState() {
    super.initState();
    _listMakanan = _list.pokok;
  }

  void _showResult(BuildContext stage3) {
    Navigator.of(stage3).push(Resultoverlay());
  }

  void restart() {
    setState(() {
      _pokok = '';
      _lauk = '';
      _sayur = '';
      _buah = '';
      _minuman = '';
      _totalKalori = 0;
      _listMakanan = _list.pokok;
    });
  }

  @override
  Widget build(BuildContext stage3) {
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
                "Kalori $_totalKalori kkal".toUpperCase(),
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
                    _pokok = makanan.image;
                    _totalKalori += makanan.kalori;
                    _listMakanan = _list.lauk;
                  });
                },
                builder: (stage3, candidateData, rejectedData) {
                  return Container(
                    alignment: Alignment.center,
                    child: _pokok != ''
                        ? Image(
                            image: AssetImage(_pokok),
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
                    _lauk = makanan.image;
                    _totalKalori += makanan.kalori;
                    _listMakanan = _list.sayur;
                  });
                },
                builder: (stage3, candidateData, rejectedData) {
                  return Container(
                    alignment: Alignment.center,
                    child: _lauk != ''
                        ? Container(
                            margin: EdgeInsets.fromLTRB(25, 0, 0, 30),
                            child: Image(
                              image: AssetImage(_lauk),
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
                      _sayur = makanan.image;
                      _totalKalori += makanan.kalori;
                      _listMakanan = _list.buah;
                    });
                  },
                  builder: (stage3, candidateData, rejectedData) {
                    return Container(
                      alignment: Alignment.center,
                      child: _sayur != ''
                          ? Image(
                              image: AssetImage(_sayur),
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
                    _buah = makanan.image;
                    _totalKalori += makanan.kalori;
                    _list.finalResult += _totalKalori;
                    _listMakanan = _list.minuman;
                  });
                },
                builder: (stage3, candidateData, rejectedData) {
                  return Container(
                    alignment: Alignment.center,
                    child: _buah != ''
                        ? Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 30, 30),
                            child: Image(
                              image: AssetImage(_buah),
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
                    _minuman = makanan.image;
                    _totalKalori += makanan.kalori;
                    _list.finalResult += _totalKalori;
                    _showResult(stage3);
                  });
                },
                builder: (stage3, candidateData, rejectedData) {
                  return Container(
                    alignment: Alignment.center,
                    child: _minuman != ''
                        ? Container(
                            margin: EdgeInsets.only(bottom: 40),
                            child: Image(
                              image: AssetImage(_minuman),
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
                "Stage 3".toUpperCase(),
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
                "Makan Malam".toUpperCase(),
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
