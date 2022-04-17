

import 'package:flutter/material.dart';
import 'package:random_game_new_version/pages/playerslevelpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LevelDashboard extends StatefulWidget {
  static const String routeName = '/levelboard';


  @override
  _LevelDashboardState createState() => _LevelDashboardState();
}

class _LevelDashboardState extends State<LevelDashboard> {
  var status1 = true;
  var status2 = true;
  var status3 = true;
  var status4 = true;
  var status5 = true;
  var status6 = true;
  late double height;
  int onBtnColor = 0xffff1dcd;
  String levelCount = '';

  @override
  void initState() {

    fetchHigestScoreFromSharedPref();
    Future.delayed(Duration(microseconds: 2000), () {
      findWhichLevelAreOpen();
    });
    setState(() {

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Container(
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('img/level_bg.png'), fit: BoxFit.fill)),
              child: Stack(
                children: [
                  Align(
                    alignment: const Alignment(-.1,1),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 25),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircleAvatar(
                            backgroundImage: const AssetImage('img/level_number.png'),
                            backgroundColor: Colors.red.shade800,
                            radius: 17,
                            child: Text("1"),
                          ),
                          Image.asset('img/loli.png',height: 55,),

                        ],
                      ),
                    )),
                  Align(
                    alignment: const Alignment(-.45,.80),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 25),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircleAvatar(
                            backgroundImage: const AssetImage('img/level_number.png'),
                            backgroundColor: Colors.red.shade800,
                            radius: 17,
                            child: Text("2"),
                          ),
                          Image.asset('img/loli.png',height: 50,),

                        ],
                      ),
                    )),
                  Align(
                      alignment: const Alignment(-.75,.60),
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 25),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircleAvatar(
                              backgroundImage: const AssetImage('img/level_number.png'),
                              backgroundColor: Colors.red.shade800,
                              radius: 17,
                              child: Text("3"),
                            ),
                            Image.asset('img/loli.png',height: 45,),

                          ],
                        ),
                      )),
                  Align(
                      alignment: const Alignment(-.65,.30),
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 25),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircleAvatar(
                              backgroundImage: const AssetImage('img/level_number.png'),
                              backgroundColor: Colors.red.shade800,
                              radius: 17,
                              child: Text("4"),
                            ),
                            Image.asset('img/loli.png',height: 40,),

                          ],
                        ),
                      )),
                  Align(
                      alignment: const Alignment(-.30,.15),
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 25),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircleAvatar(
                              backgroundImage: const AssetImage('img/level_number.png'),
                              backgroundColor: Colors.red.shade800,
                              radius: 17,
                              child: Text("5"),
                            ),
                            Image.asset('img/loli.png',height: 30,),

                          ],
                        ),
                      )),
                  Align(
                      alignment: const Alignment(0,0.3),
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 25),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircleAvatar(
                              backgroundImage: const AssetImage('img/level_number.png'),
                              backgroundColor: Colors.red.shade800,
                              radius: 17,
                              child: Text("6"),
                            ),
                            Image.asset('img/loli.png',height: 40,),

                          ],
                        ),
                      )),
                  // Align(
                  //     alignment: Alignment(-.15, 1),
                  //     child: Container(
                  //
                  //       margin: const EdgeInsets.only(bottom: 20),
                  //       child: Column(
                  //         mainAxisSize: MainAxisSize.min,
                  //         children: [
                  //           MaterialButton(
                  //             textColor: Colors.white,
                  //
                  //             child: Container(
                  //               margin: const EdgeInsets.only(top: 5),
                  //               decoration: const BoxDecoration(
                  //                 image: DecorationImage(
                  //                     image: AssetImage('img/level_number.png',),
                  //                     fit: BoxFit.fitWidth),
                  //               ),
                  //               child: const Padding(
                  //                 padding: EdgeInsets.all(12.0),
                  //                 child: Text("1"),
                  //               ),
                  //             ),
                  //             // ),
                  //             onPressed: () {
                  //               print('Tapped');
                  //             },
                  //           ),
                  //           Image.asset('img/loli.png',height: 55,),
                  //         ],
                  //       ),
                  //     )),

                ],
              )),
        ),
      ),
    );
  }

  Future<String> fetchHigestScoreFromSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      levelCount = prefs.getString("level")!;
    });
    return levelCount;
  }

  void findWhichLevelAreOpen() {
    print("Now" + levelCount);
    if (levelCount == '2') {
      setState(() {
        status1 = false;
        status2 = false;
      });
    } else if (levelCount == '3') {
      setState(() {
        status1 = false;
        status2 = false;
        status3 = false;
      });
    } else if (levelCount == '4') {
      setState(() {
        status1 = false;
        status2 = false;
        status3 = false;
        status4 = false;
      });
    } else if (levelCount == '5') {
      setState(() {
        status1 = false;
        status2 = false;
        status3 = false;
        status4 = false;
        status5 = false;
      });
    } else if (levelCount == '6') {
      setState(() {
        status1 = false;
        status2 = false;
        status3 = false;
        status4 = false;
        status5 = false;
        status6 = false;
      });
    }
  }
}
