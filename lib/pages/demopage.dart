import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:random_game_new_version/providers/helper_class.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../auth/firebase_auth_services.dart';
import '../custom_widget/animation_toast.dart';
import '../custom_widget/helper class.dart';
import '../models/players_info_model.dart';
import '../providers/players_info_provider.dart';

class DemoPage extends StatefulWidget {

  static const String routeName='/demo';

  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  // int helperscore = 0;
  // int helperhigestScore = 0;
  // var helpermin = 0;
  // var helperindex1 = 0;
  // var helperindex2 = 0;
  // var helperrand1 = 0;
  // var helperrand2 = 0;
  // var helperrand3 = 0;
  // var a = 0;
  // var b = 0;
  // var c = 0;
  // var d = 0;


  bool showMsg = false;
  bool hideNumber = true;
  String _title = 'Noob';
  var _achivement = 'Beginner';
  AudioPlayer player = AudioPlayer(mode: PlayerMode.LOW_LATENCY);
  List<int> list = [];
  final _random = Random.secure();
  late FToast fToast;
  late PlayersPrvider _playersPrvider;
  PlayerInfoModel _playerInfoModel=PlayerInfoModel();



  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
    fetchHigestScoreFromSharedPref();
  }


  void didChangeDependencies() {
    _playersPrvider=Provider.of<PlayersPrvider>(context,listen: false);

    super.didChangeDependencies();
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
        child: Container(
          width: double.maxFinite,
          height: double.infinity,

          child: Stack(

            children: [

              Container(
                // padding: EdgeInsets.only(top: 131),
                child: Stack(

                  children: [
                    // Image.asset('img/number_bg.png',fit: BoxFit.cover,filterQuality: FilterQuality.high),
                    Align(
                      alignment: Alignment.center,
                      child:  Image.asset('img/number_bg.png',fit: BoxFit.cover,filterQuality: FilterQuality.high),
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child:Column(
                            children: [
                              Container(
                                child:  Padding(
                                  padding:
                                  const EdgeInsets.only(left: 27.0, right: 27,top: 40),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        ' Higest Score :${helper.higestScore}',
                                        style: GoogleFonts.bubblegumSans(
                                            fontSize: 20,color: Colors.pinkAccent
                                        ),
                                      ),
                                      Text(
                                        Value.getString().toString(),

                                        style: GoogleFonts.bubblegumSans(
                                            fontSize: 20,color: Colors.pinkAccent
                                        ),
                                      ),
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
                                child: Center(child: Text('Score : ${helper.score}',style: GoogleFonts.bubblegumSans(color: Colors.white,fontSize: 20),)),

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
                                      helper.diceList[helper.index1],
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
                                      helper.diceList[helper.index2],
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
                                      child: Center(child: Text('${helper.a}',style: GoogleFonts.bubblegumSans(color: Colors.white,fontSize: 20),)),

                                    ),
                                    onTap: (){
                                      checkRes(helper.a);
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
                                      child: Center(child: Text('${helper.b}',style: GoogleFonts.bubblegumSans(color: Colors.white,fontSize: 20),)),

                                    ),
                                    onTap: (){
                                      checkRes(helper.b);
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
                                      child: Center(child: Text('${helper.c}',style: GoogleFonts.bubblegumSans(color: Colors.white,fontSize: 20),)),

                                    ),
                                    onTap: (){
                                      checkRes(helper.c);
                                    },
                                  ),
                                  const SizedBox(width: 10,),
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
                                      child: Center(child: Text('${helper.d}',style: GoogleFonts.bubblegumSans(color: Colors.white,fontSize: 20),)),

                                    ),
                                    onTap: (){
                                      checkRes(helper.d);
                                    },
                                  ),
                                ],
                              ),
                            ), //buttns3,4

                          ],
                        ),
                        const SizedBox(height: 60,)
                      ],
                    )

                  ],
                ),


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
                            onPressed: () {
                              replacePlayersInfo();

                              saveHigestScoreToSharedPref(helper.higestScore);
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

    if (helper.score > helper.higestScore) {
      helper.higestScore = helper.score;
      if (helper.score > 5) {
        _title = 'amature';
      }
      if (helper.score > 10) {
        _title = 'pro';
      }
      if (helper.score > 15) {
        _title = 'legend';
      }
    }
    // _saveLastScore(_higestScore);
    setState(() {
      helper.index1 = _random.nextInt(9);
      helper.index2 = _random.nextInt(9);
      if(helper.index2>helper.index1)
      {
        setState(() {
          helper.index1=helper.index2;
          helper.index2=helper.index1-1;
        });
      }
      print(helper.index1.toString()+"=="+helper.index2.toString());


      helper.rand1 = _random.nextInt(9);
      helper.rand2 = _random.nextInt(9);
      helper.rand3 = _random.nextInt(9);

      helper.min = helper.index1 - helper.index2 ;

      // _score =_score +_index1 + _index2 + 2;

      suffle(helper.rand1, helper.rand2, helper.rand3, helper.min);
    });
  }

  void suffle(int rand1, int rand2, int rand3, int sum) {
    if (rand1 == rand2||rand2==rand3) {
      helper.rand2 = helper.rand2 + 1;

    }
    if (rand1 == rand3||rand3==rand2) {
      helper.rand3 = helper.rand3 + 1;
    }
    if (rand1 == rand3||rand1==rand2) {
      helper.rand1 = helper.rand1 + 1;
    }
    if (helper.rand1 == sum || helper.rand2 == sum || helper.rand3 == sum) {
      helper.rand1 = helper.rand1 + 2;
      helper.rand2 = helper.rand2 + 3;
      helper.rand3 = helper.rand3 + 1;
    }

    list = [helper.rand1, helper.rand2, helper.rand3, sum];
    list.shuffle();
    // print(list);

    helper.a = list[0];
    helper.b = list[1];
    helper.c = list[2];
    helper.d = list[3];
    print("${helper.a}" + " " "${helper.b}" + " " + "${helper.c}" + " " "${helper.d}");
  }

  checkRes(int a) {
    // print(a);
    int aa = a;
    if (aa == helper.min) {
      final player = AudioCache();
      // congrats sound
      player.play('play.wav');
      Widget toast= CustomCongoToast.showCongratsMsg();
      fToast.showToast(
        child: toast,
        gravity: ToastGravity.CENTER,
        toastDuration: Duration(milliseconds: 500),
      );
      setState(() {

      });
      helper.score++;
    } else {
      print("ERROR");
      showToast();

    }
  }

  showToast() {
    //buzzer sound
    final player = AudioCache();
    player.play('buzzer.wav');

    Widget toast =Container(
      alignment: Alignment.bottomCenter,
      height: MediaQuery.of(context).size.height/2,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
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
              SizedBox(width: 10,),
              GestureDetector(child: Image.asset("img/no.png",fit: BoxFit.cover,width: 120,),onTap: (){
                saveHigestScoreToSharedPref(helper.higestScore);
                fToast.removeCustomToast();
                Navigator.pop(context);
              },),
              GestureDetector(child: Image.asset("img/yes.png",fit: BoxFit.cover,width: 120,),onTap: (){
                saveHigestScoreToSharedPref(helper.higestScore);
                fToast.removeCustomToast();
                setState(() {
                  helper.score=0;
                });


              },),
              SizedBox(width: 10,)

            ],
          ),
        ),
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
    helper.score = 0;

    // _rollTheDice();
  }




  void saveHigestScoreToSharedPref(int higest) async {
    var now = new DateTime.now();
    var formatter = new DateFormat('MMM-dd / h:mm');
    String formattedDate = formatter.format(now);

    var sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt("min", higest);
    // sharedPreferences.setString("minDt", formattedDate);

  }
  Future<int> fetchHigestScoreFromSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      helper.higestScore = prefs.getInt("min")!;

    });
    return helper.higestScore;
  }


  void replacePlayersInfo() async{


    _playerInfoModel=(await _playersPrvider.findPlayersAllInfo(FirebaseAuthServices.currentUser!.email.toString()))!;
    if(_playerInfoModel!=null)
    {
      savePlayersInfoToFirebase();
      await _playersPrvider.updateProfileScore(_playerInfoModel,"min");
      print("found");
    }
    else
    {
      print("Not found");
    }

  }

  void savePlayersInfoToFirebase() {
    // var now = DateTime.now();
    // var formatter = DateFormat('MMM-dd / h:mm');
    // formattedDate = formatter.format(now);

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
    _playerInfoModel.plus=helper.score;
    _playerInfoModel.min=helper.higestScore;
    _playerInfoModel.mup=helper.score;
    _playerInfoModel.div=helper.score;
    _playerInfoModel.achivement=_achivement;
    _playerInfoModel.time=helper.getCurrentDate();
    print('firebase saving');
  }
}
