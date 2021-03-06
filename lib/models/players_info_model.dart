class PlayerInfoModel{
  String? id;
  String? name;
  String? email;
  int? plus;
  int? min;
  int? mup;
  int? div;
  String? titel;
  String? achivement;
  String? time;
  int? coin;

  PlayerInfoModel(
      {this.id,
      this.name,
      this.email,
      this.plus,
      this.min,
      this.mup,
      this.div,
      this.titel,
      this.achivement,
      this.time,
      this.coin});

  Map<String,dynamic> toMap(){
    var map=<String,dynamic>{
      'id':id,
      'name':name,
      'email':email,
      'plus':plus,
      'min':min,
      'mup':mup,
      'div':div,
      'titel':titel,
      'achivement':achivement,
      'time':time,
      'coin':coin,
    };

    return map;
  }
  factory PlayerInfoModel.fromMap(Map<String,dynamic> map)=> PlayerInfoModel(
    id:map['id'],
    name:map['name'],
    email: map['email'],
    plus: map['plus'],
    min: map['min'],
    mup: map['mup'],
    div: map['div'],
    titel: map['titel'],
    achivement: map['achivement'],
    time: map['time'],
    coin: map['coin'],

  );

  @override
  String toString() {
    return 'PlayerInfoModel{id: $id, name: $name, email: $email, plus: $plus, min: $min, mup: $mup, div: $div, titel: $titel, achivement: $achivement, time: $time,coin: $coin}';
  }
}