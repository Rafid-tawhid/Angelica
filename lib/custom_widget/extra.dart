import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Extra extends StatefulWidget {
  const Extra({Key? key}) : super(key: key);

  @override
  _ExtraState createState() => _ExtraState();
}

class _ExtraState extends State<Extra> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Container(
            transform: Matrix4.translationValues(0.0, -50.0, 0.0),
            child: Image.asset('img/angle.png',height: 200,width: 200,),
          ),
          // Container(
          //   height: MediaQuery.of(context).size.height/2,
          //   padding: EdgeInsets.all(10),
          //
          //   decoration: const BoxDecoration(
          //     image: DecorationImage(
          //       image: ExactAssetImage("img/login_bg.png",),
          //       fit: BoxFit.fill,
          //     ),
          //   ),
          //   child: Form(
          //
          //       key: form_key,
          //       child: ListView(
          //
          //         padding: EdgeInsets.only(left: 30,right: 30,top: 20),
          //         children: [
          //           SizedBox(height: 80,),
          //           TextFormField(
          //             keyboardType: TextInputType.emailAddress,
          //             validator: (value){
          //               if(value==null || value.isEmpty)
          //                 return 'This field must not be empty';
          //               return null;
          //             },
          //             onSaved: (value){
          //               _email=value;
          //             },
          //             decoration: InputDecoration(
          //               labelText: 'Email Address',
          //               border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(25))),
          //
          //             ),
          //           ),
          //           SizedBox(height: 20,),
          //           TextFormField(
          //             obscureText: _isObscure,
          //             validator: (value){
          //               if(value==null || value.isEmpty)
          //                 return 'This field must not be empty';
          //               return null;
          //             },
          //             onSaved: (value){
          //               _pass=value;
          //             },
          //             decoration: InputDecoration(
          //                 labelText: 'Password',
          //                 border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(25))),
          //                 suffixIcon: IconButton(
          //                     icon: Icon(
          //                         _isObscure ? Icons.visibility : Icons.visibility_off),
          //                     onPressed: () {
          //                       setState(() {
          //                         _isObscure = !_isObscure;
          //                       });
          //                     })),
          //
          //           ),
          //
          //
          //           SizedBox(height: 20,),
          //           Row(
          //             mainAxisSize: MainAxisSize.min,
          //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //             children: [
          //               SizedBox(width: 20,),
          //               Expanded(
          //                 child: GestureDetector(
          //                   child: Center(
          //                     child: Image.asset('img/login.png',fit: BoxFit.cover,),
          //                   ),
          //                   onTap: (){
          //                     _userLogin();
          //                   },
          //                 ),
          //               ),
          //               SizedBox(width: 20,),
          //
          //               Expanded(child: GestureDetector(child: Center(child: Image.asset('img/register.png',fit: BoxFit.cover,),),
          //                 onTap: () {
          //                   _createUser();
          //                 },),),
          //               SizedBox(width: 20,),
          //
          //             ],
          //           ),
          //           Padding(
          //             padding: const EdgeInsets.all(6.0),
          //             child: Center(child: Text(_errorMsg,style: TextStyle(fontSize: 15,color: Colors.red),)),
          //           ),
          //
          //
          //
          //         ],
          //       )),
          // ),
    //       if(FirebaseAuthServices.currentUser==null)
    // {
    // Navigator.pop(context);
    // }
    // else
    // {
    // savePlayersInfoToFirebase();
    // _playersPrvider.savePlayersInfo(_playerInfoModel);
    // }


        ],
      ),
    );
  }
}
