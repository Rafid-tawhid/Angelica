import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_game_new_version/providers/players_info_provider.dart';

class AllPlayers extends StatefulWidget {

  static const String routeName='/players';

  @override
  _AllPlayersState createState() => _AllPlayersState();
}

class _AllPlayersState extends State<AllPlayers> {

  late PlayersPrvider playersPrvider;
  @override
  void didChangeDependencies() {
    playersPrvider=Provider.of<PlayersPrvider>(context);
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Records'),
      ),
      body: ListView.builder(itemCount: playersPrvider.playerList.length,
            itemBuilder: (context,index){
              final players=playersPrvider.playerList[index];
              return ListTile(
                title: Text(players.email!),
                subtitle: Text(players.time!),
                trailing: IconButton(
                  icon: Text('${players.plus}'),
                  onPressed: (){
                  },
                ),
              );

            }
             ,)

    );
  }
}
