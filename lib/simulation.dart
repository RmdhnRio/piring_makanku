import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(
    title: 'Piring Makanku',
    home: Start(),
    debugShowCheckedModeBanner: false,
  ));
}

class Start extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  final Map<String, bool> _score = {};
  String _targetImageUrl = '';

  // Play BGM
  // AudioCache = _audioController = AudioCache();

  List<String> _theList = [];

  static final List<String> _listPokok = [
    "assets/images/food_assets/Nasi.png",
    "assets/images/food_assets/Kentang.png",
    "assets/images/food_assets/Roti.png",
    "assets/images/food_assets/Ubi.png",
    "assets/images/food_assets/Singkong.png",
    "assets/images/food_assets/Nasi_goreng.png",
    "assets/images/food_assets/Mie_instan.png",
  ];
  static final List<String> _listLauk = [
    "assets/images/food_assets/Ayam_goreng.png",
    "assets/images/food_assets/Telur_goreng.png",
    "assets/images/food_assets/Ayam_krispi.png",
    "assets/images/food_assets/Ikan.png",
    "assets/images/food_assets/Lele.png",
    "assets/images/food_assets/Sosis.png",
    "assets/images/food_assets/Bakso.png",
  ];
  static final List<String> _listSayur = [
    "assets/images/food_assets/Bayam.png",
    "assets/images/food_assets/Wortel.png",
    "assets/images/food_assets/Jagung.png",
    "assets/images/food_assets/Kol.png",
    "assets/images/food_assets/Terong.png",
  ];
  static final List<String> _listBuah = [
    "assets/images/food_assets/Apel.png",
    "assets/images/food_assets/Anggur.png",
    "assets/images/food_assets/Pisang.png",
    "assets/images/food_assets/Strawberry.png",
    "assets/images/food_assets/Alpukat.png",
  ];

  bool accepted = false;

  @override
  Widget build(BuildContext simulation) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    SystemChrome.setEnabledSystemUIOverlays([]);

    void _openEndDrawer() {
      _scaffoldKey.currentState?.openEndDrawer();
    }

    void _openDrawer() {
      _scaffoldKey.currentState?.openDrawer();
    }

    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: () {
            setState(() {
              _score.clear();
            });
          },
        ),
        key: _scaffoldKey,
        endDrawer: Theme(
          data: Theme.of(simulation).copyWith(
            // Set the transparency here
            canvasColor: Colors.blue.shade500.withOpacity(0.5),
            //or any other color you want. e.g Colors.blue.withOpacity(0.5)
          ),
          child: Container(
            width: 200,
            child: Drawer(
              child: ListView(
                padding: EdgeInsets.all(10.0),
                children: _theList
                    .map(
                      (data) => ListTile(
                        title: LongPressDraggable<String>(
                          data: "assets/images/food_assets/Nasi.png",
                          child: Image(
                            image: AssetImage(data),
                            color: const Color.fromRGBO(255, 255, 255, 0.6),
                            colorBlendMode: BlendMode.modulate,
                            height: 100,
                            fit: BoxFit.contain,
                          ),
                          feedback: Image(
                            image: AssetImage(data),
                            height: 100,
                            fit: BoxFit.contain,
                          ),
                          childWhenDragging: Container(),
                        ),
                        onTap: () {
                          Navigator.pop(simulation);
                        },
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
        drawer: Theme(
          data: Theme.of(simulation).copyWith(
            // Set the transparency here
            canvasColor: Colors.blue.shade500.withOpacity(0.5),
            //or any other color you want. e.g Colors.blue.withOpacity(0.5)
          ),
          child: Container(
            width: 200,
            child: Drawer(
              child: ListView(
                padding: EdgeInsets.all(10.0),
                children: _theList
                    .map(
                      (data) => ListTile(
                        title: LongPressDraggable<String>(
                          data: "assets/images/food_assets/Nasi.png",
                          child: Image(
                            image: AssetImage(data),
                            color: const Color.fromRGBO(255, 255, 255, 0.6),
                            colorBlendMode: BlendMode.modulate,
                            height: 100,
                            fit: BoxFit.contain,
                          ),
                          feedback: Image(
                            image: AssetImage(data),
                            height: 100,
                            fit: BoxFit.contain,
                          ),
                          childWhenDragging: Container(),
                        ),
                        onTap: () {
                          Navigator.pop(simulation);
                        },
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
        body: Stack(
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.fromLTRB(25, 25, 0, 0),
              child: Text(
                "Score ${_score.length}".toUpperCase(),
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
              child: Center(
                child: Image(
                  image: AssetImage("assets/images/piring_flat.png"),
                  width: 330,
                ),
              ),
            ),
            Container(
              child: Draggable<String>(
                data: "assets/images/food_assets/Nasi.png",
                child: Image(
                  image: AssetImage("assets/images/food_assets/Nasi.png"),
                  color: const Color.fromRGBO(255, 255, 255, 0.6),
                  colorBlendMode: BlendMode.modulate,
                  height: 100,
                  fit: BoxFit.contain,
                ),
                feedback: Image(
                  image: AssetImage("assets/images/food_assets/Nasi.png"),
                  height: 100,
                  fit: BoxFit.contain,
                ),
                childWhenDragging: Container(),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 42, 144, 0),
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () => setState(() {
                  _theList = _listPokok;
                  _openDrawer();
                }),
                child: Container(
                  child: Image(
                    image: AssetImage("assets/images/pokok.png"),
                    width: 142,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 42, 144, 0),
              alignment: Alignment.center,
              child: DragTarget<String>(
                onAccept: (data) {
                  setState(() {
                    _targetImageUrl = data;
                  });
                },
                builder: (_, candidateData, rejectedData) {
                  return Container(
                    alignment: Alignment.center,
                    child: _targetImageUrl != ''
                        ? Image(
                            image: AssetImage(_targetImageUrl),
                            width: 50,
                          )
                        : Container(
                            child: Image(
                              image: AssetImage("assets/images/pokok.png"),
                              width: 101,
                            ),
                          ),
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 104, 140),
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () => setState(() {
                  _theList = _listLauk;
                  _openDrawer();
                }),
                child: Container(
                  child: Image(
                    image: AssetImage("assets/images/lauk.png"),
                    width: 101,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(139, 42, 0, 0),
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () => setState(() {
                  _theList = _listSayur;
                  _openEndDrawer();
                }),
                child: Container(
                  child: Image(
                    image: AssetImage("assets/images/sayur.png"),
                    width: 142,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(99, 0, 0, 140),
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () => setState(() {
                  _theList = _listBuah;
                  _openEndDrawer();
                }),
                child: Container(
                  child: Image(
                    image: AssetImage("assets/images/buah.png"),
                    width: 101,
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.topRight,
              margin: EdgeInsets.fromLTRB(0, 25, 25, 0),
              child: Text(
                "Level 1".toUpperCase(),
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
                "Sarapan Pagi".toUpperCase(),
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

// class Makanan extends StatelessWidget {
//   const Makanan({Key key, this.makanan}) : super(key: key);

//   final String makanan;

//   @override
//   Widget build(BuildContext simulation) {
//     return Material(
//       color: Colors.transparent,
//       child: Container(
//         alignment: Alignment.center,
//         height: 50,
//         padding: EdgeInsets.all(10),
//         child: Text(
//           makanan,
//           style: TextStyle(color: Colors.black, fontSize: 50),
//         ),
//       ),
//     );
//   }
// }
