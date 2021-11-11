import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastButton extends StatefulWidget {
  const ToastButton({Key? key}) : super(key: key);

  @override
  _ToastButtonState createState() => _ToastButtonState();
}

class _ToastButtonState extends State<ToastButton> {

  late FToast fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Center(
        child: Scaffold(
          body: Text("Print"),
        ),
      ),
    );
  }
}
