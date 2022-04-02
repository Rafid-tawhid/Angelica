

import 'package:flutter/material.dart';
import 'package:random_game_new_version/pages/playerslevelpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LevelDashboard extends StatefulWidget {

  static const String routeName='/levelboard';

  @override
  _LevelDashboardState createState() => _LevelDashboardState();
}

class _LevelDashboardState extends State<LevelDashboard> {

var status1=true;
var status2=true;
var status3=true;
var status4=true;
var status5=true;
var status6=true;

int onBtnColor=0xffff1dcd;
 String levelCount='';


@override
  void initState() {

  fetchHigestScoreFromSharedPref();
  Future.delayed(Duration(microseconds: 2000),(){
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
                      onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PlayersLevelPage( value: '1',)));
                      },
                      child: Text("1"),
                    ),
                    RaisedButton(
                      disabledColor: Colors.black,
                      disabledTextColor: Colors.white,
                      onPressed: status2
                          ? null
                          : () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PlayersLevelPage( value: '2',)));
                      },
                      child: Text("2"),
                    ),
                    RaisedButton(
                      disabledColor: Colors.black,
                      disabledTextColor: Colors.white,
                      onPressed: status3
                          ? null
                          : () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PlayersLevelPage( value: '3',)));
                        print("Clicked 33");
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
                        print("Clicked 5");
                      },
                      child: Text("5"),
                    ),
                    RaisedButton(

                      disabledColor: Colors.black,
                      disabledTextColor: Colors.white,
                      onPressed: status6
                          ? null
                          : () {

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
      status1=false;
      status2=false;
    });
  }
  else if(levelCount=='3'){
    setState(() {
      status1=false;
      status2=false;
      status3=false;
    });
  }
  else if(levelCount=='4'){
    setState(() {
      status1=false;
      status2=false;
      status3=false;
      status4=false;
    });
  }
  else if(levelCount=='5'){
    setState(() {
      status1=false;
      status2=false;
      status3=false;
      status4=false;
      status5=false;
    });
  }
  else if(levelCount=='6'){
    setState(() {
      status1=false;
      status2=false;
      status3=false;
      status4=false;
      status5=false;
      status6=false;
    });
  }
  }

}
