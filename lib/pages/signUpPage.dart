
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_game_new_version/auth/firebase_auth_services.dart';
import 'package:random_game_new_version/main.dart';
import 'package:random_game_new_version/models/register_user_model.dart';
import 'package:random_game_new_version/providers/reg_provider.dart';

class SignUpPage extends StatefulWidget {
  static const String routeName='/signUp_page';

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String? _email,_pass,_name;
  String _errorMsg='';
  bool _isObscure=true;
  late RegisterProvider _registerProvider;
  final RegisterUserModel _registerUserModel=RegisterUserModel();
  final form_key=GlobalKey<FormState>();

  @override
  void didChangeDependencies() {
    _registerProvider=Provider.of(context,listen: false);
    super.didChangeDependencies();
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        body: Container(

          height: double.maxFinite,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage("img/bg.jpg",),
              fit: BoxFit.fill,
            ),
          ),

          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height:180,),
                Stack(
                  children: [

                    Container(

                      width: double.maxFinite,
                      height: 450,
                      margin: const EdgeInsets.only(left: 10,right: 10),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: ExactAssetImage("img/register_bg.png",),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Center(
                        child: Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Form(
                              key: form_key,
                              child: ListView(
                                shrinkWrap: true,
                                padding: const EdgeInsets.only(left: 30,right: 30,top: 100),
                                children: [

                                  TextFormField(

                                    validator: (value){
                                      if(value==null || value.isEmpty) {
                                        return 'This field must not be empty';
                                      }
                                      return null;
                                    },
                                    onSaved: (value){
                                      _name=value;
                                      _registerUserModel.name=value;
                                    },
                                    decoration: const InputDecoration(
                                      labelText: 'User Name',
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.pink, width: 1.0),
                                          borderRadius: BorderRadius.all(Radius.circular(25))
                                      ),
                                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(25))),


                                    ),
                                  ),
                                  const SizedBox(height: 20,),
                                  TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (value){
                                      if(value==null || value.isEmpty) {
                                        return 'This field must not be empty';
                                      }
                                      return null;
                                    },
                                    onSaved: (value){
                                      _email=value;
                                      _registerUserModel.email=value;
                                    },
                                    decoration: const InputDecoration(
                                      labelText: 'Email Address',
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.pink, width: 1.0),
                                          borderRadius: BorderRadius.all(Radius.circular(25))
                                      ),
                                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(25))),

                                    ),

                                  ),
                                  const SizedBox(height: 20,),
                                  TextFormField(
                                    obscureText: _isObscure,
                                    validator: (value){
                                      if(value==null || value.isEmpty) {
                                        return 'This field must not be empty';
                                      }
                                      return null;
                                    },
                                    onSaved: (value){
                                      _pass=value;
                                      _registerUserModel.pass=value;
                                    },
                                    decoration: InputDecoration(
                                        labelText: 'Password',
                                      enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.pink, width: 1.0),
                                      borderRadius: BorderRadius.all(Radius.circular(25))
                                  ),
                                        border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(25))),
                                        suffixIcon: IconButton(
                                            icon: Icon(
                                                _isObscure ? Icons.visibility : Icons.visibility_off),
                                            onPressed: () {
                                              setState(() {
                                                _isObscure = !_isObscure;
                                              });
                                            })),

                                  ),


                                  const SizedBox(height: 20,),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(child: Expanded(
                                        child: GestureDetector(
                                          child: Center(
                                            child: Image.asset('img/register.png',fit: BoxFit.cover,),
                                          ),
                                          onTap: (){
                                            _createUser();
                                          },
                                        ),
                                      ),),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Center(child: Text(_errorMsg,style: TextStyle(fontSize: 15,color: Colors.red),)),
                                  ),



                                ],
                              ))
                        ),
                      ),
                    ),
                    Container(
                      width: double.maxFinite,
                      transform: Matrix4.translationValues(0.0, -145.0, 0.0),
                      child: Image.asset('img/angle.png',height: 170,width: 170,),
                    ),
                  ],
                )

              ],
            ),
          )
        ),
      ),
    );
  }

  // void _userLogin() async{
  //   if(form_key.currentState!.validate())
  //     {
  //       form_key.currentState!.save();
  //
  //       try{
  //         final user= await FirebaseAuthServices.loginUser(_email!, _pass!);
  //         if(user !=null)
  //         {
  //           Navigator.pushReplacementNamed(context, HomePage.routeName);
  //         }
  //       }
  //       on FirebaseAuthException catch(e){
  //         setState(() {
  //           _errorMsg=e.message!;
  //         });
  //       }
  //     }
  // }

  void _createUser() async{
    if(form_key.currentState!.validate())
    {
      form_key.currentState!.save();
      try{


        //create new user with email and pass

        final user= await FirebaseAuthServices.createUser(_email!, _pass!);
        if(user !=null)
        {
          //add user info to firebase with provider

          _registerProvider.registerNewUser(_registerUserModel);

          Navigator.pushReplacementNamed(context, HomePage.routeName);
        }
      }
      on FirebaseAuthException catch(e){
        setState(() {
          _errorMsg=e.message!;
        });
      }



    }

  }
}
