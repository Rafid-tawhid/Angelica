import 'package:flutter/cupertino.dart';
import 'package:random_game_new_version/auth/firebase_auth_services.dart';
import 'package:random_game_new_version/db/firestore_helper.dart';
import 'package:random_game_new_version/models/players_info_model.dart';

class PlayersPrvider extends ChangeNotifier{
  List<int> higestScoreList=[];

  Future<void> savePlayersInfo(PlayerInfoModel playerInfoModel) =>FireStoreHelper.playerInfoSave(playerInfoModel);

  void getHigestScore() {
    FireStoreHelper.getHigestScore()?.listen((snapshot) {

      higestScoreList= List.generate(snapshot.docs.length, (index) => snapshot.docs[index].data()['plus']);
      notifyListeners();

    });
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
  }


}