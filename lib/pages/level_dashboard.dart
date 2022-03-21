

import 'package:flutter/material.dart';
import 'package:random_game_new_version/pages/playerslevelpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LevelDashboard extends StatefulWidget {

  static const String routeName='/levelboard';

  @override
  _LevelDashboardState createState() => _LevelDashboardState();
}

class _LevelDashboardState extends State<LevelDashboard> {

var status1=false;
var status2=false;
var status3=false;
var status4=false;
var status5=false;
var status6=false;

int onBtnColor=0xffff1dcd;
 String levelCount='';


@override
  void initState() {

  fetchHigestScoreFromSharedPref();
  Future.delayed(Duration(microseconds: 2000),(){
    findWhichLevelAreOpen();
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
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('img/bg.jpg'),
                fit: BoxFit.fill
              )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RaisedButton(
                      disabledColor: Colors.black,
                      disabledTextColor: Colors.white,
                      onPressed: status1
                          ? null
                          : () {
                        print("Clicked");
                      },
                      child: Text("1"),
                    ),
                    RaisedButton(
                      disabledColor: Colors.black,
                      disabledTextColor: Colors.white,
                      onPressed: status2
                          ? null
                          : () {
                        print("Clicked");
                      },
                      child: Text("2"),
                    ),
                    RaisedButton(
                      disabledColor: Colors.black,
                      disabledTextColor: Colors.white,
                      onPressed: status3
                          ? null
                          : () {
                        print("Clicked");
                      },
                      child: Text("3"),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RaisedButton(
                      disabledColor: Colors.black,
                      disabledTextColor: Colors.white,
                      onPressed: status4
                          ? null
                          : () {
                        print("Clicked");
                      },
                      child: Text("4"),
                    ),
                    RaisedButton(
                      disabledColor: Colors.black,
                      disabledTextColor: Colors.white,
                      onPressed: status5
                          ? null
                          : () {
                        print("Clicked");
                      },
                      child: Text("5"),
                    ),
                    RaisedButton(

                      disabledColor: Colors.black,
                      disabledTextColor: Colors.white,
                      onPressed: status6
                          ? null
                          : () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PlayersLevelPage()));
                      },
                      child: Text("6"),
                    ),

                  ],
                ),
                    // ElevatedButton(
                    //
                    //   style: ElevatedButton.styleFrom(
                    //       shape: const CircleBorder(), primary: Color(
                    //       onBtnColor)),
                    //   child: Container(
                    //     width: 20,
                    //     height: 20,
                    //     alignment: Alignment.center,
                    //     decoration: const BoxDecoration(shape: BoxShape.circle),
                    //     child: const Text(
                    //       '6',
                    //       style: TextStyle(fontSize: 20),
                    //     ),
                    //   ),
                    //
                    //   onPressed: () {
                    //     setState(() {
                    //       status = !status;
                    //       onBtnColor=status?0xffff1dcd:0xFF1E88E5;
                    //     });
                    //   //  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PlayersLevelPage( value: '6',)));
                    //   },
                    // ),

                  ],

            ),
          ),
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
  print("Now"+levelCount);
  if(levelCount=='2'){
    setState(() {
      status1=true;
      status2=true;
    });
  }
  else if(levelCount=='3'){
    setState(() {
      status1=true;
      status2=true;
      status3=true;
    });
  }
  else if(levelCount=='4'){
    setState(() {
      status1=true;
      status2=true;
      status3=true;
      status4=true;
    });
  }
  else if(levelCount=='5'){
    setState(() {
      status1=true;
      status2=true;
      status3=true;
      status4=true;
      status5=true;
    });
  }
  else if(levelCount=='6'){
    setState(() {
      status1=true;
      status2=true;
      status3=true;
      status4=true;
      status5=true;
      status6=true;
    });
  }
  }

}
