import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:random_game_new_version/auth/firebase_auth_services.dart';
import 'package:random_game_new_version/db/firestore_helper.dart';

class RegisterUserModel{
  String? id;
  String? name;
  String? email;
  String? pass;


  RegisterUserModel({this.id, this.name, this.email, this.pass});

  Map<String,dynamic> toMap(){
    var map=<String,dynamic>{
      'id':id,
      'name':name,
      'email':email,
      'pass':pass,
    };

    return map;
  }
  factory RegisterUserModel.fromMap(Map<String,dynamic> map)=> RegisterUserModel(
    id:map['id'],
    name:map['name'],
    email: map['email'],
    pass: map['pass'],

  );






  @override
  String toString() {
    return 'UserModel{id: $id, name: $name, email: $email, pass: $pass}';
  }
}