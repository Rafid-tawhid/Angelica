import 'package:flutter/cupertino.dart';

class Extra extends StatefulWidget {
  const Extra({Key? key}) : super(key: key);

  @override
  _ExtraState createState() => _ExtraState();
}

class _ExtraState extends State<Extra> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // child: Column(
      //   children: [
      //     Padding(
      //       padding:
      //       const EdgeInsets.only(left: 12.0, right: 12,top: 10),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Text(
      //             'Higest Score :$_higestScore',
      //             style: TextStyle(
      //               fontSize: 18,
      //             ),
      //           ),
      //           Text(
      //             "Hello..!!",
      //
      //             style: TextStyle(
      //               fontSize: 18,
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //
      //     SizedBox(
      //       height: 50,
      //     ),
      //     Text(
      //       'Score :$_score',
      //       style: TextStyle(fontSize: 24),
      //     ),
      //     SizedBox(
      //       height: 50,
      //     ),
      //     // Column(
      //     //      children: [
      //     //        if (showMsg == true)
      //     //          Center(
      //     //            child: Image.asset(
      //     //              'img/anim2.gif',
      //     //              height: 150,
      //     //              width: 200,
      //     //            ),
      //     //          )
      //     //        // showCongoMsg()
      //     //        else
      //     //          Center(
      //     //            child: Image.asset(
      //     //              'img/anim3.gif',
      //     //              height: 150,
      //     //              width: 200,
      //     //            ),
      //     //          ),
      //     //      ],
      //     //    ),
      //
      //
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       children: [
      //         Container(
      //           margin: EdgeInsets.all(15),
      //           child: Row(
      //             children: [
      //               Padding(
      //                 padding: const EdgeInsets.all(8.0),
      //                 child: Image.asset(
      //                   _diceList[_index1],
      //                   height: 70,
      //                   width: 70,
      //                 ),
      //               ),
      //               Padding(
      //                 padding: const EdgeInsets.all(8.0),
      //                 child: Image.asset(
      //                   'img/plus.png',
      //                   height: 60,
      //                   width: 60,
      //                 ),
      //               ),
      //               Padding(
      //                 padding: const EdgeInsets.all(8.0),
      //                 child: Image.asset(
      //                   _diceList[_index2],
      //                   height: 70,
      //                   width: 70,
      //                 ),
      //               ),
      //             ],
      //           ),
      //         )
      //       ],
      //     ),
      //     // Text('sum :$_sum',style: TextStyle(fontSize: 20),),
      //     const SizedBox(
      //       height: 20,
      //     ),
      //     Column(
      //       children: [
      //         Padding(
      //           padding: const EdgeInsets.all(8.0),
      //           child: Row(
      //             children: [
      //               Expanded(
      //                 child: Container(
      //                   height: 35.0,
      //                   child: RaisedButton(
      //                     onPressed: () {
      //                       checkRes(a);
      //                     },
      //                     shape: RoundedRectangleBorder(
      //                         borderRadius:
      //                         BorderRadius.circular(80.0)),
      //                     padding: EdgeInsets.all(0.0),
      //                     child: Ink(
      //                       decoration: BoxDecoration(
      //                           gradient: const LinearGradient(
      //                             colors: [
      //                               Color(0xff374ABE),
      //                               Color(0xff64B6FF)
      //                             ],
      //                             begin: Alignment.centerLeft,
      //                             end: Alignment.centerRight,
      //                           ),
      //                           borderRadius:
      //                           BorderRadius.circular(30.0)),
      //                       child: Container(
      //                         constraints: const BoxConstraints(
      //                             maxWidth: 250.0,
      //                             minHeight: 50.0),
      //                         alignment: Alignment.center,
      //                         child: Text(
      //                           "$a",
      //                           textAlign: TextAlign.center,
      //                           style: TextStyle(
      //                               color: Colors.white,
      //                               fontSize: 15),
      //                         ),
      //                       ),
      //                     ),
      //                   ),
      //                 ),
      //               ),
      //               const SizedBox(
      //                 width: 8,
      //               ),
      //               Expanded(
      //                 child: Container(
      //                   height: 35.0,
      //                   child: RaisedButton(
      //                     onPressed: () {
      //                       checkRes(b);
      //                     },
      //                     shape: RoundedRectangleBorder(
      //                         borderRadius:
      //                         BorderRadius.circular(80.0)),
      //                     padding: EdgeInsets.all(0.0),
      //                     child: Ink(
      //                       decoration: BoxDecoration(
      //                           gradient: const LinearGradient(
      //                             colors: [
      //                               Color(0xff374ABE),
      //                               Color(0xff64B6FF)
      //                             ],
      //                             begin: Alignment.centerLeft,
      //                             end: Alignment.centerRight,
      //                           ),
      //                           borderRadius:
      //                           BorderRadius.circular(30.0)),
      //                       child: Container(
      //                         constraints: const BoxConstraints(
      //                             maxWidth: 250.0,
      //                             minHeight: 50.0),
      //                         alignment: Alignment.center,
      //                         child: Text(
      //                           "$b",
      //                           textAlign: TextAlign.center,
      //                           style: TextStyle(
      //                               color: Colors.white,
      //                               fontSize: 15),
      //                         ),
      //                       ),
      //                     ),
      //                   ),
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //         //buttns1,2
      //
      //         Padding(
      //           padding: const EdgeInsets.all(8.0),
      //           child: Row(
      //             children: [
      //               Expanded(
      //                 child: Container(
      //                   height: 35.0,
      //                   child: RaisedButton(
      //                     onPressed: () {
      //                       checkRes(c);
      //                     },
      //                     shape: RoundedRectangleBorder(
      //                         borderRadius:
      //                         BorderRadius.circular(80.0)),
      //                     padding: EdgeInsets.all(0.0),
      //                     child: Ink(
      //                       decoration: BoxDecoration(
      //                           gradient: const LinearGradient(
      //                             colors: [
      //                               Color(0xff374ABE),
      //                               Color(0xff64B6FF)
      //                             ],
      //                             begin: Alignment.centerLeft,
      //                             end: Alignment.centerRight,
      //                           ),
      //                           borderRadius:
      //                           BorderRadius.circular(30.0)),
      //                       child: Container(
      //                         constraints: const BoxConstraints(
      //                             maxWidth: 250.0,
      //                             minHeight: 50.0),
      //                         alignment: Alignment.center,
      //                         child: Text(
      //                           "$c",
      //                           textAlign: TextAlign.center,
      //                           style: TextStyle(
      //                               color: Colors.white,
      //                               fontSize: 15),
      //                         ),
      //                       ),
      //                     ),
      //                   ),
      //                 ),
      //               ),
      //               const SizedBox(
      //                 width: 8,
      //               ),
      //               Expanded(
      //                 child: Container(
      //                   height: 35.0,
      //                   child: RaisedButton(
      //                     onPressed: () {
      //                       checkRes(d);
      //                     },
      //                     shape: RoundedRectangleBorder(
      //                         borderRadius:
      //                         BorderRadius.circular(80.0)),
      //                     padding: EdgeInsets.all(0.0),
      //                     child: Ink(
      //                       decoration: BoxDecoration(
      //                           gradient: const LinearGradient(
      //                             colors: [
      //                               Color(0xff374ABE),
      //                               Color(0xff64B6FF)
      //                             ],
      //                             begin: Alignment.centerLeft,
      //                             end: Alignment.centerRight,
      //                           ),
      //                           borderRadius:
      //                           BorderRadius.circular(30.0)),
      //                       child: Container(
      //                         constraints: BoxConstraints(
      //                             maxWidth: 250.0,
      //                             minHeight: 50.0),
      //                         alignment: Alignment.center,
      //                         child: Text(
      //                           "$d",
      //                           textAlign: TextAlign.center,
      //                           style: TextStyle(
      //                               color: Colors.white,
      //                               fontSize: 15),
      //                         ),
      //                       ),
      //                     ),
      //                   ),
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //         //buttns3,4
      //         Padding(
      //           padding: const EdgeInsets.all(18.0),
      //           child: ElevatedButton(
      //
      //               onPressed: _rollTheDice, child: Text("Roll")),
      //         ),
      //       ],
      //     ),
      //   ],
      // ),
    );
  }
}
