import 'dart:async';
import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:random_game_new_version/custom_widget/animation_toast.dart';
import 'package:random_game_new_version/custom_widget/helper%20class.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:art_sweetalert/art_sweetalert.dart';

class ProfessionalMode extends StatefulWidget {

  static const String routeName='/pro';

  @override
  _ProfessionalModeState createState() => _ProfessionalModeState();
}

class _ProfessionalModeState extends State<ProfessionalMode> {
  int _score = 0;
  int _higestScore = 0;
  var _res = 0;
  var _randImgIcon=null;
  var _index1 = 0;
  var _index2 = 0;
  var _rand1 = 0;
  var _rand2 = 0;
  var _rand3 = 0;
  var a = 0;
  var b = 0;
  var c = 0;
  var d = 0;
  static bool showMsg = false;
  bool hideNumber = true;
  String _title = 'Noob';
  var _achivement = 'Beginner';
  var _date;
  late Timer _timer;
  int _start = 10;
  final stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countDown,
    presetMillisecond: StopWatchTimer.getMilliSecFromMinute(1),
    onEnded: (){
     calltimerEnd();
    }
    // millisecond => minute.
  );


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
  late FToast fToast;
  bool callOnce=true;
  CountDownController controller = CountDownController();
  // @override
  // void dispose() {
  //   _timer.cancel();
  //   super.dispose();
  // }
  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
    fetchHigestScoreFromSharedPref();
    stopWatchTimer.onStartTimer();
  }

  @override
  void dispose() async {
    super.dispose();
    await stopWatchTimer.dispose();  // Need to call dispose function.
  }


  @override
  Widget build(BuildContext context) {


    _rollTheDice();
    return Scaffold(

      body: Container(

        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.only(top: 70,left: 10,right: 10),
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
          StreamBuilder<int>(
            stream: stopWatchTimer.rawTime,
            initialData: 0,
            builder: (context, snap) {
              final value = snap.data;
              final displayTime = StopWatchTimer.getDisplayTime(value!,hours: false,milliSecond: false);
             //showStopDialog(displayTime);
              return Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[

                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        color: Colors.pinkAccent,
                        width: 2,
                      ),
                      boxShadow: [
                        BoxShadow(spreadRadius: 2,blurRadius: 2,color: Colors.white,blurStyle: BlurStyle.outer)
                      ],
                      borderRadius: BorderRadius.vertical(top: Radius.circular(15),bottom:Radius.circular(15) )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8,right: 8,top: 4,bottom: 4),
                      child: Text(
                        'Time : $displayTime',
                        style: GoogleFonts.bubblegumSans(
                            fontSize: 16,
                            color: Colors.pinkAccent),
                      ),
                    ),

                  ),

                ],
              );
            },
          ),


              Padding(
                padding: const EdgeInsets.only(top: 30.0),
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
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'Higest Score :$_higestScore',
                                        style: GoogleFonts.bubblegumSans(
                                            fontSize: 20,
                                            color: Colors.pinkAccent),
                                      ),
                                      Align(
                                        alignment: Alignment.topCenter,
                                        child: CircularCountDownTimer(
                                          duration: 5,
                                          initialDuration: 0,
                                          controller: controller,
                                          width: 20,
                                          height: 20,
                                          ringColor: Colors.yellowAccent,
                                          ringGradient: null,
                                          fillColor: Colors.purpleAccent,
                                          fillGradient: null,
                                          backgroundColor: Colors.purple[500],
                                          backgroundGradient: null,
                                          strokeWidth: 4.0,
                                          strokeCap: StrokeCap.round,
                                          textStyle: const TextStyle(
                                              fontSize: 14.0, color: Colors.white, fontWeight: FontWeight.bold),
                                          textFormat: CountdownTextFormat.S,
                                          isReverse: false,
                                          isReverseAnimation: false,
                                          isTimerTextShown: true,
                                          autoStart: false,
                                          onStart: () {
                                            print('Countdown Started');
                                          },
                                          onComplete: () {
                                            _rollTheDice();
                                            controller.start();
                                          },
                                        ),
                                      ),// Return empty container to avoid build error
                                      Container(
                                        alignment: Alignment.center,
                                        width: 80,
                                        child: FittedBox(
                                          child: Text(
                                            Value.getString().toString(),
                                            style: GoogleFonts.bubblegumSans(
                                                fontSize: 20,
                                                color: Colors.pinkAccent),
                                          ),
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
                                      '$_randImgIcon',
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
    //generate random number to call each method at a time
    int _randFun=_random.nextInt(4);
    switch(_randFun)
    {
      case 0:plusFunction();
      break;
      case 1:minFunction();
      break;
      case 2:mupFunction();
      break;
      case 3:divFunction();
      break;
    }



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

    list = [_rand1, _rand2, _rand3, _res ];
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
    if(showMsg){
      controller.pause();
      ArtSweetAlert.show(
          context: context,
          artDialogArgs: ArtDialogArgs(
              title: "Times Up",
              text: "Your score is ${_score}",
          )
      );
      return;
    }
    int aa = a;
    if (aa == _res) {
      controller.start();
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
    controller.pause();

    Widget toast =Container(
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
              SizedBox(width: 10,),
              GestureDetector(child: Image.asset("img/no.png",fit: BoxFit.cover,width: 120,),onTap: (){
                saveHigestScoreToSharedPref(_higestScore);
                fToast.removeCustomToast();
                Navigator.pop(context);
              },),
              GestureDetector(child: Image.asset("img/yes.png",fit: BoxFit.cover,width: 120,),onTap: (){
                saveHigestScoreToSharedPref(_higestScore);
                controller.start();
                fToast.removeCustomToast();
                setState(() {
                  _score=0;
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
    _score = 0;

    // _rollTheDice();
  }




  void saveHigestScoreToSharedPref(int higest) async {
    var now = DateTime.now();
    var formatter = DateFormat('MMM-dd / h:mm');
    String formattedDate = formatter.format(now);

    var sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt("mode2", higest);
    // sharedPreferences.setString("minDt", formattedDate);

  }
  Future<int> fetchHigestScoreFromSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _higestScore = prefs.getInt("mode2")!;

    });
    return _higestScore;
  }

  void plusFunction() {
    setState(() {

      _randImgIcon='img/plus.png';
      _index1 = _random.nextInt(9);
      _index2 = _random.nextInt(9);
      _rand1 = _random.nextInt(24);
      _rand2 = _random.nextInt(24);
      _rand3 = _random.nextInt(24);

      _res = _index1 + _index2 + 2;

      // _score =_score +_index1 + _index2 + 2;

      suffle(_rand1, _rand2, _rand3, _res);
    });
  }

  void minFunction() {
    setState(() {
      _randImgIcon='img/min.png';
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

      _res = _index1 - _index2 ;

      // _score =_score +_index1 + _index2 + 2;

      suffle(_rand1, _rand2, _rand3, _res);
    });
  }

  void mupFunction() {
    setState(() {
      _randImgIcon='img/mup.png';
      _index1 = _random.nextInt(9);
      _index2 = _random.nextInt(9);
      _rand1 = _random.nextInt(81);
      _rand2 = _random.nextInt(50);
      _rand3 = _random.nextInt(81);

      _res = (_index1+1) * (_index2+1) ;

      // _score =_score +_index1 + _index2 + 2;

      suffle(_rand1, _rand2, _rand3, _res);
    });
  }
  void divFunction() {
    setState(() {
      _randImgIcon='img/div.png';
      int aa = (_random.nextInt(8) & -2)+1;
      int bb = (_random.nextInt(8) & -2)+1;

      if(aa<bb)
      {
        bb=aa;
        aa=bb;
      }
      _index1=aa;
      _index2=bb;
      try {
        while(_index1 % _index2 != 0)
        {
          _index2 = _random.nextInt(4);
        }
        print(_index1.toString()+" : "+_index2.toString());
      } on IntegerDivisionByZeroException {
        _res=1;
        print("Cannot divide by Zero");
      }

      _res = ((_index1+1) ~/ (_index2+1));

      print('$_index1+": "+$_index2 " : "$_res');
      _rand1 = _random.nextInt(9);
      _rand2 = _random.nextInt(8);
      _rand3 = _random.nextInt(9);
      suffle(_rand1, _rand2, _rand3, _res);
    });
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  static void calltimerEnd() {
    showMsg=true;
  }

  void showStopDialog(String displayTime) {
    if(displayTime=='00:55'){

      callOnce=false;
    }
  }
}
