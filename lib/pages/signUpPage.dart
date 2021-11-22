
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_game_new_version/auth/firebase_auth_services.dart';
import 'package:random_game_new_version/main.dart';

class SignUpPage extends StatefulWidget {
  static const String routeName='/signUp_page';

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String? _email,_pass,_name;
  String _errorMsg='';
  bool _isObscure=true;

  final form_key=GlobalKey<FormState>();
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
                      },
                      decoration: InputDecoration(
                        labelText: 'Password',
                        // suffixIcon: GestureDetector(
                        //   onLongPress: () {
                        //     setState(() {
                        //       _passwordVisible = true;
                        //
                        //     });
                        //   },
                        //   onLongPressUp: () {
                        //     setState(() {
                        //       _passwordVisible = false;
                        //     });
                        //   },
                        //   child: Icon(
                        //       _passwordVisible ? Icons.visibility : Icons.visibility_off),
                        // ),
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
                        SizedBox(width: 40,),
                        Center(child: ElevatedButton(onPressed: _userLogin, child: Text('Login'))),

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
        final user= await FirebaseAuthServices.createUser(_email!, _pass!);
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
}
