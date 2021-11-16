 import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SubPage extends StatefulWidget {
  static const String routeName = '/sub_page';

   @override
   _SubPageState createState() => _SubPageState();
 }

 class _SubPageState extends State<SubPage> {
   int _start = 120;
   int _score = 0;
   int _higestScore = 0;
   var _min = 0;
   var _index1 = 0;
   var _index2 = 0;
   var _rand1 = 0;
   var _rand2 = 0;
   var _rand3 = 0;
   var a = 0;
   var b = 0;
   var c = 0;
   var d = 0;

   // late int SCORE;
   // late String BOT;
   bool showMsg = false;
   bool hideNumber = true;
   String _title = 'Noob';
   var _achivement = 'Beginner';
   var _date;


   DateTime now = DateTime.now();
   AudioPlayer player = AudioPlayer(mode: PlayerMode.LOW_LATENCY);

   String nameS = "Bot User",
       idS = "00",
       mailS = "user@",
       emailFromLogin = "email@from_user";
   List<int> list = [];
   final _random = Random.secure();
   final _diceList = <String>[
     'img/nm1.png',
     'img/nm2.png',
     'img/nm3.png',
     'img/nm4.png',
     'img/nm5.png',
     'img/nm6.png',
     'img/nm7.png',
     'img/nm8.png',
     'img/nm9.png',
   ];

   ///
   ///
   late FToast fToast;
   @override
   void initState() {
     super.initState();
     fToast = FToast();
     fToast.init(context);
     fetchHigestScoreFromSharedPref();
   }
   @override
   Widget build(BuildContext context) {
     _rollTheDice();
     return Scaffold(
       // appBar: AppBar(
       //   title: Text('Plus'),
       //   centerTitle: true,
       //   backgroundColor: Color(0xffF61ABC),
       //   elevation: 0,
       // ),
       body: Container(

           height: double.maxFinite,
           padding: EdgeInsets.only(top: 80,left: 10,right: 10),
           decoration: BoxDecoration(
             image: DecorationImage(
               image: ExactAssetImage('img/game_bg.png',),
               fit: BoxFit.fill,
             ),
           ),
           child: Container(
             width: double.maxFinite,
             child: Center(
               child: Stack(
                 children: [

                   Image.asset('img/angle_drag.png',fit: BoxFit.cover,filterQuality: FilterQuality.high),
                   Container(
                     padding: EdgeInsets.only(top: 147),
                     child: Stack(
                       children: [
                         Image.asset('img/number_bg.png',fit: BoxFit.cover,filterQuality: FilterQuality.high),
                         Padding(
                           padding:
                           const EdgeInsets.only(left: 27.0, right: 27,top: 30),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Text(
                                 ' Higest Score :$_higestScore',
                                 style: GoogleFonts.bubblegumSans(
                                     fontSize: 20,color: Colors.pinkAccent
                                 ),
                               ),
                               Text(
                                 "Hello..!!  ",

                                 style: GoogleFonts.bubblegumSans(
                                     fontSize: 20,color: Colors.pinkAccent
                                 ),
                               ),
                             ],
                           ),
                         ),
                         Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Center(
                               child:Container(
                                 height: 40,
                                 width: 149,
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(25),
                                   image: DecorationImage(

                                       image: AssetImage('img/score_btn.png',),
                                       fit: BoxFit.cover,filterQuality: FilterQuality.high),
                                 ),
                                 child: Center(child: Text('Score : $_score',style: GoogleFonts.bubblegumSans(color: Colors.white,fontSize: 20),)),

                               ),),
                             Row(
                               mainAxisAlignment: MainAxisAlignment.spaceAround,
                               children: [
                                 Container(
                                   margin: EdgeInsets.all(15),
                                   child: Row(
                                     children: [
                                       Padding(
                                         padding: const EdgeInsets.all(8.0),
                                         child: Image.asset(
                                           _diceList[_index1],
                                           height: 80,
                                           width: 80,
                                         ),
                                       ),
                                       Padding(
                                         padding: const EdgeInsets.all(8.0),
                                         child: Image.asset(
                                           'img/min.png',
                                           height: 80,
                                           width: 80,
                                         ),
                                       ),
                                       Padding(
                                         padding: const EdgeInsets.all(8.0),
                                         child: Image.asset(
                                           _diceList[_index2],
                                           height: 80,
                                           width: 80,
                                         ),
                                       ),
                                     ],
                                   ),
                                 )
                               ],
                             ),
                             Column(
                               children: [
                                 Padding(
                                   padding: const EdgeInsets.all(8.0),
                                   child: Row(
                                     mainAxisSize: MainAxisSize.max,
                                     mainAxisAlignment: MainAxisAlignment.center,
                                     children: [
                                       GestureDetector(
                                         child: Container(
                                           height: 42,
                                           width: 135,
                                           decoration: BoxDecoration(
                                             borderRadius: BorderRadius.circular(25),
                                             image: DecorationImage(

                                                 image: AssetImage('img/score_btn.png',),
                                                 fit: BoxFit.cover,filterQuality: FilterQuality.high),
                                           ),
                                           child: Center(child: Text('$a',style: GoogleFonts.bubblegumSans(color: Colors.white,fontSize: 20),)),

                                         ),
                                         onTap: (){
                                           checkRes(a);
                                         },
                                       ),
                                       SizedBox(width: 10,),
                                       GestureDetector(
                                         child: Container(
                                           height: 42,
                                           width: 135,
                                           decoration: BoxDecoration(
                                             borderRadius: BorderRadius.circular(25),
                                             image: DecorationImage(

                                                 image: AssetImage('img/score_btn.png',),
                                                 fit: BoxFit.cover,filterQuality: FilterQuality.high),
                                           ),
                                           child: Center(child: Text('$b',style: GoogleFonts.bubblegumSans(color: Colors.white,fontSize: 20),)),

                                         ),
                                         onTap: (){
                                           checkRes(b);
                                         },
                                       ),
                                     ],
                                   ),

                                 ),//buttns1,2
                                 Padding(
                                   padding: const EdgeInsets.only(left: 8.0,right: 8),
                                   child: Row(
                                     mainAxisSize: MainAxisSize.max,
                                     mainAxisAlignment: MainAxisAlignment.center,
                                     children: [
                                       GestureDetector(
                                         child: Container(
                                           height: 42,
                                           width: 135,
                                           decoration: BoxDecoration(
                                             borderRadius: BorderRadius.circular(25),
                                             image: DecorationImage(

                                                 image: AssetImage('img/score_btn.png',),
                                                 fit: BoxFit.cover,filterQuality: FilterQuality.high),
                                           ),
                                           child: Center(child: Text('$c',style: GoogleFonts.bubblegumSans(color: Colors.white,fontSize: 20),)),

                                         ),
                                         onTap: (){
                                           checkRes(c);
                                         },
                                       ),
                                       SizedBox(width: 10,),
                                       GestureDetector(
                                         child: Container(
                                           height: 42,
                                           width: 135,
                                           decoration: BoxDecoration(
                                             borderRadius: BorderRadius.circular(25),
                                             image: DecorationImage(

                                                 image: AssetImage('img/score_btn.png',),
                                                 fit: BoxFit.cover,filterQuality: FilterQuality.high),
                                           ),
                                           child: Center(child: Text('$d',style: GoogleFonts.bubblegumSans(color: Colors.white,fontSize: 20),)),

                                         ),
                                         onTap: (){
                                           checkRes(d);
                                         },
                                       ),
                                     ],
                                   ),
                                 ), //buttns3,4

                               ],
                             ),
                             SizedBox(height: 60,)
                           ],
                         )
                       ],
                     ),


                   ),

                   Center(
                     child: Align(
                       alignment: Alignment.bottomCenter,
                       child: MaterialButton(
                         padding: const EdgeInsets.all(18.0),
                         textColor: Colors.white,
                         splashColor: Colors.greenAccent,
                         elevation: 8.0,
                         child: Container(
                           height: 45,
                           width: 120,
                           decoration: BoxDecoration(

                             image: DecorationImage(

                                 image: AssetImage('img/skip_btn.png',),
                                 fit: BoxFit.cover,filterQuality: FilterQuality.high),
                           ),

                         ),
                         // ),
                         onPressed: () {
                           _rollTheDice();
                         },
                       ),
                     ),
                   ),

                 ],
               ),

             ),
           )





       ),
     );
   }


   void _rollTheDice() {
     // _fetchUserInfo();

     if (_score > _higestScore) {
       _higestScore = _score;
       if (_score > 5) {
         _title = 'amature';
       }
       if (_score > 10) {
         _title = 'pro';
       }
       if (_score > 15) {
         _title = 'legend';
       }
     }
     // _saveLastScore(_higestScore);
     setState(() {
       _index1 = _random.nextInt(9);
       _index2 = _random.nextInt(9);
       if(_index2>_index1)
       {
         setState(() {
           _index1=_index2;
           _index2=_index1-1;
         });
       }
       print(_index1.toString()+"=="+_index2.toString());


       _rand1 = _random.nextInt(9);
       _rand2 = _random.nextInt(9);
       _rand3 = _random.nextInt(9);

       _min = _index1 - _index2 ;

       // _score =_score +_index1 + _index2 + 2;

       suffle(_rand1, _rand2, _rand3, _min);
     });
   }

   void suffle(int rand1, int rand2, int rand3, int sum) {
     if (rand1 == rand2) {
       _rand2 = _rand2 + 1;
     }
     if (rand1 == rand3) {
       _rand3 = _rand3 + 1;
     }
     if (rand1 == rand3) {
       _rand1 = _rand1 + 1;
     }
     if (_rand1 == sum || _rand2 == sum || _rand3 == sum) {
       _rand1 = _rand1 + 2;
       _rand2 = _rand2 + 3;
       _rand3 = _rand3 + 1;
     }

     list = [rand1, rand2, rand3, sum];
     list.shuffle();
     // print(list);

     a = list[0];
     b = list[1];
     c = list[2];
     d = list[3];
     print("$a" + " " "$b" + " " + "$c" + " " "$d");
   }

   checkRes(int a) {
     // print(a);
     int aa = a;
     if (aa == _min) {
       final player = AudioCache();
       // congrats sound
       player.play('play.wav');
       setState(() {

       });
       // setState(() {
       //   showMsg = true;
       //   hideNumber = false;
       //   Future.delayed(const Duration(milliseconds: 500), () {
       //     setState(() {
       //       showMsg = false;
       //       hideNumber = true;
       //     });
       //   });
       // });
       _score++;
     } else {
       print("ERROR");
       showToast();
     }
   }

   showToast() {
     //buzzer sound
     final player = AudioCache();
     player.play('buzzer.wav');

     Widget toast = Container(
       height: 320,
       width: 300,
       decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(15.0),
           color: Colors.white,
           border: Border.all(
             color: Colors.grey, //                   <--- border color
             width: 1.0,
           )),
       child: Column(
         children: [
           Container(
             height: 70,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.only(
                   topLeft: Radius.circular(15), topRight: Radius.circular(15)),
               color: Colors.red,
             ),
             child: Row(
               crossAxisAlignment: CrossAxisAlignment.stretch,
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Icon(
                   Icons.error,
                   color: Colors.white,
                   size: 30,
                 ),
                 SizedBox(
                   width: 14.0,
                 ),
                 Center(
                     child: Text(
                       "Wrong Answer",
                       style: TextStyle(fontSize: 24, color: Colors.white),
                     )),
               ],
             ),
           ),
           Container(
             height: 180,
             child: Center(
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text(
                     "Better Luck Next Time",
                     style: TextStyle(fontSize: 20),
                   ),
                   SizedBox(
                     height: 14.0,
                   ),
                   Text(
                     "Do You Want to Play Again ?",
                     style: TextStyle(fontSize: 20),
                   ),
                 ],
               ),
             ),
           ),
           Container(
             child: Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 FlatButton(
                     color: Colors.grey,
                     shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(18.0)),
                     child: new Text(
                       'Exit',
                       style: TextStyle(color: Colors.white),
                     ),
                     onPressed: () {
                       _date =
                       "${now.year.toString()}-${now.month.toString().padLeft(
                           2, '0')}-${now.day.toString().padLeft(2, '0')} ${now
                           .hour.toString().padLeft(2, '0')}-${now.minute
                           .toString().padLeft(2, '0')}";
                       saveHigestScoreToSharedPref(_higestScore);
                       fToast.removeCustomToast();
                       Navigator.pop(context);
                     }),
                 SizedBox(
                   width: 14.0,
                 ),
                 FlatButton(
                   color: Colors.red,
                   shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(18.0)),
                   child: new Text(
                     'Play',
                     style: TextStyle(color: Colors.white),
                   ),
                   onPressed: () {
                     customToastShow();
                     _date =
                     "${now.year.toString()}-${now.month.toString().padLeft(
                         2, '0')}-${now.day.toString().padLeft(2, '0')} ${now
                         .hour.toString().padLeft(2, '0')}-${now.minute
                         .toString().padLeft(2, '0')}";
                     setState(() {
                       _score=0;
                     });
                   },
                 ),
               ],
             ),
           ),
         ],
       ),
     );

     fToast.showToast(
       child: toast,
       gravity: ToastGravity.CENTER,
       toastDuration: Duration(seconds: 20),
     );

     // Custom Toast Position
   }

   void customToastShow() {
     fToast.removeCustomToast();
     _score = 0;

     // _rollTheDice();
   }




   void saveHigestScoreToSharedPref(int higest) async {
     var now = new DateTime.now();
     var formatter = new DateFormat('MMM-dd / h:mm');
     String formattedDate = formatter.format(now);

     var sharedPreferences = await SharedPreferences.getInstance();
     sharedPreferences.setInt("min", higest);
     sharedPreferences.setString("minDt", formattedDate);

   }
   Future<int> fetchHigestScoreFromSharedPref() async {
     final prefs = await SharedPreferences.getInstance();
     setState(() {
       _higestScore = prefs.getInt("min")!;

     });
     return _higestScore;
   }
 }