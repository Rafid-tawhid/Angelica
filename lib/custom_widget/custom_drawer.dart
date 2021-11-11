import 'package:flutter/material.dart';

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
        UserAccountsDrawerHeader(
          accountName: Text("Rafid Tawhid"),
          accountEmail:
          Text("rafid@pencilbox.edu.bd"),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.orange,
            child: Text(
              "PB",
              style: TextStyle(fontSize: 30.0),
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
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) =>
            //             PlayerDashboard()));
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
