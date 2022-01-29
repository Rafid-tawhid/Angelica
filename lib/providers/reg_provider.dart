import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:random_game_new_version/db/firestore_helper.dart';
import 'package:random_game_new_version/models/players_info_model.dart';
import 'package:random_game_new_version/models/register_user_model.dart';

class RegisterProvider extends ChangeNotifier{
  List<String> nameList=[];
  List<String> name=[];


  Future<void> registerNewUser(RegisterUserModel registerUserModel) =>FireStoreHelper.newRegisterUser(registerUserModel);


  void getName()async{
    FireStoreHelper.getName().listen((snapshot) async {

      nameList=await List.generate(snapshot.docs.length, (index) =>
      snapshot.docs[index].data()['name']);

      notifyListeners();
    });
  }
 //  void getName2() async {
 //    final snapshot = await FireStoreHelper.getName2();
 //    name=List.generate(snapshot.docs.length, (index) => snapshot.docs[index].data()['name']);
 //    notifyListeners();
 //
 // }
}