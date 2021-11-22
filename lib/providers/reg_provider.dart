import 'package:flutter/cupertino.dart';
import 'package:random_game_new_version/db/firestore_helper.dart';
import 'package:random_game_new_version/models/register_user_model.dart';

class RegisterProvider extends ChangeNotifier{
  List<String> nameList=[];

  Future<void> registerNewUser(RegisterUserModel registerUserModel) =>FireStoreHelper.newRegisterUser(registerUserModel);


  void getName(){
    FireStoreHelper.getName().listen((snapshot) {

      nameList=List.generate(snapshot.docs.length, (index) => snapshot.docs[index].data()['name']);
      notifyListeners();
    });
  }

}