import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:random_game_new_version/main.dart';
import 'package:random_game_new_version/pages/amature_mode.dart';
import 'package:random_game_new_version/pages/pro_mode.dart';

class SettingToast extends StatefulWidget {

  final FToast ftoast;
  SettingToast(this.ftoast);

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
               child: Image.asset('img/normall.png'),
             ),
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
