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
    return Scaffold(
      body: Center(
        child:  Padding(
          padding: const EdgeInsets.all(18.0),
          child: FlatButton(
            color: Colors.red,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0)),
            child: Padding(
              padding: const EdgeInsets.only(left: 28.0, right: 28),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: new Text(
                  ' Play ',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            onPressed: () {

              Navigator.pushNamed(context, HomePage.routeName);
            },
          ),
        ),
      ),
    );
  }
}
