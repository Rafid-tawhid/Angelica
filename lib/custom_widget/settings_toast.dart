import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingToast extends StatefulWidget {

  @override
  _SettingToastState createState() => _SettingToastState();
}

class _SettingToastState extends State<SettingToast> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(25.0),

      ),
      child: Container(
        height: MediaQuery.of(context).size.height/2,
        width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
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
               child: Image.asset('img/medium.png'),
             ),
             Padding(
               padding: const EdgeInsets.only(left: 10.0,right: 10),
               child: Image.asset('img/advance.png'),
             ),
          ],
        ),
      ),
    );
  }
}
