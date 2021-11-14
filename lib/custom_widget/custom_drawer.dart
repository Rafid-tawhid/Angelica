import 'package:flutter/material.dart';
import 'package:random_game_new_version/pages/score_board.dart';

class CustomDrawer extends StatefulWidget {

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: <Widget>[
        Container(
          color: Color(0xffF61ABC),
          child: UserAccountsDrawerHeader(
            accountName: Text("Rafid Tawhid"),
            accountEmail:
            Text("rafid@pencilbox.edu.bd"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Container(
                child: Image.asset('img/angle.png'),
                padding: EdgeInsets.all(5),
              ),
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text("Home"),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text("My Profile"),
          onTap: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) =>
            //             ProfilePage()));
          },
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text("Players Profile"),
          onTap: () {
            // Navigator.pushNamed(context, ScoreBoard.routeName);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ScoreBoard()));
          },
        ),
        ListTile(
          leading: Icon(Icons.contacts),
          title: Text("Contact Us"),
          onTap: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) =>
            //             ContactPage()));
          },
        ),
      ],
    );
  }


}
