 import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class helper {

 static final _random = Random.secure();
  static int score = 0;
  static int higestScore = 0;
  static var min = 0;
  static var index1 = 0;
  static var index2 = 0;
  static var rand1 = 0;
  static var rand2 = 0;
  static var rand3 = 0;
  static  var a = 0;
  static  var b = 0;
  static  var c = 0;
  static var d = 0;

   static final diceList = <String>[
     'img/nm1.png',
     'img/nm2.png',
     'img/nm3.png',
     'img/nm4.png',
     'img/nm5.png',
     'img/nm6.png',
     'img/nm7.png',
     'img/nm8.png',
     'img/nm9.png',
   ];



   static String getCurrentDate(){
     var now = DateTime.now();
     var formatter = DateFormat('MMM-dd / h:mm');
    String formattedDate = formatter.format(now);
    return formattedDate;
   }

   static int getRandomNumber(int length){
     final _random = Random.secure();
     return _random.nextInt(length);
   }


}