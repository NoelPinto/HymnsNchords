import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:here/home.dart';

class Login extends StatelessWidget {
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
          appBar: AppBar(
            backgroundColor: appbarColor,
            elevation: 0,
            toolbarHeight: height + 2,
            shadowColor: Colors.black,
          ),
          body: Container(
            child: Column(
              children: [
                Expanded(
                  flex: 6,
                  child: Container(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                '''Welcome to 
HymnsNChords App!''',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 28,
                                    fontFamily: 'ComicSans',
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(40.0, 0, 40.0, 0),
                            child: Stack(
                              alignment: Alignment.bottomLeft,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    //  color: Colors.blue,
                                    border: Border.all(
                                        width: 1.0, color: Colors.white),
                                  ),
                                ),
                                Container(
                                  margin:
                                      EdgeInsets.only(bottom: 8.0, left: 8.0),
                                  child: Text(
                                    'username',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(40.0, 0, 40.0, 0),
                            child: Stack(
                              alignment: Alignment.bottomLeft,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    //  color: Colors.blue,
                                    border: Border.all(
                                        width: 1.0, color: Colors.white),
                                  ),
                                ),
                                Container(
                                  margin:
                                      EdgeInsets.only(bottom: 8.0, left: 8.0),
                                  child: Text(
                                    'password',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 8.0),
                          child: Text(
                            'forgot your password?',
                            style: TextStyle(color: Colors.white70),
                          ),
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        Expanded(
                          flex: 1,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 100.0,
                                decoration: BoxDecoration(
                                    //     color: Colors.blue,
                                    border: Border.all(
                                        color: Colors.white, width: 1.0)),
                              ),
                              Container(
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      fontSize: 18.0),
                                ),
                              ),
                              MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => HomePage()),
                                  );
                                },
                                color: Colors.green,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    //  color: Colors.green,
                  ),
                ),
                Spacer(
                  flex: 2,
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(40.0, 0, 40.0, 16.0),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            //  color: Colors.blue,
                            border: Border.all(width: 1.0, color: Colors.white),
                          ),
                        ),
                        Container(
                          child: Text(
                            'Not a user yet? Register here',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
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
