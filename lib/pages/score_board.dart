import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScoreBoard extends StatefulWidget {
  static const String routeName = '/score_page';
  @override
  _ScoreBoardState createState() => _ScoreBoardState();
}

class _ScoreBoardState extends State<ScoreBoard> {
   int plusScore=0;
 int minScore=0;
   int mupScore=0;
  int divScore=0;
  late String _plusDate="",_minDate="",_mupDate="",_divDate="";

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 1000), () {
      setState(() {
        fetchAllHigestScoreFromSharedPref();
      });

    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('ScoreBoard'),centerTitle: true,),
      body: Column(
        children: [
          Card(
            elevation: 8,
            margin: EdgeInsets.all(4),
            child: ListTile(
              title: Text('Plus'),
              subtitle: Text(_plusDate),
              leading: Icon(Icons.add),
              trailing: Text(plusScore.toString(),style: TextStyle(fontSize: 22),),
              onTap: (){
                print(_divDate);
              },
            ),
          ),
          Card(
            elevation: 8,
            margin: EdgeInsets.all(4),
            child: ListTile(
              title: Text('Minus'),
              subtitle: Text(_minDate),
              leading: Icon(Icons.add),
              trailing: Text(minScore.toString(),style: TextStyle(fontSize: 22),),

            ),
          ),
          Card(
            elevation: 8,
            margin: EdgeInsets.all(4),
            child: ListTile(
              title: Text('Multiplication'),
              subtitle: Text(_mupDate),
              leading: Icon(Icons.add),
              trailing: Text(mupScore.toString(),style: TextStyle(fontSize: 22),),

            ),
          ),
          Card(
            elevation: 8,
            margin: EdgeInsets.all(4),
            child: ListTile(
              title: Text('Division'),
              subtitle: Text(_divDate),
              leading: Icon(Icons.add),
              trailing: Text(divScore.toString(),style: TextStyle(fontSize: 22),),

            ),
          ),
        ],
      ),
    );
  }
  Future<void> fetchAllHigestScoreFromSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      plusScore = prefs.getInt("high")!;
      minScore = prefs.getInt("min")!;
      mupScore = prefs.getInt("mup")!;
      divScore = prefs.getInt("div")!;
      _plusDate = prefs.getString("highDt")!;
      _minDate = prefs.getString("minDt")!;
      _mupDate = prefs.getString("mupDt")!;
      _divDate = prefs.getString("divDt")!;


    });

  }
}
