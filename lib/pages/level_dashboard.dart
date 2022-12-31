

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:random_game_new_version/models/players_info_model.dart';
import 'package:random_game_new_version/pages/playerslevelpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../providers/players_info_provider.dart';

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
  bool circle = true;
  bool circle2 = false;
  bool circle3 = false;
  bool circle4 = false;
  bool circle5 = false;
  bool circle6 = false;

  var level_bg2=const AssetImage('img/level_number.png');
  var level_bg3=const AssetImage('img/level_number.png');
  var level_bg4=const AssetImage('img/level_number.png');
  var level_bg5=const AssetImage('img/level_number.png');
  var level_bg6=const AssetImage('img/level_number.png');
  var level_bg7=const AssetImage('img/level_number.png');
  var level_bg8=const AssetImage('img/level_number.png');
  late double height;
  int onBtnColor = 0xffff1dcd;
  String levelCount = '';
  late PlayersPrvider prvider;
  PlayerInfoModel? playersInfo;

  @override
  void initState() {

    // fetchHigestScoreFromSharedPref();
    // Future.delayed(const Duration(microseconds: 1000), () {
    //   findWhichLevelAreOpen();
    // });
    // setState(() {
    //
    // });
    super.initState();
  }

  @override
  void didChangeDependencies() {
     playersInfo=ModalRoute.of(context)!.settings.arguments as PlayerInfoModel?;
     if(playersInfo!=null){
       if(playersInfo!.coin!>100){
         circle3=true;
       }
     }
     prvider=Provider.of(context,listen: true);

    super.didChangeDependencies();
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
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height/3.2,width: MediaQuery.of(context).size.width,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset('img/score_bg.png',height: MediaQuery.of(context).size.height/3.2,width: MediaQuery.of(context).size.width,),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(height: 35,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset('img/trophy.png',height: 26,),
                                    SizedBox(width: 5,),
                                    Text('Ameature',style: TextStyle(fontSize: 16),)
                                  ],
                                ),
                                 SizedBox(height: 10,),
                                 Row(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                   Container(
                                     width: 80,
                                     padding: EdgeInsets.all(5),
                                     decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(10),
                                         border: Border.all(
                                             color: Colors.pinkAccent,
                                             width: 1
                                         )
                                     ),
                                     child: Row(
                                       mainAxisSize: MainAxisSize.min,
                                       children: [
                                         Image.asset('img/title.png',height: 20,),
                                         SizedBox(width: 5,),
                                         Text('Legend',style: TextStyle(fontSize: 12),)
                                       ],
                                     ),
                                   ),
                                   SizedBox(width: 10,),
                                   Container(
                                     width: 80,
                                     alignment: Alignment.center,
                                     padding: EdgeInsets.all(5),
                                     decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(10),
                                         border: Border.all(
                                             color: Colors.pinkAccent,
                                             width: 1
                                         )
                                     ),
                                     child: Row(
                                       mainAxisSize: MainAxisSize.min,
                                       children: [
                                         Image.asset('img/coin.png',height: 20,),
                                         SizedBox(width: 5,),
                                         Text('100',style: TextStyle(fontSize: 12),)
                                       ],
                                     ),
                                   ),
                                 ],
                               ),
                                SizedBox(height: 10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset('img/plus.png',height: 25,),
                                    SizedBox(width: 10,),
                                    Image.asset('img/score_btn2.png',height: 25,),

                                  ],
                                ),
                                SizedBox(height: 5,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset('img/min.png',height: 25,),
                                    SizedBox(width: 10,),
                                    Image.asset('img/score_btn2.png',height: 25,),

                                  ],
                                ),
                                SizedBox(height: 5,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset('img/mup.png',height: 25,),
                                    SizedBox(width: 10,),
                                    Image.asset('img/score_btn2.png',height: 25,),

                                  ],
                                ),
                                SizedBox(height: 5,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset('img/div.png',height: 25,),
                                    SizedBox(width: 10,),
                                    Image.asset('img/score_btn2.png',height: 25,),

                                  ],
                                )

                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const Alignment(-.1,1),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 25),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            decoration:circle?currentLevelBorder():null,
                            child: GestureDetector(
                              child: CircleAvatar(
                                backgroundImage: const AssetImage('img/level_number_on.png'),
                                backgroundColor: Colors.red.shade800,
                                radius: 17,
                                child: const Text("1",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 18)),
                              ),
                              onTap:(){
                                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PlayersLevelPage(value: '1',)));

                              },
                            ),
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
                          Container(
                            decoration:circle2?currentLevelBorder():null,
                            child: GestureDetector(
                              child: CircleAvatar(
                                backgroundImage: level_bg2,
                                backgroundColor: Colors.red.shade800,
                                radius: 17,
                                child: const Text("2",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 18)),
                              ),
                             onTap: (){
                               if(!status2){
                                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PlayersLevelPage(value: '2',)));
                               }
                               else{
                                 print("Failed...........2");
                               }

                             },
                            ),
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
                            Container(
                              decoration:circle3?currentLevelBorder():null,
                              child: GestureDetector(
                                child: CircleAvatar(
                                  backgroundImage: level_bg3,
                                  backgroundColor: Colors.red.shade800,
                                  radius: 17,
                                  child: const Text("3",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 18)),
                                ),
                                onTap: (){
                                  if(!status3){
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PlayersLevelPage(value: '3',)));
                                  }
                                  else{
                                    print("Failed...........3");
                                  }
                                },
                              ),
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
                            Container(
                              decoration:circle5?currentLevelBorder():null,
                              child: GestureDetector(
                                child: CircleAvatar(
                                  backgroundImage: level_bg4,
                                  backgroundColor: Colors.red.shade800,
                                  radius: 17,
                                  child: Text("4",style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 18)),
                                ),
                                onTap: (){
                                  if(!status4){
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PlayersLevelPage(value: '4',)));
                                  }
                                  else{
                                    print("Failed...........4");
                                  }
                                },
                              ),
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
                            Container(
                              decoration:circle5?currentLevelBorder():null,
                              child: GestureDetector(
                                child: CircleAvatar(
                                  backgroundImage: level_bg5,
                                  backgroundColor: Colors.red.shade800,
                                  radius: 17,
                                  child: const Text("5",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 18)),
                                ),
                                onTap: (){
                                  if(!status5){
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PlayersLevelPage(value: '5',)));
                                  }
                                  else{
                                    print("Failed...........5");
                                  }
                                },
                              ),
                            ),
                            Image.asset('img/loli.png',height: 30,),

                          ],
                        ),
                      )),
                  Align(
                      alignment: const Alignment(0,0.24),
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 25),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              decoration:circle6?currentLevelBorder():null,
                              child: GestureDetector(
                                child: CircleAvatar(
                                  backgroundImage: level_bg6,
                                  backgroundColor: Colors.red.shade800,
                                  radius: 17,
                                  child: Text("6",style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 18)),
                                ),
                                onTap: (){
                                  if(!status6){
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PlayersLevelPage(value: '6',)));
                                  }
                                  else{
                                    print("Failed...........6");
                                  }
                                },
                              ),
                            ),
                            Image.asset('img/loli.png',height: 40,),

                          ],
                        ),
                      )),
                  Align(
                      alignment: const Alignment(-.2,0.40),
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 25),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircleAvatar(
                              backgroundImage: level_bg7,
                              backgroundColor: Colors.red.shade800,
                              radius: 17,
                              child: Text("7",style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 18)),
                            ),
                            Image.asset('img/loli.png',height: 40,),

                          ],
                        ),
                      )),
                  Align(
                      alignment: const Alignment(.3,0.48),
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 25),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircleAvatar(
                              backgroundImage: level_bg8,
                              backgroundColor: Colors.red.shade800,
                              radius: 17,
                              child: const Text("8",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 18),),
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
        circle2=true;
        circle=false;
        status1 = false;
        status2 = false;
        level_bg2=const AssetImage('img/level_number_on.png');
      });
    } else if (levelCount == '3') {
      setState(() {
        circle3=true;
        circle=false;
        status1 = false;
        status2 = false;
        status3 = false;
        level_bg2=const AssetImage('img/level_number_on.png');
        level_bg3=const AssetImage('img/level_number_on.png');
      });
    } else if (levelCount == '4') {
      setState(() {
        circle4=true;
        circle=false;
        status1 = false;
        status2 = false;
        status3 = false;
        status4 = false;
        level_bg2=const AssetImage('img/level_number_on.png');
        level_bg3=const AssetImage('img/level_number_on.png');
        level_bg4=const AssetImage('img/level_number_on.png');
      });
    } else if (levelCount == '5') {
      setState(() {
        circle5=true;
        circle=false;
        status1 = false;
        status2 = false;
        status3 = false;
        status4 = false;
        status5 = false;
      });
    } else if (levelCount == '6') {
      setState(() {
        circle6=true;
        circle=false;
        status1 = false;
        status2 = false;
        status3 = false;
        status4 = false;
        status5 = false;
        status6 = false;
      });
    }
  }

  currentLevelBorder() {
    return BoxDecoration(
        border: Border.all(
          color: Colors.pinkAccent, //color of border
          width: 5, //width of border
        ),
        borderRadius: BorderRadius.circular(25)
    );
  }
}
