import 'package:animated_widgets/widgets/rotation_animated.dart';
import 'package:animated_widgets/widgets/shake_animated_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:random_game_new_version/auth/firebase_auth_services.dart';
import 'package:random_game_new_version/custom_widget/helper%20class.dart';
import 'package:random_game_new_version/main.dart';
import 'package:random_game_new_version/pages/loginPage.dart';
import 'package:random_game_new_version/providers/reg_provider.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late bool showTxt;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email'
    ]
  );
  GoogleSignInAccount? _currentUser;
  @override
  void initState() {

    _googleSignIn.onCurrentUserChanged.listen((account) {
      setState(() {
        _currentUser=account;
      });
    });
    _googleSignIn.signInSilently();

    if(FirebaseAuthServices.currentUser==null)
      {
        showTxt=true;
        // showTxt=false;
      }
    else
      {
        showTxt=true;
      }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    GoogleSignInAccount? user=_currentUser;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      // _registerProvider.nameList[0].toString();
    ]);
    return Center(
      child: SafeArea(
        child: Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: ExactAssetImage("img/wc.jpg",),
                  fit: BoxFit.fill,
              ),
            ),
            child: Stack(
              children: [
                Column(
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
                                decoration: const BoxDecoration(

                                  image: DecorationImage(

                                      image: AssetImage('img/ply_btn.png',),
                                      fit: BoxFit.cover,filterQuality: FilterQuality.high),
                                ),

                              ),
                              // ),
                              onPressed: () {


                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //       builder: (context) => HomePage(),
                                //     ));
                                Navigator.pushNamed(context, HomePage.routeName);
                                // print(_registerProvider.nameList[0].toString());
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
                            child: const Text('Sign Up Free',style: TextStyle(color: Colors.pinkAccent,fontSize: 16),),),
                        ),
                      ),
                    ),

                   // Row(
                   //   children: [
                   //     ElevatedButton(onPressed:_signIn , child: Text("Sign In")),
                   //     ElevatedButton(onPressed: _signOut , child: Text("Sign Out")),
                   //   ],
                   // ),


                   if(user!=null) ListTile(
                     leading: GoogleUserCircleAvatar(identity: user,),
                     title: Text(user.displayName!!),
                     subtitle: Text(user.email),
                   )


                  ],
                ),
              ],
            )

          ),
        ),
      ),
    );
  }

  Future<void> _signIn() async {
    try{
      await _googleSignIn.signIn();
    }catch(e){
      print('Error sign in $e');
    }
  }
  void _signOut() {
    _googleSignIn.disconnect();
  }
}
