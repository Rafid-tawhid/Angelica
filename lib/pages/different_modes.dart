import 'package:flutter/material.dart';

class Modes extends StatefulWidget {
  static const String routeName='/modes';

  @override
  _ModesState createState() => _ModesState();
}

class _ModesState extends State<Modes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Container(
       decoration: const BoxDecoration(
         image: DecorationImage(
             image: ExactAssetImage('img/game_bg2.png',),
             fit: BoxFit.fill,
             filterQuality: FilterQuality.high
         ),
       ),
       child: Stack(
         children: [
           Align(
             alignment: Alignment.center,
             child:  Image.asset('img/number_bg.png',fit: BoxFit.cover,filterQuality: FilterQuality.high),
           ),
         ],
       ),

     ),
    );
  }
}
