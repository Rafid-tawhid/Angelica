import 'package:flutter/material.dart';
import 'package:random_game_new_version/pages/minus_page.dart';
import 'package:random_game_new_version/pages/multiplication_page.dart';
import 'package:random_game_new_version/pages/plus_page.dart';
import 'package:random_game_new_version/pages/splash_screen.dart';

import 'custom_widget/custom_drawer.dart';

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
    return Scaffold(
      drawer: Drawer(
        child: CustomDrawer(),
      ),
        appBar: AppBar(
          title: Text("HomePage"),
        ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
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
                          decoration: BoxDecoration(
                              color: Colors.deepOrange,
                              border: Border.all(
                                color: Colors.red,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                          child: Center(
                            child: Text("+",style: TextStyle(fontSize: 100,color: Colors.white),),
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
                          decoration: BoxDecoration(
                              color: Colors.deepOrange,
                              border: Border.all(
                                color: Colors.red,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                          child: Center(
                            child: Text("-",style: TextStyle(fontSize: 100,color: Colors.white),),
                          )
                      ),
                    ),
                  ),
                ),

              ],
            ),
            Row(
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
                          decoration: BoxDecoration(
                              color: Colors.deepOrange,
                              border: Border.all(
                                color: Colors.red,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                          child: Center(
                            child: Text("*",style: TextStyle(fontSize: 100,color: Colors.white),),
                          )
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        height: 200,
                        width: 150,
                        decoration: BoxDecoration(
                            color: Colors.deepOrange,
                            border: Border.all(
                              color: Colors.red,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                        child: Center(
                          child: Text("/",style: TextStyle(fontSize: 100,color: Colors.white),),
                        )
                    ),
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}

