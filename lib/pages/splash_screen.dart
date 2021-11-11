import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:random_game_new_version/main.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: ExactAssetImage("img/wc.jpg",),
                fit: BoxFit.fill,
            ),
          ),
          child: Center(

            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: MaterialButton(
                  padding: const EdgeInsets.all(8.0),
                  textColor: Colors.white,
                  splashColor: Colors.greenAccent,
                  elevation: 8.0,
                  child: Container(
                    height: 60,
                    width: 160,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('img/ply_btn.png'),
                          fit: BoxFit.cover),
                    ),

                  ),
                  // ),
                  onPressed: () {
                    Navigator.pushNamed(context, HomePage.routeName);
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
