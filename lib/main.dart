import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:random_game_new_version/custom_widget/settings_toast.dart';
import 'package:random_game_new_version/pages/all_players_info.dart';
import 'package:random_game_new_version/pages/amature_mode.dart';
import 'package:random_game_new_version/pages/playerslevelpage.dart';
import 'package:random_game_new_version/pages/different_modes.dart';
import 'package:random_game_new_version/pages/divisor_page.dart';
import 'package:random_game_new_version/pages/level_dashboard.dart';
import 'package:random_game_new_version/pages/loginPage.dart';
import 'package:random_game_new_version/pages/multiplication_page.dart';
import 'package:random_game_new_version/pages/plus_page.dart';
import 'package:random_game_new_version/pages/pro_mode.dart';
import 'package:random_game_new_version/pages/score_board.dart';
import 'package:random_game_new_version/pages/signUpPage.dart';
import 'package:random_game_new_version/pages/splash_screen.dart';
import 'package:random_game_new_version/pages/substract_page.dart';
import 'package:random_game_new_version/providers/players_info_provider.dart';
import 'package:random_game_new_version/providers/reg_provider.dart';
import 'custom_widget/helper class.dart';
import 'models/players_info_model.dart';
import 'pages/multiplication_page.dart';
import 'pages/plus_page.dart';
import 'pages/splash_screen.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => RegisterProvider()),
      ChangeNotifierProvider(create: (context) => PlayersPrvider()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      builder: EasyLoading.init(),
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
        Amature.routeName: (context) => Amature(),
        ProfessionalMode.routeName: (context) => ProfessionalMode(),
        Modes.routeName: (context) => Modes(),
        AllPlayers.routeName: (context) => AllPlayers(),
        LevelDashboard.routeName: (context) => LevelDashboard(),
        PlayersLevelPage.routeName: (context) => PlayersLevelPage(value: '',)
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
  late PlayersPrvider playersPrvider;
  PlayerInfoModel? playerInfoModel;
  late FToast fToast;

  // players name
  // late PlayersPrvider _playersPrvider;
  //players score

  void didChangeDependencies() {
    if (FirebaseAuth.instance.currentUser != null) {
      _registerProvider = Provider.of<RegisterProvider>(context,listen: false);
      _registerProvider.getName();

      playersPrvider = Provider.of<PlayersPrvider>(context, listen: false);
      playersPrvider.findPlayersAllInfo().then((value) {
        playerInfoModel=value;
      });
    }
    super.didChangeDependencies();
  }

  @override
  void initState() {
    image1 = Image.asset("img/angle.png",
        fit: BoxFit.cover, filterQuality: FilterQuality.high);

    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      theme: ThemeData(
        primaryColor: Colors.pinkAccent,
      ),
      home: SafeArea(
        child: Scaffold(
          drawer: Drawer(),

          body: GestureDetector(
            onTap: () {
              fToast.removeCustomToast();
              fToast.removeQueuedCustomToasts();
            },
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: ExactAssetImage("img/bg.jpg"),
                    fit: BoxFit.fill,
                    filterQuality: FilterQuality.high),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                        padding: const EdgeInsets.only(top: 30),
                        margin: const EdgeInsets.only(left: 20, right: 20),
                        child: Stack(
                          children: [
                            Image.asset(
                              'img/title.png',
                              filterQuality: FilterQuality.high,
                              fit: BoxFit.contain,
                            ),

                          ],
                        )),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: 20),
                      child: image1,
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(left: 60, right: 60, bottom: 60),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, PlusPage.routeName);
                                    sendNametoAnotherPage();
                                    // sendUserScoretoAnotherPage();
                                  },
                                  child: Center(
                                    child: Image.asset('img/plus.png'),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, SubPage.routeName);
                                    sendNametoAnotherPage();
                                  },
                                  child: Center(
                                    child: Image.asset('img/min.png'),
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
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, MultiplicationPage.routeName);
                                    sendNametoAnotherPage();
                                  },
                                  child: Center(
                                    child: Image.asset('img/mup.png'),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, DivisorPage.routeName);
                                    sendNametoAnotherPage();
                                  },
                                  child: Center(
                                    child: Image.asset('img/div.png'),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 50,
                                  width: 155,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    image: const DecorationImage(

                                        image: AssetImage('img/change.png',),
                                        fit: BoxFit.cover,filterQuality: FilterQuality.high),
                                  ),


                                ),
                              ),
                              onTap: (){
                                fToast = FToast();
                                fToast.init(context);
                                Widget widget = SettingToast(ftoast: fToast,playersInfoModel: playerInfoModel,);
                                fToast.showToast(
                                  child: widget,
                                  gravity: ToastGravity.CENTER,
                                  toastDuration: const Duration(seconds: 5),
                                );
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void sendNametoAnotherPage() {
    _registerProvider = Provider.of<RegisterProvider>(context,listen: false);
    if (_registerProvider.nameList[0].isEmpty) {
      Value.setString('Hello !');
    } else {
      Value.setString(_registerProvider.nameList[0].toString());
    }
  }

}
