import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:random_game_new_version/auth/firebase_auth_services.dart';
import 'package:random_game_new_version/custom_widget/animation_toast.dart';
import 'package:random_game_new_version/custom_widget/helper%20class.dart';
import 'package:random_game_new_version/models/players_info_model.dart';
import 'package:random_game_new_version/providers/players_info_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlusPage extends StatefulWidget {
  static const String routeName = '/plus_page';
  @override
  _PlusPageState createState() => _PlusPageState();
}

class _PlusPageState extends State<PlusPage> {

   String? userName;
   late PlayersPrvider _playersPrvider;

   PlayerInfoModel _playerInfoModel=PlayerInfoModel();

  // late Timer _timer;
  int _start = 120;
  int _score = 0;
  int _higestScore = 0;
  var _sum = 0;
  var _index1 = 0;
  var _index2 = 0;
  var _rand1 = 0;
  var _rand2 = 0;
  var _rand3 = 0;
  var a = 0;
  var b = 0;
  var c = 0;
  var d = 0;

   late String formattedDate;
  bool showMsg = false;
  bool hideNumber = true;
  bool showHigestAndName=true;

  String _title = 'Noob';
  final _achivement = 'Beginner';


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
    // checkUserLoginOrNot();

    fetchHigestScoreFromSharedPref();
  }
   void didChangeDependencies() {
     _playersPrvider=Provider.of<PlayersPrvider>(context,listen: false);
     _playersPrvider.getCC();
     super.didChangeDependencies();
   }



  @override
  Widget build(BuildContext context) {

    _rollTheDice();
    //initial call

    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Plus'),
      //   centerTitle: true,
      //   backgroundColor: Color(0xffF61ABC),
      //   elevation: 0,
      // ),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.only(top: 100,left: 10,right: 10),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: ExactAssetImage('img/game_bg2.png',),
            fit: BoxFit.fill,
           filterQuality: FilterQuality.high
          ),
        ),
        child: SizedBox(
          width: double.maxFinite,
          height: double.infinity,

          child: Stack(

            children: [
              Stack(
                children: [
                  // FutureBuilder(future: _playersPrvider.getCC(),
                  //   builder: (context,snapshot){
                  //   return Text('COIN : ${snapshot.data}');
                  //   },
                  // ),

                   // Image.asset('img/number_bg.png',fit: BoxFit.cover,filterQuality: FilterQuality.high),
                 Align(
                   alignment: Alignment.center,
                   child:  Image.asset('img/number_bg.png',fit: BoxFit.cover,filterQuality: FilterQuality.high),
                 ),

                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Center(
                          child:Column(
                            children: [

                               Container(
                                 child:  Padding(
                                   padding:
                                   const EdgeInsets.only(left: 27.0, right: 27,top: 40),
                                   child: Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                     children: [

                                       Text('Higest Score :$_higestScore',
                                                 style: GoogleFonts.bubblegumSans(
                                                     fontSize: 20,color: Colors.pinkAccent
                                                 ),
                                               ), // Return empty container to avoid build error
                                       Text(Value.getString().toString()

                                         ,
                                         style: GoogleFonts.bubblegumSans(
                                             fontSize: 20,color: Colors.pinkAccent
                                         ),
                                       ), //Retriving name
                                     ],
                                   ),
                                 ),
                               ),
                              const SizedBox(height: 15,),
                              Container(
                                height: 40,
                                width: 149,

                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  image: const DecorationImage(

                                      image: AssetImage('img/score_btn.png',),
                                      fit: BoxFit.cover,filterQuality: FilterQuality.high),
                                ),
                                child: Center(child: Text('Score : $_score',style: GoogleFonts.bubblegumSans(color: Colors.white,fontSize: 20),)),

                              ),
                            ],
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
                                      'img/plus.png',
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
                                        image: const DecorationImage(

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
                                        image: const DecorationImage(

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
                                        image: const DecorationImage(

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
                    ),
                  )

                ],
              ),


              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MaterialButton(
                            padding: const EdgeInsets.all(18.0),
                            textColor: Colors.white,
                            splashColor: Colors.greenAccent,
                            elevation: 8.0,
                            child: Container(
                              height: 45,
                              width: 120,
                              decoration: const BoxDecoration(

                                image: DecorationImage(
                                    image: AssetImage('img/back.png',),
                                    fit: BoxFit.cover,filterQuality: FilterQuality.high),
                              ),

                            ),
                            // ),
                            onPressed: () async{

                              // savePlayersInfoToFirebase();
                             // await _playersPrvider.savePlayersInfo(_playerInfoModel);
                              replacePlayersInfo();
                              saveHigestScoreToSharedPref(_higestScore);
                              Navigator.pop(context);
                            },
                          ),
                          MaterialButton(
                            padding: const EdgeInsets.all(18.0),
                            textColor: Colors.white,
                            splashColor: Colors.greenAccent,
                            elevation: 8.0,
                            child: Container(
                              height: 45,
                              width: 120,
                              decoration: const BoxDecoration(

                                image: DecorationImage(

                                    image: AssetImage('img/skip.png',),
                                    fit: BoxFit.cover,filterQuality: FilterQuality.high),
                              ),

                            ),
                            // ),
                            onPressed: () {
                              _rollTheDice();


                            },
                          ),
                        ],
                      )
                  ),
                ),
              ),

            ],
          ),
        ),





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
      _rand1 = _random.nextInt(24);
      _rand2 = _random.nextInt(24);
      _rand3 = _random.nextInt(24);

      _sum = _index1 + _index2 + 2;

      // _score =_score +_index1 + _index2 + 2;

      suffle(_rand1, _rand2, _rand3, _sum);
    });
  }

  void suffle(int rand1, int rand2, int rand3, int sum) {
    if (rand1 == rand2||rand2==rand3) {
      _rand2 = _rand2 + 1;

    }
    if (rand1 == rand3||rand3==rand2) {
      _rand3 = _rand3 + 1;
    }
    if (rand1 == rand3||rand1==rand2) {
      _rand1 = _rand1 + 1;
    }
    if (_rand1 == sum || _rand2 == sum || _rand3 == sum) {
      _rand1 = _rand1 + 2;
      _rand2 = _rand2 + 3;
      _rand3 = _rand3 + 1;
    }

    list = [_rand1, _rand2, _rand3, sum];
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

    //show congratulations toast



    if (aa == _sum) {
      final player = AudioCache();
      // congrats sound
      player.play('play.wav');
      Widget toast= CustomCongoToast.showCongratsMsg();
      fToast.showToast(
        child: toast,
        gravity: ToastGravity.CENTER,
        toastDuration: const Duration(milliseconds: 900),
      );
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

    Widget toast=Container(
      alignment: Alignment.bottomCenter,
      height: MediaQuery.of(context).size.height/2,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("img/wrng.png",),
          fit: BoxFit.fill,
        ),
      ),
      child: Container(
        height: 80,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 28.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(width: 10,),
              GestureDetector(child: Image.asset("img/no.png",fit: BoxFit.cover,width: 120,),onTap: (){
                saveHigestScoreToSharedPref(_higestScore);
                fToast.removeCustomToast();
                Navigator.pop(context);
              },),
              GestureDetector(child: Image.asset("img/yes.png",fit: BoxFit.cover,width: 120,),onTap: (){
                // saveHigestScoreToSharedPref(_higestScore);
                fToast.removeCustomToast();
                setState(() {
                  _score=0;
                });


              },),
              const SizedBox(width: 10,)

            ],
          ),
        ),
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.CENTER,
      toastDuration: Duration(seconds: 120),
    );

    // Custom Toast Position
  }

  // void customToastShow() {
  //   fToast.removeCustomToast();
  //   _score = 0;
  //
  //   // _rollTheDice();
  // }







  void savePlayersInfoToFirebase() {
    var now = DateTime.now();
    var formatter = DateFormat('MMM-dd / h:mm');
    formattedDate = formatter.format(now);
    String? mail;
    if(FirebaseAuthServices.currentUser==null)
      {
      mail="bot@gmail.com";
      }
    else
      {
        mail=FirebaseAuthServices.currentUser!.email;
      }
    _playerInfoModel.name=Value.getString().toString();
    _playerInfoModel.email=mail;
    _playerInfoModel.titel=_title;
    _playerInfoModel.plus=_higestScore;
    _playerInfoModel.min=_score;
    _playerInfoModel.mup=_score;
    _playerInfoModel.div=_score;
    _playerInfoModel.achivement=_achivement;
    _playerInfoModel.time=formattedDate;

    print('firebase saving');

  }

  // void checkUserLoginOrNot() {
  //   if(FirebaseAuthServices.currentUser==null)
  //   {
  //     setState(() {
  //       showHigestAndName=false;
  //     });
  //     // showTxt=false;
  //   }
  //   else
  //   {
  //     showHigestAndName=true;
  //   }
  // }

  void replacePlayersInfo() async{
      var now = new DateTime.now();
      var formatter = DateFormat('MMM-dd / h:mm');
      formattedDate = formatter.format(now);

      _playerInfoModel=(await _playersPrvider.findPlayersAllInfo(FirebaseAuthServices.currentUser!.email.toString()))!;
      if(_playerInfoModel!=null)
        {
          savePlayersInfoToFirebase();
          await _playersPrvider.updateProfileScore(_playerInfoModel,"plus");
          print("found");
        }
      else
        {
          print("Not found");
        }

  }

   void saveHigestScoreToSharedPref(int higest) async {
     var now = DateTime.now();
     var formatter = DateFormat('MMM-dd / h:mm');
     String formattedDate = formatter.format(now);

     var sharedPreferences = await SharedPreferences.getInstance();
     sharedPreferences.setInt("plus", higest);
     // sharedPreferences.setString("minDt", formattedDate);

   }
   Future<int> fetchHigestScoreFromSharedPref() async {
     final prefs = await SharedPreferences.getInstance();
     setState(() {
       _higestScore = prefs.getInt("plus")!;

     });
     return _higestScore;
   }





}
