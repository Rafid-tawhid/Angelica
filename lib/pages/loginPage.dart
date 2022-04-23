
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:random_game_new_version/auth/firebase_auth_services.dart';
import 'package:random_game_new_version/main.dart';
import 'package:random_game_new_version/pages/signUpPage.dart';
import 'package:random_game_new_version/providers/reg_provider.dart';

class LoginPage extends StatefulWidget {
  static const String routeName='/login_page';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? _email,_pass;
  String _errorMsg='';
  bool _isObscure=true;


  final form_key=GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        // appBar: AppBar(
        //   title: Text('Login Page'),
        //   actions: [
        //     ElevatedButton.icon(onPressed: (){
        //       FirebaseAuth.instance.signOut();
        //     } , icon: Icon(Icons.logout), label: Text('logout'))
        //   ],
        //   centerTitle: true,
        //   leading: IconButton(onPressed:(){Navigator.pop(context);} , icon: Icon(Icons.arrow_back)),
        // ),
        body: Container(
          width: double.maxFinite,
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
                 SizedBox(height:MediaQuery.of(context).size.width/1.5,),
                Stack(
                  children: [

                    Container(
                      height: MediaQuery.of(context).size.height/2,
                      width: double.maxFinite,

                      margin: const EdgeInsets.only(left: 10,right: 10),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: ExactAssetImage("img/login_bg.png",),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Center(
                        child: Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Form(

                              key: form_key,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListView(
                                  shrinkWrap: true,
                                  padding: EdgeInsets.only(left: 30,right: 30,top: 20),
                                  children: [
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
                                                  _isObscure ? Icons.visibility : Icons.visibility_off,color: Colors.pinkAccent,),
                                              onPressed: () {
                                                setState(() {
                                                  _isObscure = !_isObscure;
                                                });
                                              })),

                                    ),


                                    SizedBox(height: 20,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          child: Center(
                                            child: Image.asset('img/login.png',fit: BoxFit.cover,),
                                          ),
                                          onTap: (){
                                            _userLogin();
                                          },
                                        ),



                                      ],
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Center(child: Text(_errorMsg,style: TextStyle(fontSize: 15,color: Colors.red),)),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text('Don\'t have an account?',style: GoogleFonts.bubblegumSans(
                                            fontSize: 16,color: Colors.black),),
                                        SizedBox(width: 10,),
                                        InkWell(
                                          onTap: (){
                                            _createUser();
                                          },
                                          child: Text('Register',style:  GoogleFonts.bubblegumSans(
                                              fontSize: 16,color: Colors.pinkAccent),),
                                        )
                                      ],
                                    ),



                                  ],
                                ),
                              )),
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

    Navigator.pushNamed(context, SignUpPage.routeName);
    // try{
    //   final user= await FirebaseAuthServices.createUser(_email!, _pass!);
    //   if(user !=null)
    //   {
    //     Navigator.pushReplacementNamed(context, HomePage.routeName);
    //   }
    // }
    // on FirebaseAuthException catch(e){
    //   setState(() {
    //     _errorMsg=e.message!;
    //   });
    // }


  }
}