import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:random_game_new_version/custom_widget/helper%20class.dart';
import 'package:random_game_new_version/main.dart';
import 'package:random_game_new_version/pages/amature_mode.dart';
import 'package:random_game_new_version/pages/level_dashboard.dart';
import 'package:random_game_new_version/pages/pro_mode.dart';

import '../models/players_info_model.dart';
import '../pages/loginPage.dart';

class SettingToast extends StatefulWidget {

  final FToast ftoast;
  final PlayerInfoModel? playersInfoModel;
   SettingToast({required this.ftoast, this.playersInfoModel});

  @override
  _SettingToastState createState() => _SettingToastState();
}

class _SettingToastState extends State<SettingToast> {
  @override



  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(25.0),

      ),
      child: Container(

        height: MediaQuery.of(context).size.height/2,
        width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('img/number_bg.png'),
                fit: BoxFit.cover),
          ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Padding(
               padding: const EdgeInsets.only(left: 10.0,right: 10),
               child: GestureDetector(child: Image.asset('img/profile2.png',height: 80,width: 80,),
               onTap: (){
                 widget.ftoast.removeCustomToast();
                 widget.ftoast.removeQueuedCustomToasts();
                 HelperClass.isLoggedIn()?
                 Navigator.pushNamed(context, LevelDashboard.routeName,arguments: widget.playersInfoModel):
                 Navigator.pushNamed(context, LoginPage.routeName);
               },),
             ),
             SizedBox(height: 20,),
             Padding(
               padding: const EdgeInsets.only(left: 10.0,right: 10),
               child: GestureDetector(child: Image.asset('img/medium.png'),onTap: (){

                 widget.ftoast.removeCustomToast();
                 widget.ftoast.removeQueuedCustomToasts();
                 Navigator.pushNamed(context, Amature.routeName);

               },),
             ),
             Padding(
               padding: const EdgeInsets.only(left: 10.0,right: 10),
               child: GestureDetector(child: Image.asset('img/advance.png'),onTap: (){

                 widget.ftoast.removeCustomToast();
                 widget.ftoast.removeQueuedCustomToasts();
                 Navigator.pushNamed(context, ProfessionalMode.routeName);
               },),
             ),
          ],
        ),
      ),
    );
  }
}
