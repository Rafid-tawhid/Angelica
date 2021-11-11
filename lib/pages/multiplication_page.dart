import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MultiplicationPage extends StatefulWidget {
  static const String routeName = '/multi_page';
  @override
  _MultiplicationPageState createState() => _MultiplicationPageState();
}

class _MultiplicationPageState extends State<MultiplicationPage> {
  // late Timer _timer;
  int _start = 120;
  int _score = 0;
  int _higestScore = 0;
  var _mup = 0;
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
    'img/nm1.JPG',
    'img/nm2.JPG',
    'img/nm3.JPG',
    'img/nm4.JPG',
    'img/nm5.JPG',
    'img/nm6.JPG',
    'img/nm7.JPG',
    'img/nm8.JPG',
    'img/nm9.JPG',
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
      appBar: AppBar(
        title: Text('Plus'),
        centerTitle: true,

      ),
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding:
                const EdgeInsets.only(left: 12.0, right: 12,top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Higest Score :$_higestScore',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "Hello..!!",

                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 50,
              ),
              Container(
                child: Column(
                  children: [
                    Text(
                      'Score :$_score',
                      style: TextStyle(fontSize: 24),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    if (showMsg == true)
                      Center(
                        child: Image.asset(
                          'img/anim2.gif',
                          height: 150,
                          width: 200,
                        ),
                      )
                    // showCongoMsg()
                    else
                      Center(
                        child: Image.asset(
                          'img/anim3.gif',
                          height: 150,
                          width: 200,
                        ),
                      ),
                  ],
                ),
              ),

              if(hideNumber)Row(
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
                            height: 70,
                            width: 70,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'img/mup.png',
                            height: 60,
                            width: 60,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            _diceList[_index2],
                            height: 70,
                            width: 70,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              // Text('sum :$_sum',style: TextStyle(fontSize: 20),),
              const SizedBox(
                height: 20,
              ),
              if(hideNumber) Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 35.0,
                            child: RaisedButton(
                              onPressed: () {
                                checkRes(a);
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(80.0)),
                              padding: EdgeInsets.all(0.0),
                              child: Ink(
                                decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color(0xff374ABE),
                                        Color(0xff64B6FF)
                                      ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),
                                    borderRadius:
                                    BorderRadius.circular(30.0)),
                                child: Container(
                                  constraints: const BoxConstraints(
                                      maxWidth: 250.0,
                                      minHeight: 50.0),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "$a",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: Container(
                            height: 35.0,
                            child: RaisedButton(
                              onPressed: () {
                                checkRes(b);
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(80.0)),
                              padding: EdgeInsets.all(0.0),
                              child: Ink(
                                decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color(0xff374ABE),
                                        Color(0xff64B6FF)
                                      ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),
                                    borderRadius:
                                    BorderRadius.circular(30.0)),
                                child: Container(
                                  constraints: const BoxConstraints(
                                      maxWidth: 250.0,
                                      minHeight: 50.0),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "$b",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //buttns1,2

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 35.0,
                            child: RaisedButton(
                              onPressed: () {
                                checkRes(c);
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(80.0)),
                              padding: EdgeInsets.all(0.0),
                              child: Ink(
                                decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color(0xff374ABE),
                                        Color(0xff64B6FF)
                                      ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),
                                    borderRadius:
                                    BorderRadius.circular(30.0)),
                                child: Container(
                                  constraints: const BoxConstraints(
                                      maxWidth: 250.0,
                                      minHeight: 50.0),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "$c",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: Container(
                            height: 35.0,
                            child: RaisedButton(
                              onPressed: () {
                                checkRes(d);
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(80.0)),
                              padding: EdgeInsets.all(0.0),
                              child: Ink(
                                decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color(0xff374ABE),
                                        Color(0xff64B6FF)
                                      ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),
                                    borderRadius:
                                    BorderRadius.circular(30.0)),
                                child: Container(
                                  constraints: BoxConstraints(
                                      maxWidth: 250.0,
                                      minHeight: 50.0),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "$d",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //buttns3,4
                  ElevatedButton(
                      onPressed: _rollTheDice, child: Text("Roll")),
                ],
              ),
            ],
          ),
        ],
      ),
    );;
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
      _rand1 = _random.nextInt(81);
      _rand2 = _random.nextInt(50);
      _rand3 = _random.nextInt(81);

      _mup = (_index1+1) * (_index2+1) ;

      // _score =_score +_index1 + _index2 + 2;

      suffle(_rand1, _rand2, _rand3, _mup);
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
    if (aa == _mup) {
      final player = AudioCache();
      // congrats sound
      player.play('play.wav');

      setState(() {
        showMsg = true;
        hideNumber = false;
        Future.delayed(const Duration(milliseconds: 500), () {
          setState(() {
            showMsg = false;
            hideNumber = true;
          });
        });
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
    var sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt("mup", higest);
    print("savedd mup");

  }
  Future<int> fetchHigestScoreFromSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _higestScore = prefs.getInt("mup")!;

    });
    return _higestScore;
  }
}
