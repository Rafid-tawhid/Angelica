import 'package:animated_widgets/widgets/rotation_animated.dart';
import 'package:animated_widgets/widgets/shake_animated_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:random_game_new_version/main.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Center(
      child: SafeArea(
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: ExactAssetImage("img/wc.jpg",),
                  fit: BoxFit.fill,
              ),
            ),
            child: Container(
              margin: EdgeInsets.only(bottom: 25),
              child: ShakeAnimatedWidget(
                enabled: true,
                duration: Duration(milliseconds: 1500),
                shakeAngle: Rotation.deg(x: 15,),
                curve: Curves.decelerate,
                //update this boolean to forward/reverse the animation
                child: Center(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: MaterialButton(

                      textColor: Colors.white,
                      splashColor: Colors.greenAccent,
                      elevation: 8.0,
                      child: Container(
                        height: MediaQuery.of(context).size.height/10,
                        width: MediaQuery.of(context).size.width/2,
                        decoration: BoxDecoration(

                          image: DecorationImage(

                              image: AssetImage('img/ply_btn.png',),
                              fit: BoxFit.cover,filterQuality: FilterQuality.high),
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
            )

          ),
        ),
      ),
    );
  }
}
