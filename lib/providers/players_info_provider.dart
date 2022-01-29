import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:random_game_new_version/auth/firebase_auth_services.dart';
import 'package:random_game_new_version/db/firestore_helper.dart';
import 'package:random_game_new_version/models/players_info_model.dart';

class PlayersPrvider extends ChangeNotifier{
  List<int> higestScoreList=[];
  List<PlayerInfoModel> playerList=[];
   Future<int>? coin;




  Future<void> savePlayersInfo(PlayerInfoModel playerInfoModel) =>FireStoreHelper.playerInfoSave(playerInfoModel);

  void getHigestScore() {
    FireStoreHelper.getHigestScore()?.listen((snapshot) {

      higestScoreList= List.generate(snapshot.docs.length, (index) =>
      snapshot.docs[index].data()['plus']);
      notifyListeners();

    });
  }


  // get players coin

  Future<Map<String, dynamic>> getPlayersCoin() async {

   return await FireStoreHelper.getCoins().then((value) =>
     value.docs.first.data()['coin']);

  }

  Future<int?> getCC() async{
   return FireStoreHelper.getCoins().then((value) async =>
      await value.docs.first.data()['coin']);
      notifyListeners();
    print('HELLO .. $coin');

  }



  Future<PlayerInfoModel?> findPlayersAllInfo(String mail)async
  {
    final snapshot=await FireStoreHelper.findPlayersAllInfoByEmail(FirebaseAuthServices.currentUser!.email.toString());

    if(snapshot.docs.isNotEmpty){
      final playerinfoModel=PlayerInfoModel.fromMap(snapshot.docs.first.data());
      return playerinfoModel;
    }
    return null;
  }


  Future<void> updateProfileScore(PlayerInfoModel playerInfoModel,String types)async
  {
    FireStoreHelper.playerInfoUpdate(playerInfoModel,types);
    print(playerInfoModel.toString());
    print(playerInfoModel.toString());
  }

  //get all players from db

void getPlayers(){
    FireStoreHelper.getAllPlayers().listen((snapshot) {

      playerList=List.generate(snapshot.docs.length, (index) =>
          PlayerInfoModel.fromMap(snapshot.docs[index].data()));
     //
     // print('LENGTHS :'+playerList.length.toString());
      notifyListeners();
    });
}


}