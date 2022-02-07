
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:random_game_new_version/auth/firebase_auth_services.dart';
import 'package:random_game_new_version/models/players_info_model.dart';
import 'package:random_game_new_version/models/register_user_model.dart';

class FireStoreHelper{

  static const String _collectionRegister='Registration';
  static const String _collectionPlayersInfo='Players';
  static final FirebaseFirestore _db=FirebaseFirestore.instance;


  static Future<void> newRegisterUser(RegisterUserModel registerUserModel){
    final docRef=_db.collection(_collectionRegister).doc();
    registerUserModel.id=docRef.id;
   return docRef.set(registerUserModel.toMap());
  }


  //getting name from database

  static Stream<QuerySnapshot<Map<String, dynamic>>> getName()=>
      _db.collection(_collectionRegister).
      where('email',isEqualTo: FirebaseAuth.instance.currentUser!.email).snapshots();
  




  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllPlayers()=>
      _db.collection(_collectionPlayersInfo).snapshots();


   // static Future<QuerySnapshot<Map<String, dynamic>>> getName2()=>_db.collection(_collectionPlayersInfo).where('email',isEqualTo: FirebaseAuth.instance.currentUser!.email).get();







  //saving players info
  static Future<void> playerInfoSave(PlayerInfoModel playerInfoModel){
    final docRef=_db.collection(_collectionPlayersInfo).doc();
    playerInfoModel.id=docRef.id;
    return docRef.set(playerInfoModel.toMap());
  }

  //getting higest score
  static Future<QuerySnapshot<Map<String, dynamic>>> getHigestScore(){
      return _db.collection(_collectionPlayersInfo).
      where('email',isEqualTo: FirebaseAuth.instance.currentUser!.email).get();
  }

// getting coin from database

  static Future<QuerySnapshot<Map<String, dynamic>>> getCoins()=>
      _db.collection(_collectionPlayersInfo)
          .where('email',isEqualTo: FirebaseAuth.instance.currentUser!.email)
          .get();



  static Future<QuerySnapshot<Map<String, dynamic>>> findPlayersAllInfoByEmail(String mail)
  {
   return _db.collection(_collectionPlayersInfo).where('email',isEqualTo: mail).get();
  }



  //update existing players info by email
  static Future<void> playerInfoUpdate(PlayerInfoModel playerInfoModel,String type)async {
    final docRef=_db.collection(_collectionPlayersInfo).doc(playerInfoModel.id);
    print('DOC REF: '+docRef.toString());
    switch(type)
    {
      case "plus":
       await docRef.update({'email': playerInfoModel.email, 'plus' :playerInfoModel.plus });
        break;
      case "min":
       await docRef.update({'email': playerInfoModel.email, 'min' :playerInfoModel.min });
        break;
      case "mup":
       await docRef.update({'email': playerInfoModel.email, 'mup' :playerInfoModel.mup });
        break;
      case "div":
       await docRef.update({'email': playerInfoModel.email, 'div' :playerInfoModel.div });
        break;
    }
  }


}