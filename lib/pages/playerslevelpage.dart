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

class PlayersLevelPage extends StatefulWidget {

  static const String routeName='/demo';

  String value;
  PlayersLevelPage({required this.value});


  @override
  _PlayersLevelPageState createState() => _PlayersLevelPageState();
}

class _PlayersLevelPageState extends State<PlayersLevelPage> {

  var _index1 = 0;
  var _index2 = 0;
  var _rand1 = 0;
  var _rand2 = 0;
  var _rand3 = 0;
  int a=0,b=0,c=0,d=0;
  var signChange='img/plus.png';
  var _result = 0;
  bool callOnce=true;
  bool decideModesFunction=false;
  late FToast fToast;
  late PlayersPrvider playersPrvider;
  int? numberofPlayersCoin;
  int _score=0;
  int level=0;
  @override
  void initState() {
    fToast = FToast();
    fToast.init(context);
    if(widget.value=='1'){
      primaryLevel();
    }
    if(widget.value=='2'){
      mediumlevel();
    }
    super.initState();
  }


  @override
  void didChangeDependencies() {

    playersPrvider=Provider.of<PlayersPrvider>(context,listen: true);
    // if(callOnce) {
    //   callOnce = false;
    //   playersPrvider.getCC().then((value) {
    //     numberofPlayersCoin = value;
    //     checkWhichLevelisCurrentUser(numberofPlayersCoin);
    //   });
    // }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // _rollTheDice();
    return Scaffold(

      body: Container(

        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.only(top: 100, left: 10, right: 10),
        decoration:
        const BoxDecoration(
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
                  // Image.asset('img/number_bg.png',fit: BoxFit.cover,filterQuality: FilterQuality.high),
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset('img/number_bg.png', fit: BoxFit.cover,
                        filterQuality: FilterQuality.high),
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Column(
                          children: [
                            Container(
                              child: Padding(
                                padding:
                                const EdgeInsets.only(
                                    left: 27.0, right: 27, top: 40),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    Text(
                                      widget.value,
                                      style: GoogleFonts.bubblegumSans(
                                          fontSize: 20, color: Colors.pinkAccent
                                      ),
                                    ),
                                    Text(
                                      Value.getString().toString(),

                                      style: GoogleFonts.bubblegumSans(
                                          fontSize: 20, color: Colors.pinkAccent
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
                                    fit: BoxFit.cover,
                                    filterQuality: FilterQuality.high),
                              ),
                              child: Center(child: Text(
                                'Score : $_score',
                                style: GoogleFonts.bubblegumSans(
                                    color: Colors.white, fontSize: 20),)),

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
                                    helper.diceList[_index1],
                                    height: 80,
                                    width: 80,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    '$signChange',
                                    height: 80,
                                    width: 80,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    helper.diceList[_index2],
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

                                          image: AssetImage(
                                            'img/score_btn.png',),
                                          fit: BoxFit.cover,
                                          filterQuality: FilterQuality.high),
                                    ),
                                    child: Center(child: Text('$a',
                                      style: GoogleFonts.bubblegumSans(
                                          color: Colors.white, fontSize: 20),)),

                                  ),
                                  onTap: () {
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

                                          image: AssetImage(
                                            'img/score_btn.png',),
                                          fit: BoxFit.cover,
                                          filterQuality: FilterQuality.high),
                                    ),
                                    child: Center(child: Text('$b',
                                      style: GoogleFonts.bubblegumSans(
                                          color: Colors.white, fontSize: 20),)),

                                  ),
                                  onTap: () {
                                    checkRes(b);
                                  },
                                ),
                              ],
                            ),

                          ), //buttns1,2
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0, right: 8),
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

                                          image: AssetImage(
                                            'img/score_btn.png',),
                                          fit: BoxFit.cover,
                                          filterQuality: FilterQuality.high),
                                    ),
                                    child: Center(child: Text('$c',
                                      style: GoogleFonts.bubblegumSans(
                                          color: Colors.white, fontSize: 20),)),

                                  ),
                                  onTap: () {
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

                                          image: AssetImage(
                                            'img/score_btn.png',),
                                          fit: BoxFit.cover,
                                          filterQuality: FilterQuality.high),
                                    ),
                                    child: Center(child: Text('$d',
                                      style: GoogleFonts.bubblegumSans(
                                          color: Colors.white, fontSize: 20),)),

                                  ),
                                  onTap: () {
                                    checkRes(d);
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
                                    fit: BoxFit.cover,
                                    filterQuality: FilterQuality.high),
                              ),

                            ),
                            // ),
                            onPressed: () {
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
                                    fit: BoxFit.cover,
                                    filterQuality: FilterQuality.high),
                              ),

                            ),
                            // ),
                            onPressed: () {
                            checkAndCalllevelFunction();
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

    if(decideModesFunction==false){
      decideModesFunction=true;
      plusFunction();
    }
    else if(decideModesFunction==true){
      decideModesFunction=false;
      minusFunction();
    }


  }

  primaryLevel() {
   _rollTheDice();
  }

  void plusFunction() {
    setState(() {

      _index1 = helper.getRandomNumber(9);
      _index2 = helper.getRandomNumber(9);
      _rand1 = helper.getRandomNumber(24);
      _rand2 = helper.getRandomNumber(24);
      _rand3 = helper.getRandomNumber(24);
      decideModesFunction=true;
      signChange='img/plus.png';
      level=1;
      _result = _index1 + _index2 + 2;
      suffle(_rand1, _rand2, _rand3, _result);

    });
  }

  void minusFunction() {
    setState(() {
      _index1 = helper.getRandomNumber(9);
      _index2 = helper.getRandomNumber(9);
      level=1;
      if(_index2>_index1)
      {
        setState(() {
          _index1=_index2;
          _index2=_index1-1;
        });
      }
      _rand1 = helper.getRandomNumber(24);
      _rand2 = helper.getRandomNumber(24);
      _rand3 = helper.getRandomNumber(24);
      decideModesFunction=false;
      signChange='img/min.png';
      _result = _index1 - _index2;
      suffle(_rand1, _rand2, _rand3, _result);
    });
  }

  void mupFunction(){
    setState(() {
      _index1 = helper.getRandomNumber(9);
      _index2 = helper.getRandomNumber(9);
      _rand1 = helper.getRandomNumber(81);
      _rand2 = helper.getRandomNumber(50);
      _rand3 = helper.getRandomNumber(81);
      level=2;
      _result = (_index1+1) * (_index2+1) ;
      signChange='img/mup.png';
      // _score =_score +_index1 + _index2 + 2;

      suffle(_rand1, _rand2, _rand3, _result);
    });
  }

  void divFunction(){
    setState(() {
      int aa = (helper.getRandomNumber(8) & -2)+1;
      int bb = (helper.getRandomNumber(8) & -2)+1;
      level=2;
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
          _index2 = helper.getRandomNumber(4);
        }
        print(_index1.toString()+" : "+_index2.toString());
      } on IntegerDivisionByZeroException {
        _result=1;
        print("Cannot divide by Zero");
      }


      signChange='img/div.png';
      _result = ((_index1+1) ~/ (_index2+1));

      print('$_index1+": "+$_index2 " : "$_result');
      _rand1 = helper.getRandomNumber(9);
      _rand2 = helper.getRandomNumber(8);
      _rand3 = helper.getRandomNumber(9);

      suffle(_rand1, _rand2, _rand3, _result);
    });
  }



  void checkWhichLevelisCurrentUser(int? a) {
    if(a!>=100&&a<=200){
      primaryLevel();
    }
    else if (a!>200&&a<300)
      {
        mediumlevel();
      }
    if(a<100){
      const snackBar = SnackBar(
        content: Text('Yo dont have enough Coin '),
        duration: Duration(microseconds: 100000),
        backgroundColor: Colors.pink,
        padding: EdgeInsets.all(15),

      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
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
    List<int> list = [];
    list = [_rand1, _rand2, _rand3, sum];
    list.shuffle();

    a= list[0];
    b = list[1];
    c = list[2];
    d = list[3];
    print("$a" + " " "$b" + " " + "$c" + " " "$d");
  }

  checkRes(int a) {
    // print(a);
    int aa = a;
    if (aa == _result) {
      final player = AudioCache();
      // congrats sound
      player.play('play.wav');
      Widget toast= CustomCongoToast.showCongratsMsg();
      fToast.showToast(
        child: toast,
        gravity: ToastGravity.CENTER,
        toastDuration: const Duration(milliseconds: 1000),
      );

      //next call
      if(widget.value=='1'){
        primaryLevel();
      }
      if(widget.value=='2'){
        mediumlevel();
      }


       _score=_score+1;

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
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("img/wrng.png",),
          fit: BoxFit.fill,
        ),
      ),
      child: SizedBox(
        height: 80,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 28.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(width: 10,),
              GestureDetector(child: Image.asset("img/no.png",fit: BoxFit.cover,width: 120,),onTap: (){
                // saveHigestScoreToSharedPref(_higestScore);
                fToast.removeCustomToast();
                Navigator.pop(context);
              },),
              GestureDetector(child: Image.asset("img/yes.png",fit: BoxFit.cover,width: 120,),onTap: (){
                // saveHigestScoreToSharedPref(_higestScore);
                fToast.removeCustomToast();
                setState(() {
                  // _score=0;
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
      toastDuration: const Duration(seconds: 20),
    );

    // Custom Toast Position
  }

  void mediumlevel() {
    if(decideModesFunction==false){
      decideModesFunction=true;
      divFunction();
    }
    else if(decideModesFunction==true){
      decideModesFunction=false;
      mupFunction();
    }
  }

  void checkAndCalllevelFunction() {
    if(numberofPlayersCoin!>=100&&numberofPlayersCoin!<=200)
    {
      primaryLevel();
    }
    if(numberofPlayersCoin!>=200&&numberofPlayersCoin!<=300)
    {
      mediumlevel();
    }
  }


}



















