import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:random_game_new_version/models/register_user_model.dart';

class FireStoreHelper{

  static const String _collectionRegister='Registration';
  static const String _collectionPlayersInfo='Players';
  static FirebaseFirestore _db=FirebaseFirestore.instance;


  static Future<void> newRegisterUser(RegisterUserModel registerUserModel){
    final docRef=_db.collection(_collectionRegister).doc();
    registerUserModel.id=docRef.id;
   return docRef.set(registerUserModel.toMap());
  }



  static Stream<QuerySnapshot<Map<String, dynamic>>> getName()=>_db.collection(_collectionRegister).where('email',isEqualTo: FirebaseAuth.instance.currentUser!.email).snapshots();



}