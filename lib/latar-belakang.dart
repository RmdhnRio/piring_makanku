import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'main.dart';

// import 'gradient.dart';

void main() {
  runApp(MaterialApp(
    title: 'Piring Makanku',
    home: LatarBelakang(),
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

class LatarBelakang extends StatelessWidget {
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
                  "Alasan Dibuatnya\n Aplikasi ini".toUpperCase(),
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
              child: Center(
                child: Text(
                  "Tim Pengembang merupakan mahasiswa yang berinisiatif untuk menciptakan sebuah aplikasi mobile sebagai sebuah cara untuk mempromosikan Pedoman Gizi Seimbang dan Piring Makanku dari Kementerian Kesehatan Republik Indonesia dikarenakan masih banyaknya ketidaktahuan masyarakat terutama remaja bahwa Pedoman Gizi Seimbang merupakan pengganti dari 4 sehat 5 sempurna serta demi memberikan pesan akan pentingnya menjaga pola makan dan gizi yang seimbang",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Roboto",
                    color: Colors.blue.shade300,
                    fontSize: 18,
                    // fontWeight: FontWeight.w700,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
              margin: const EdgeInsets.fromLTRB(47.0, 102.0, 47.0, 70.0),
              padding: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue.shade200, width: 6),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
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
                            MaterialPageRoute(builder: (tentang) => Home()),
                          );
                        },
                        child: Row(
                          children: [
                            Text(
                              "Kembali ke Awal".toUpperCase(),
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
