import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:random_game_new_version/auth/firebase_auth_services.dart';
import 'package:random_game_new_version/db/firestore_helper.dart';
import 'package:random_game_new_version/models/players_info_model.dart';

import '../custom_widget/helper class.dart';

class PlayersPrvider extends ChangeNotifier{
  List<int> higestScoreList=[];
  List<PlayerInfoModel> playerList=[];
   Future<int>? coin;
   Future<int>? score_databse;
  PlayerInfoModel? playerinfoModel;




  Future<void> savePlayersInfo(PlayerInfoModel playerInfoModel) =>FireStoreHelper.playerInfoSave(playerInfoModel);



  Future<int?> getHigestScore() async  {
    var profile;
    await FireStoreHelper.getHigestScore().then((value)  {
       profile=value.docs.first.data()['plus'];
    });
    return profile;

  }


  // get players coin


  Future<int?> getCC() async{
   return FireStoreHelper.getCoins().then((value) async =>
      await value.docs.first.data()['coin']);
  }



  Future<PlayerInfoModel?> findPlayersAllInfo()async
  {
    final snapshot=await FireStoreHelper.findPlayersAllInfoByEmail(FirebaseAuthServices.currentUser!.email.toString());

    if(snapshot.docs.isNotEmpty){
       playerinfoModel=PlayerInfoModel.fromMap(snapshot.docs.first.data());
       ProfileInfo.setProfile(playerinfoModel!);
      notifyListeners();
      return playerinfoModel;
    }
    return null;
  }


  Future<void> updateProfileScore(PlayerInfoModel playerInfoModel,String types)async
  {
    FireStoreHelper.playerInfoUpdate(playerInfoModel,types);
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