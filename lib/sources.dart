import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'TopHeadlines.dart';
import 'theSearch.dart';
import 'Everything.dart';

class Thesources extends StatefulWidget {
  @override
  _ThesourcesState createState() => _ThesourcesState();
}

class _ThesourcesState extends State<Thesources> {
  List<allHeadLines> _headLine = List<allHeadLines>();

  Future<List<allHeadLines>> fetchNotes() async {
    var url =
        'http://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=3d7e243862e14da8b428c23101b74624';
    var response = await http.get(url);
    var headLine = List<allHeadLines>();
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      var headsJson = json.decode(response.body);
      // ignore: unused_local_variable
      var headsJson2 = headsJson.toList();
      // ignore: unused_local_variable
      for (var linesJson in headsJson2.toList()) {
        headLine.add(allHeadLines.fromJson(headsJson));
      }
    }
    return headLine;
  }

  @override
  void initState() {
    fetchNotes().then((value) {
      setState(() {
        _headLine.addAll(value);
      });
    });
    super.initState();
  }

  Widget build(BuildContext context) => Scaffold(
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TheTop()),
                );
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TheHome()),
                );
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Thesources()),
                );
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TheSearchs()),
                );
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
          "sources",
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
      ),
      backgroundColor: Colors.black,
      body: ListView.builder(
          itemCount: _headLine.length,
          itemBuilder: ((BuildContext context, int index) => Card(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.album),
                    title: Text(
                      _headLine[index].title,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      _headLine[index].title,
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                  ),
                  ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        color: Colors.black,
                        child: const Text('View More'),
                        onPressed: () {/* ... */},
                      ),
                    ],
                  ),
                ],
              )))));
}

// ignore: camel_case_types
class allHeadLines {
  String author;
  String title;
  allHeadLines(this.author, this.title);
  allHeadLines.fromJson(Map<String, dynamic> json) {
    author = json["HeadLines"];
    title = json["name"];
  }
}
