import 'package:flutter/material.dart';
import 'sidebar.dart';

import 'hymns.dart';
import 'allchords.dart';
import 'metronome.dart';
import 'tuner.dart';
import 'tabs.dart';
import 'notes.dart';
import 'contribute.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    //HOMEPAGE

    //change color from here
    final Color rectangleBoxColor = Color.fromRGBO(255, 235, 230, 5);
    final Color appbarColor = Color.fromRGBO(127, 27, 27, 1.0);
    final Color gradientTopColor = Color.fromRGBO(127, 27, 27, 1.0);
    final Color gradientBottomColor = Color.fromRGBO(21, 4, 4, 1.0);

    final functions = [
      Hymns(),
      AllChords(),
      Metronome(),
      Tuner(),
      Tabs(),
      Notes(),
      Contribute()
    ];

    final rectangleBoxesIndex = 0;

    final rectangleBoxesNames = [
      'Hymns',
      'All Chords',
      'Metronome',
      'Tuner',
      'Tabs',
      'Notes'
    ];

    final rectangleBoxesPics = [
      'images/homepage/hymnbook.png',
      'images/homepage/piano.png',
      'images/homepage/metronome_black.png',
      'images/homepage/tuner.png',
      'images/homepage/guitar.png',
      'images/homepage/music.png',
    ];

    //HomeBox
    var titleBoxColor = Colors.red[800];

    var height = AppBar().preferredSize.height;

    Future<bool> _onBackPressed() {
      return showDialog(
        context: (context),
        builder: (context) => AlertDialog(
          title: Text("Are you sure?"),
          content: Text("Do you want to exit the App?"),
          actions: [
            GestureDetector(
              onTap: () => Navigator.of(context).pop(false),
              child: Text("NO"),
            ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: () => Navigator.of(context).pop(true),
              child: Text("YES"),
            ),
          ],
        ),
      );
    }

    //BIG CODE FROM HERE
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: MaterialApp(
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
                  'HymnsNChords',
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
              child: Column(
                children: <Widget>[
                  Spacer(flex: 1),
                  Expanded(
                    flex: 2,
                    child: Container(
                      alignment: Alignment.center,
                      width: 100,
                      child: Text(
                        'HOME',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.yellow[200],
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: titleBoxColor,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(44, 0, 0, 100),
                            blurRadius: 15.0,
                            spreadRadius: 3.0,
                            offset: Offset(
                              3.0, //Move to right 10 horizontally
                              5.0, //Move to bottom 10  vertically
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(
                    flex: 2,
                  ),
                  Expanded(
                    flex: 6,
                    child: Row(
                      //1st ROW
                      children: <Widget>[
                        Spacer(
                          flex: 2,
                        ),
                        rectangleBoxes(
                            rectangleBoxColor,
                            rectangleBoxesIndex,
                            rectangleBoxesNames,
                            rectangleBoxesPics,
                            context,
                            functions),
                        Spacer(flex: 1),
                        rectangleBoxes(
                            rectangleBoxColor,
                            rectangleBoxesIndex + 1,
                            rectangleBoxesNames,
                            rectangleBoxesPics,
                            context,
                            functions),
                        Spacer(
                          flex: 2,
                        ),
                      ],
                    ),
                  ),
                  Spacer(
                    flex: 2,
                  ),
                  Expanded(
                    flex: 6,
                    child: Row(
                      //2nd ROW
                      children: <Widget>[
                        Spacer(
                          flex: 2,
                        ),
                        rectangleBoxes(
                            rectangleBoxColor,
                            rectangleBoxesIndex + 2,
                            rectangleBoxesNames,
                            rectangleBoxesPics,
                            context,
                            functions),
                        Spacer(flex: 1),
                        rectangleBoxes(
                            rectangleBoxColor,
                            rectangleBoxesIndex + 3,
                            rectangleBoxesNames,
                            rectangleBoxesPics,
                            context,
                            functions),
                        Spacer(
                          flex: 2,
                        ),
                      ],
                    ),
                  ),
                  Spacer(
                    flex: 2,
                  ),
                  Expanded(
                    flex: 6,
                    child: Row(
                      //Third Row
                      children: <Widget>[
                        Spacer(
                          flex: 2,
                        ),
                        rectangleBoxes(
                          rectangleBoxColor,
                          rectangleBoxesIndex + 4,
                          rectangleBoxesNames,
                          rectangleBoxesPics,
                          context,
                          functions,
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        rectangleBoxes(
                            rectangleBoxColor,
                            rectangleBoxesIndex + 5,
                            rectangleBoxesNames,
                            rectangleBoxesPics,
                            context,
                            functions),
                        Spacer(
                          flex: 2,
                        )
                      ],
                    ),
                  ),
                  Spacer(
                    flex: 3,
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      alignment: Alignment.center,
                      width: 200,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Text(
                            'Contribute Here',
                            style: TextStyle(color: Colors.yellow[50]),
                          ),
                          MaterialButton(
                            //  color: Colors.yellow,
                            minWidth: 170,
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => Contribute(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.brown[900],
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black38,
                            blurRadius: 25.0,
                            spreadRadius: 6.0,
                            offset: Offset(
                              10.0, //Move to right 10 horizontally
                              10.0, //Move to bottom 10  vertically
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(
                    flex: 2,
                  )
                ],
              ), //Menu
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
      ),
    );
  }

  Expanded rectangleBoxes(
      Color rectangleBoxColor,
      int rectangleBoxesIndex,
      var rectangleBoxesNames,
      var rectangleBoxesPics,
      BuildContext context,
      var functions) {
    return Expanded(
      flex: 5,
      child: Stack(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: Stack(
              fit: StackFit.expand,
              alignment: Alignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Spacer(flex: 3),
                    Expanded(
                      flex: 10,
                      child: Image.asset(
                        rectangleBoxesPics[rectangleBoxesIndex],
                        scale: 1,
                      ),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Expanded(
                      flex: 3,
                      child: FittedBox(
                        child: Text(
                          rectangleBoxesNames[rectangleBoxesIndex],
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ),
                    ),
                    Spacer(
                      flex: 2,
                    )
                  ],
                ),
                MaterialButton(
                  //color: Colors.yellow,
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => functions[rectangleBoxesIndex]),
                    );
                  },
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: rectangleBoxColor,
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black38,
                  blurRadius: 25.0,
                  spreadRadius: 6.0,
                  offset: Offset(
                    10.0, //Move to right 10 horizontally
                    10.0, //Move to bottom 10  vertically
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
