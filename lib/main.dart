import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:random_game_new_version/pages/divisor_page.dart';
import 'package:random_game_new_version/pages/minus_page.dart';
import 'package:random_game_new_version/pages/multiplication_page.dart';
import 'package:random_game_new_version/pages/plus_page.dart';
import 'package:random_game_new_version/pages/score_board.dart';
import 'package:random_game_new_version/pages/splash_screen.dart';

import 'custom_widget/custom_drawer.dart';
import 'pages/minus_page.dart';
import 'pages/multiplication_page.dart';
import 'pages/plus_page.dart';
import 'pages/splash_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: SplashScreen.routeName,
    routes: {
      SplashScreen.routeName: (context) => SplashScreen(),
      HomePage.routeName: (context) => HomePage(),
      PlusPage.routeName: (context) => PlusPage(),
      MinusPage.routeName: (context) => MinusPage(),
      MultiplicationPage.routeName: (context) => MultiplicationPage(),
      DivisorPage.routeName: (context) => DivisorPage(),
      ScoreBoard.routeName: (context) => ScoreBoard(),
    },
  ));
}
class HomePage extends StatefulWidget {

  static const String routeName = '/home_page';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.pinkAccent,
      ),
      home: Scaffold(
        drawer: Drawer(
          child: CustomDrawer(),
        ),
          appBar: AppBar(
            title: Text("Honey Bunny",style: GoogleFonts.bubblegumSans(
              fontWeight: FontWeight.w900,
              fontStyle: FontStyle.normal,
              fontSize: 26,
              letterSpacing: 1
            ),),
            centerTitle: true,
            backgroundColor: Color(0xffF61ABC),

          ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage("img/bg.jpg",),
              fit: BoxFit.fill,

            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.only(top: 10),
                  margin: EdgeInsets.only(left: 20,right: 20),
                  child: Image.asset('img/title.png'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.all(5),

                    child: Image.asset('img/angle.png',filterQuality: FilterQuality.high,),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(

                  padding: EdgeInsets.only(left: 50,right: 50),
                  child: Row(

                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: (){
                              Navigator.pushNamed(context, PlusPage.routeName);

                            },
                            child: Container(
                                height: 200,
                                width: 150,
                                child: Center(
                                  child: Image.asset('img/plus.png'),
                                )
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: (){
                              Navigator.pushNamed(context, MinusPage.routeName);
                            },
                            child: Container(
                                height: 200,
                                width: 150,
                                child: Center(
                                  child: Image.asset('img/min.png'),
                                )
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.only(left: 50,right: 50),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: (){
                              Navigator.pushNamed(context, MultiplicationPage.routeName);
                            },
                            child: Container(
                                height: 200,
                                width: 150,
                                child: Center(
                                  child: Image.asset('img/mup.png'),
                                )
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: (){
                              Navigator.pushNamed(context, DivisorPage.routeName);
                            },
                            child: Container(
                                height: 200,
                                width: 150,
                                child: Center(
                                  child: Image.asset('img/div.png'),
                                )
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Container(

                  ))
            ],
          ),
        ),
      ),
    );
  }
}

