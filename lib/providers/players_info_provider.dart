import 'package:flutter/cupertino.dart';
import 'package:random_game_new_version/db/firestore_helper.dart';
import 'package:random_game_new_version/models/players_info_model.dart';

class PlayersPrvider extends ChangeNotifier{
  List<int> higestScoreList=[];

  Future<void> savePlayersInfo(PlayerInfoModel playerInfoModel) =>FireStoreHelper.playerInfoSave(playerInfoModel);

  void getHigestScore(){
    FireStoreHelper.getHigestScore().listen((snapshot) {

      higestScoreList=List.generate(snapshot.docs.length, (index) => snapshot.docs[index].data()['plus']);
      notifyListeners();
    });
  }
}