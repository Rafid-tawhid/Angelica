import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:random_game_new_version/pages/divisor_page.dart';
import 'package:random_game_new_version/pages/loginPage.dart';
import 'package:random_game_new_version/pages/multiplication_page.dart';
import 'package:random_game_new_version/pages/plus_page.dart';
import 'package:random_game_new_version/pages/score_board.dart';
import 'package:random_game_new_version/pages/signUpPage.dart';
import 'package:random_game_new_version/pages/splash_screen.dart';
import 'package:random_game_new_version/pages/substract_page.dart';
import 'package:random_game_new_version/providers/players_info_provider.dart';
import 'package:random_game_new_version/providers/reg_provider.dart';
import 'custom_widget/helper class.dart';
import 'pages/multiplication_page.dart';
import 'pages/plus_page.dart';
import 'pages/splash_screen.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create:(context)=> RegisterProvider()),
      ChangeNotifierProvider(create:(context)=> PlayersPrvider()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        HomePage.routeName: (context) => HomePage(),
        PlusPage.routeName: (context) => PlusPage(),
        MultiplicationPage.routeName: (context) => MultiplicationPage(),
        DivisorPage.routeName: (context) => DivisorPage(),
        ScoreBoard.routeName: (context) => ScoreBoard(),
        SubPage.routeName: (context) => SubPage(),
        LoginPage.routeName: (context) => LoginPage(),
        SignUpPage.routeName: (context) => SignUpPage(),
      },
    ),
  ));
}
class HomePage extends StatefulWidget {

  static const String routeName = '/home_page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Image? image1;
  // String? userName;
  late RegisterProvider _registerProvider;
  //


  void didChangeDependencies() {
    if(FirebaseAuth.instance.currentUser!=null)
      {
        _registerProvider=Provider.of<RegisterProvider>(context);
        _registerProvider.getName();
      }
    super.didChangeDependencies();
  }


  @override
  void initState() {
    image1 = Image.asset("img/angle.png",fit: BoxFit.cover,filterQuality: FilterQuality.high);

    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.pinkAccent,
      ),
      home: SafeArea(
        child: Scaffold(
          drawer: Drawer(

          ),
            // appBar: AppBar(
            //   title: Text("Honey Bunny",style: GoogleFonts.bubblegumSans(
            //     fontWeight: FontWeight.w900,
            //     fontStyle: FontStyle.normal,
            //     fontSize: 26,
            //     letterSpacing: 1
            //   ),),
            //   centerTitle: true,
            //   backgroundColor: Color(0xffF61ABC),
            //
            // ),
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage("img/bg.jpg"),
                fit: BoxFit.fill,
                filterQuality: FilterQuality.high

              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(

                  child: Container(
                    padding: EdgeInsets.only(top: 30),
                    margin: EdgeInsets.only(left: 20,right: 20),
                    child: Image.asset('img/title.png',filterQuality: FilterQuality.high,fit: BoxFit.contain,),
                  ),
                ),

                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(5),

                    child: image1,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 60,right: 60,bottom: 60),
                  child: Column(
                    children: [
                      Row(

                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: (){

                                  Navigator.pushNamed(context, PlusPage.routeName);
                                  sendNametoAnotherPage();

                                },
                                child: Container(
                                   
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

                                  Navigator.pushNamed(context, SubPage.routeName);
                                  sendNametoAnotherPage();
                                },
                                child: Container(

                                    child: Center(
                                      child: Image.asset('img/min.png'),
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
                                  sendNametoAnotherPage();

                                },
                                child: Container(
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
                                  sendNametoAnotherPage();



                                },
                                child: Container(
                                    child: Center(
                                      child: Image.asset('img/div.png'),
                                    )
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ],
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }

  void sendNametoAnotherPage() {
    if(_registerProvider.nameList[0].length==0)
      {
        Value.setString('Hello !');
      }
    else
      {
        Value.setString(_registerProvider.nameList[0].toString());
      }

  }
}

