import 'package:animated_widgets/widgets/rotation_animated.dart';
import 'package:animated_widgets/widgets/shake_animated_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:random_game_new_version/auth/firebase_auth_services.dart';
import 'package:random_game_new_version/main.dart';
import 'package:random_game_new_version/pages/loginPage.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late bool showTxt;

  @override
  void initState() {
    if(FirebaseAuthServices.currentUser==null)
      {
        showTxt=false;
      }
    else
      {
        showTxt=true;
      }

    super.initState();
  }


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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                Container(
                  margin: EdgeInsets.only(bottom: 0),
                  child: ShakeAnimatedWidget(
                    enabled: true,
                    duration: Duration(milliseconds: 1000),
                    shakeAngle: Rotation.deg(x: 25,),
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
                ),
                if(showTxt)Padding(
                  padding: const EdgeInsets.only(top: 0.0,bottom: 10),
                  child: Center(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: MaterialButton(onPressed: () {
                        Navigator.pushNamed(context, LoginPage.routeName);
                      },
                      child: Text('Sign Up Free',style: TextStyle(color: Colors.pinkAccent,fontSize: 16),),),
                    ),
                  ),
                ),
              ],
            )

          ),
        ),
      ),
    );
  }
}
