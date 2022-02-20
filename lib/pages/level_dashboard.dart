import 'package:flutter/material.dart';
import 'package:random_game_new_version/pages/playerslevelpage.dart';

class LevelDashboard extends StatefulWidget {

  static const String routeName='/levelboard';

  @override
  _LevelDashboardState createState() => _LevelDashboardState();
}

class _LevelDashboardState extends State<LevelDashboard> {

var status=false;
int onBtnColor=0xffff1dcd;
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
            
                    ElevatedButton(

                      style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(), primary: const Color(
                          0xffff1dcd)),
                      child: Container(
                        width: 20,
                        height: 20,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: const Text(
                          '2',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      onPressed:(){false;}

                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(), primary: const Color(
                          0xffff1dcd)),
                      child: Container(
                        width: 20,
                        height: 20,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: const Text(
                          '3',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PlayersLevelPage()));
                      },
                    ),

                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(), primary: Color(
                          0xffff1dcd)),
                      child: Container(
                        width: 20,
                        height: 20,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: const Text(
                          '4',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),

                      onPressed: () {

                      //  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PlayersLevelPage( value: '4',)));
                      },
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(), primary: Color(
                          0xffff1dcd)),
                      child: Container(
                        width: 20,
                        height: 20,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: const Text(
                          '5',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PlayersLevelPage()));
                      },
                    ),
                    ElevatedButton(

                      style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(), primary: Color(
                          onBtnColor)),
                      child: Container(
                        width: 20,
                        height: 20,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: const Text(
                          '6',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          status = !status;
                          onBtnColor=status?0xffff1dcd:0xFF1E88E5;
                        });
                      //  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PlayersLevelPage( value: '6',)));
                      },
                    ),

                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(), primary: Color(
                          0xffff1dcd)),
                      child: Container(
                        width: 20,
                        height: 20,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: const Text(
                          '7',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      onPressed: () {},
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(), primary: Color(
                          0xffff1dcd)),
                      child: Container(
                        width: 20,
                        height: 20,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: const Text(
                          '8',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      onPressed: () {},
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(), primary: Color(
                          0xffff1dcd)),
                      child: Container(
                        width: 20,
                        height: 20,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: const Text(
                          '9',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      onPressed: () {},
                    ),

                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }

}
