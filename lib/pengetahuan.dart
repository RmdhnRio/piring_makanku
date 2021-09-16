import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// import 'gradient.dart';

void main() {
  runApp(MaterialApp(
    title: 'Piring Makanku',
    home: PedomanGiziSeimbang(),
    debugShowCheckedModeBanner: false,
  ));
}

class PedomanGiziSeimbang extends StatelessWidget {
  List<int> top = <int>[];
  List<int> bottom = <int>[0];
  @override
  Widget build(BuildContext info) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    SystemChrome.setEnabledSystemUIOverlays([]);
    const Key centerKey = ValueKey<String>('bottom-sliver-list');

    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            CustomScrollView(center: centerKey, slivers: <Widget>[
              SliverList(
                key: centerKey,
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Container(
                      child: Image(
                          image: AssetImage(
                              "assets/images/pedoman_gizi_seimbang.png")),
                    );
                  },
                  childCount: bottom.length,
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
