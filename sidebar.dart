import 'package:flutter/material.dart';
import 'package:here/allchords.dart';
import 'package:here/hymns.dart';
import 'package:here/notes.dart';
import 'tuner.dart';
import 'home.dart';

//TODO: ADD FUNCTIONS TO DIFFERENT TABS AND ALSO TO THE TAB FUNCTION

class SideBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;
    var height = screenSize.height;
    var topBoxWidth = width / 1.6;
    var topBoxHeight = height / 4;
    var tabBoxColor = Color.fromRGBO(255, 240, 240, 0.8);

    var tabBoxNames = ['Home', 'All Chords', 'Tuner', 'My Notes'];
    var tabBoxIndex = 0;
    var tabBoxPics = [
      'images/sidebar/house.png',
      'images/homepage/piano.png',
      'images/sidebar/guitar.png',
      'images/sidebar/music.png'
    ];

    var functions = [HomePage(), AllChords(), Tuner(), Notes()];

    return SafeArea(
      top: true,
      child: Stack(
        children: <Widget>[
          Container(
            //full sidebar
            height: height,
            width: width / 1.6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16.0),
                bottomRight: Radius.circular(16.0),
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment
                    .bottomCenter, // 10% of the width, so there are ten blinds.
                colors: [
                  Color.fromRGBO(100, 0, 0, 105),
                  Colors.black87,
                ], // whitish to gray
                tileMode:
                    TileMode.repeated, // repeats the gradient over the canvas
              ),
            ),
          ),
          Column(
            children: [
              Container(
                //upper part of sidebar
                width: topBoxWidth,
                height: topBoxHeight,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 220, 220, 0.92),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16.0),
                    bottomLeft: Radius.circular(16.0),
                  ),
                ),
                child: Stack(
                  //profile
                  alignment: Alignment.topLeft,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Spacer(
                          flex: 1,
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            //circle
                            margin: EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                            alignment: Alignment.center,
                            width: 55,
                            height: 55,
                            child: Text(
                              'Logo',
                              style: TextStyle(
                                fontFamily: 'SegoePrint',
                                color: Colors.white,
                              ),
                            ),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(150, 0, 0, 1.0),
                                borderRadius: BorderRadius.circular(1000000)),
                          ),
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              Spacer(
                                flex: 1,
                              ),
                              Expanded(
                                flex: 7,
                                child: Container(
                                  child: Stack(
                                    children: <Widget>[
                                      FittedBox(
                                        child: Text(
                                          'Welcome, username \nemail here',
                                          style: TextStyle(
                                              fontFamily: 'SegoePrint',
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Spacer(
                                flex: 3,
                              ),
                              Expanded(
                                flex: 4,
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 23,
                                  width: 65,
                                  child: Text(
                                    'Rate Us',
                                    style: TextStyle(
                                        fontSize: 11, color: Colors.white),
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.red[900],
                                      borderRadius: BorderRadius.circular(8.0)),
                                ),
                              ),
                              Spacer(
                                flex: 1,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                //contains the tabs list
                height: height - topBoxHeight - 26,
                padding: EdgeInsets.all(8.0),
                width: topBoxWidth,
                //color: Colors.red[900],
                child: Container(
                  //color: Colors.blue,
                  child: Stack(
                    children: <Widget>[
                      Column(
                        children: [
                          tabBox(topBoxHeight, tabBoxColor, tabBoxPics,
                              tabBoxIndex, tabBoxNames, context, functions),
                          tabBox(topBoxHeight, tabBoxColor, tabBoxPics,
                              tabBoxIndex + 1, tabBoxNames, context, functions),
                          tabBox(topBoxHeight, tabBoxColor, tabBoxPics,
                              tabBoxIndex + 2, tabBoxNames, context, functions),
                          tabBox(topBoxHeight, tabBoxColor, tabBoxPics,
                              tabBoxIndex + 3, tabBoxNames, context, functions),
                        ],
                      ),
                      Positioned(
                        bottom: 0,
                        child: Container(
                          alignment: Alignment.center,
                          width: topBoxWidth / 3.5,
                          margin: EdgeInsets.fromLTRB(4.0, 8.0, 4.0, 4.0),
                          height: topBoxHeight / 4,
                          decoration: BoxDecoration(
                            color: tabBoxColor,
                            borderRadius: BorderRadius.circular(8.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey[600],
                                blurRadius: 2,
                                spreadRadius: 0.08,
                                offset: Offset(
                                  2.0, //Move to right 10 horizontally
                                  2.5, //Move to bottom 10  vertically
                                ),
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.settings,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          alignment: Alignment.center,
                          width: topBoxWidth / 3.5,
                          margin: EdgeInsets.fromLTRB(4.0, 8.0, 4.0, 4.0),
                          height: topBoxHeight / 4,
                          decoration: BoxDecoration(
                            color: tabBoxColor,
                            borderRadius: BorderRadius.circular(8.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey[600],
                                blurRadius: 2,
                                spreadRadius: 0.08,
                                offset: Offset(
                                  2.0, //Move to right 10 horizontally
                                  2.5, //Move to bottom 10  vertically
                                ),
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.exit_to_app,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container tabBox(
      double topBoxHeight,
      Color tabBoxColor,
      List<String> tabBoxPics,
      int tabBoxIndex,
      List<String> tabBoxNames,
      BuildContext context,
      var functions) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.fromLTRB(4.0, 8.0, 4.0, 4.0),
      padding: EdgeInsets.all(3.0),
      height: topBoxHeight / 4,
      decoration: BoxDecoration(
        color: tabBoxColor,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[600],
            blurRadius: 2,
            spreadRadius: 0.08,
            offset: Offset(
              2.0, //Move to right 10 horizontally
              2.5, //Move to bottom 10  vertically
            ),
          ),
        ],
      ),
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image.asset(tabBoxPics[tabBoxIndex]),
              Text(
                tabBoxNames[tabBoxIndex],
                style: TextStyle(
                    fontSize: 20, color: Colors.black, fontFamily: 'ComicSans'),
              ),
            ],
          ),
          MaterialButton(
            //color: Colors.yellow,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => functions[tabBoxIndex],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
