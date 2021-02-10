import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:here/transpose_controller.dart';
import 'sidebar.dart';
import 'hymnpage.dart';

class Hymns extends StatefulWidget {
  final List<String> list = List.generate(10, (index) => 'Text $index');

  @override
  State<StatefulWidget> createState() {
    return HymnsState();
  }
}

class HymnsState extends State<Hymns> {
  final Color appbarColor = Color.fromRGBO(127, 27, 27, 1.0);
  final height = AppBar().preferredSize.height;

  final Color gradientTopColor = Color.fromRGBO(127, 27, 27, 1.0);
  final Color gradientBottomColor = Color.fromRGBO(21, 4, 4, 1.0);

  final categoryNames = [
    'Entrance',
    'Lord Have Mercy',
    'Gloria',
    'Acclamation',
    'Offertory',
    'Mystery Of Faith',
    'Communion',
    'Recessional',
  ];

  List<bool> boolList = [true, true, true, true, true, true, true, true];

  final categoryIndex = 0;

  var buttonColor = Color.fromRGBO(233, 217, 217, 1.0);

  var hymnCategorySelect = Container(
    color: Color.fromRGBO(60, 16, 15, 1.0),
  );

  void executefunction(int index, var hymnList) {
    setState(() {
      if (hymnList != null)
        hymnCategorySelect = hymnCategorySelectOp(hymnList);
      else
        hymnCategorySelect = Container(color: Color.fromRGBO(60, 16, 15, 1.0));
    });
  }

  int currentSelectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    var categoryFunctions = [
      'EntranceHymns',
      'LordHaveMercy',
      'Glory',
      'Acclamation',
      'OffertoryHymns',
      'MysteryOfFaith',
      'CommunionHymns',
      'RecessionalHymns'
    ];

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
                'Hymns',
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
          body: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment
                        .bottomCenter, // 10% of the width, so there are ten blinds.
                    colors: [
                      gradientTopColor,
                      gradientBottomColor,
                    ], // whitish to gray
                    tileMode: TileMode
                        .repeated, // repeats the gradient over the canvas
                  ),
                ),
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Row(
                        children: [
                          Spacer(
                            flex: 1,
                          ),
                          Expanded(
                            flex: 12,
                            child: Container(
                                padding: EdgeInsets.only(
                                  left: 12.0,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Search For A Hymn',
                                    hintStyle: TextStyle(color: Colors.black54),
                                  ),
                                )),
                          ),
                          Spacer(
                            flex: 1,
                          ),
                          Expanded(
                            flex: 3,
                            child: Stack(
                              fit: StackFit.expand,
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.center,
                                  child: MaterialButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Go',
                                      style: TextStyle(
                                        fontFamily: 'SegoePrint',
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.red[50],
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Spacer(
                            flex: 1,
                          ),
                        ],
                      ),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Expanded(
                      flex: 45,
                      child: Container(
                        margin: EdgeInsets.all(16.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              flex: 3,
                              child: ListView.builder(
                                itemCount: categoryNames.length,
                                itemBuilder: (context, index) {
                                  return Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          Divider(
                                            height: 0.5,
                                            thickness: 0.8,
                                            color: Colors.red,
                                          ),
                                          Container(
                                            alignment: Alignment.center,
                                            // color: Colors.green,
                                            height: 60,
                                            //margin: EdgeInsets.all(0.6),
                                            padding: EdgeInsets.all(1.0),
                                            color: boolList[index]
                                                ? buttonColor
                                                : Color.fromRGBO(
                                                    108, 28, 29, 1.0),
                                            child: Stack(
                                              fit: StackFit.expand,
                                              children: [
                                                Center(
                                                  child: boolList[index]
                                                      ? Text(
                                                          categoryNames[index],
                                                          textAlign:
                                                              TextAlign.center,
                                                        )
                                                      : Text(
                                                          categoryNames[index],
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                ),
                                                MaterialButton(
                                                  onPressed: () {
                                                    if (currentSelectedIndex >=
                                                        0)
                                                      boolList[
                                                              currentSelectedIndex] =
                                                          true;

                                                    executefunction(
                                                        index,
                                                        categoryFunctions[
                                                            index]);
                                                    boolList[index] = false;
                                                    setState(() {});
                                                    currentSelectedIndex =
                                                        index;
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            // VerticalDivider(
                            //   color: Colors.red,
                            //   width: 1.5,
                            // ),
                            Expanded(
                              flex: 7,
                              child: hymnCategorySelect,
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container hymnCategorySelectOp(var hymnList) {
    return Container(
      child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Hymns')
            .doc(hymnList)
            .collection('HymnNames')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container(
                child: Center(
              child: Text('Loading'),
            ));
          }
          return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 50,
                        color: Color.fromRGBO(60, 16, 15, 1.0),
                        child: Stack(
                          alignment: Alignment.center,
                          fit: StackFit.expand,
                          children: [
                            Center(
                              child: Text(
                                snapshot.data.documents[index]['name']
                                    .toString(),
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            MaterialButton(
                              //color: Colors.green,
                              onPressed: () {
                                Get.create(() => TransposeController());
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => HymnPage(
                                      title: snapshot
                                          .data.documents[index]['name']
                                          .toString(),
                                      chords: snapshot
                                          .data.documents[index]['lyrics']
                                          .toString(),
                                      scale: snapshot
                                          .data.documents[index]['scale']
                                          .toString(),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 0.6,
                        color: Colors.white54,
                      )
                    ],
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
