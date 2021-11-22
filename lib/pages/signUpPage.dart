
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
  RegisterUserModel _registerUserModel=RegisterUserModel();
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
        appBar: AppBar(
          title: Text('Register Page'),
          centerTitle: true,
          leading: IconButton(onPressed:(){Navigator.pop(context);} , icon: Icon(Icons.arrow_back)),
        ),
        body: Center(
          child: Container(
            child: Form(
              key: form_key,
                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.all(15),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Center(child: Text('Registration',style: TextStyle(fontSize: 25,letterSpacing: 2),)),
                    ),
                    TextFormField(

                      validator: (value){
                        if(value==null || value.isEmpty)
                          return 'This field must not be empty';
                        return null;
                      },
                      onSaved: (value){
                        _name=value;
                        _registerUserModel.name=value;
                      },
                      decoration: InputDecoration(
                        labelText: 'User Name',
                        border: OutlineInputBorder(),

                      ),
                    ),
                    SizedBox(height: 20,),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      validator: (value){
                        if(value==null || value.isEmpty)
                          return 'This field must not be empty';
                        return null;
                      },
                      onSaved: (value){
                        _email=value;
                        _registerUserModel.email=value;
                      },
                      decoration: InputDecoration(
                        labelText: 'Email Address',
                        border: OutlineInputBorder(),

                      ),
                    ),
                    SizedBox(height: 20,),
                    TextFormField(
                      obscureText: _isObscure,
                      validator: (value){
                        if(value==null || value.isEmpty)
                          return 'This field must not be empty';
                        return null;
                      },
                      onSaved: (value){
                        _pass=value;
                        _registerUserModel.pass=value;
                      },
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                          suffixIcon: IconButton(
                              icon: Icon(
                                  _isObscure ? Icons.visibility : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              })),

                      ),


                    SizedBox(height: 40,),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(child: ElevatedButton(onPressed: _createUser, child: Text('Register'))),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Center(child: Text(_errorMsg,style: TextStyle(fontSize: 15,color: Colors.red),)),
                    ),



                  ],
            )),
          ),
        ),
      ),
    );
  }

  void _userLogin() async{
    if(form_key.currentState!.validate())
      {
        form_key.currentState!.save();

        try{
          final user= await FirebaseAuthServices.loginUser(_email!, _pass!);
          if(user !=null)
          {
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
