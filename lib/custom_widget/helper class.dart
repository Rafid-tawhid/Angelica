import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:random_game_new_version/auth/firebase_auth_services.dart';
import 'package:random_game_new_version/models/players_info_model.dart';
class Value {
  static String? value;
  static void setString(String newValue) {
    value = newValue;
  }

  static String? getString() {
    if(value==null)
    {
      return "hello.!";
    }
    else
    {
      return value;
    }
  }
}

class ProfileInfo {
  static PlayerInfoModel? profile;
  static void setProfile(PlayerInfoModel newValue) {
    profile = newValue;
  }

  static PlayerInfoModel? getProfile() {
    if(profile==null)
    {

      return null;
    }
    else
      {
        return profile;
      }
  }


}
  class HelperClass{
  static void savePlayersInfoToFirebase(PlayerInfoModel _playerInfoModel) {
    var now = new DateTime.now();
    var formatter = new DateFormat('MMM-dd / h:mm');
    String formattedDate = formatter.format(now);

    _playerInfoModel.name=Value.getString().toString();
    _playerInfoModel.email=FirebaseAuthServices.currentUser!.email;
    _playerInfoModel.titel='Noob';
    _playerInfoModel.plus=0;
    _playerInfoModel.min=0;
    _playerInfoModel.mup=0;
    _playerInfoModel.div=0;
    _playerInfoModel.achivement='None';
    _playerInfoModel.time=formattedDate;


  }
}