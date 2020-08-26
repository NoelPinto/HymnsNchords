import 'package:flutter/material.dart';
import 'sidebar.dart';

class Tabs extends StatelessWidget {
  final Color appbarColor = Color.fromRGBO(127, 27, 27, 1.0);
  final height = AppBar().preferredSize.height;

  final Color gradientTopColor = Color.fromRGBO(127, 27, 27, 1.0);
  final Color gradientBottomColor = Color.fromRGBO(21, 4, 4, 1.0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        top: true,
        child: Scaffold(
          primary: true,
          drawer: SideBar(),
          appBar: AppBar(
            backgroundColor: appbarColor,
            elevation: 0,
            toolbarHeight: height + 2,
            centerTitle: true,
            title: Title(
              color: Colors.white,
              child: Text(
                'Tabs',
                style: TextStyle(
                  fontFamily: 'SegoePrint',
                ),
              ),
            ),
            shadowColor: Colors.black,
            actions: [
              Image.asset(
                'images/homepage/metronome.png',
                color: Colors.white,
              ),
            ],
          ),
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment
                    .bottomCenter, // 10% of the width, so there are ten blinds.
                colors: [
                  gradientTopColor,
                  gradientBottomColor,
                ], // whitish to gray
                tileMode:
                    TileMode.repeated, // repeats the gradient over the canvas
              ),
            ),
          ),
        ),
      ),
    );
  }
}
