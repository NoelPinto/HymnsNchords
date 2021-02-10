import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:here/transpose_controller.dart';
import 'sidebar.dart';

class HymnPage extends StatelessWidget {
  final String title;
  final String chords;
  final String scale;

  HymnPage({Key key, this.title, this.chords, this.scale}) : super(key: key);

  final Color appbarColor = Color.fromRGBO(127, 27, 27, 1.0);
  final height = AppBar().preferredSize.height;

  final Color gradientTopColor = Color.fromRGBO(127, 27, 27, 1.0);
  final Color gradientBottomColor = Color.fromRGBO(21, 4, 4, 1.0);

  @override
  Widget build(BuildContext context) {
    var transposeController = Get.find<TransposeController>();
    transposeController.setChords(chords, scale);

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
              child: FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'SegoePrint',
                  ),
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
            padding: EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 12.0),
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0)),
                ),
                Column(
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            alignment: Alignment.center,
                            //color: Colors.yellow,
                            margin: EdgeInsets.only(left: 8.0),
                            child: Obx(
                              () => Text(
                                "Key : " + transposeController.key.value,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "SegoePrint",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12),
                              ),
                            ),
                          ),
                          Spacer(
                            flex: 1,
                          ),
                          Container(
                            alignment: Alignment.center,
                            //color: Colors.yellow,
                            margin: EdgeInsets.only(right: 8.0),
                            child: Text(
                              "Tempo : 90",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "SegoePrint",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        alignment: Alignment.topCenter,
                        //color: Colors.yellow,
                        child: Text(
                          "Transpose",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "SegoePrint",
                              fontWeight: FontWeight.w500,
                              fontSize: 12),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        // color: Colors.blue,
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Stack(
                                alignment: Alignment.center,
                                children: <Widget>[
                                  Image.asset(
                                    'images/hymnpage/minussign.jpg',
                                    scale: 15,
                                    width: 13,
                                  ),
                                  MaterialButton(
                                    minWidth: 10,
                                    onPressed: () {
                                      transposeController.decreaseTranspose();
                                    },
                                    //color: Colors.green
                                  ),
                                ]),
                            Obx(() => Text(transposeController.transpose.value
                                .toString())),
                            // StreamBuilder<Object>(
                            //     initialData: 0,
                            //     stream: transposeBloc.counterStream,
                            //     builder: (context, snapshot) {
                            //       return
                            //     }),
                            Stack(
                                alignment: Alignment.center,
                                children: <Widget>[
                                  Image.asset('images/hymnpage/plussign.jpg',
                                      scale: 27),
                                  MaterialButton(
                                      minWidth: 10,
                                      onPressed: () {
                                        transposeController.increaseTranspose();

                                        //color: Colors.green
                                      })
                                ]),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Divider(
                        indent: 8.0,
                        endIndent: 8.0,
                        thickness: 1,
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                      flex: 40,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(12.0, 8.0, 8.0, 8.0),
                        child: Container(
                          //color: Colors.green,
                          child: ListView(
                            children: [
                              Obx(
                                () => Text(transposeController.chords.value),
                              ),
                            ],
                            //color: Colors.green,
                          ),
                        ),
                      ),
                    ),
                  ],
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
