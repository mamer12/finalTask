import 'package:flutter/material.dart';

// ignore: camel_case_types
class theDrawer extends StatefulWidget {
  @override
  _drawerState createState() => _drawerState();
}

// ignore: camel_case_types
class _drawerState extends State<theDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: Container(
        color: Colors.black,
        child: ListView(
          padding: EdgeInsets.only(left: 5),
          children: <Widget>[
            ListTile(
              leading: Icon(
                Icons.view_headline,
                color: Colors.white,
              ),
              contentPadding: EdgeInsets.only(top: 30),
              title: Text(
                'Top Headlines',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: Icon(
                Icons.view_headline,
                color: Colors.white,
              ),
              contentPadding: EdgeInsets.only(top: 30),
              title: Text(
                'Everything',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: Icon(
                Icons.view_headline,
                color: Colors.white,
              ),
              contentPadding: EdgeInsets.only(top: 30),
              title: Text(
                'Sources',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: Icon(
                Icons.search,
                color: Colors.white,
              ),
              contentPadding: EdgeInsets.only(top: 30),
              title: Text(
                'Search',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      )),
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          "Articles",
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
