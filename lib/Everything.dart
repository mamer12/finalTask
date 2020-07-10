import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'TopHeadlines.dart';
import 'sources.dart';
import 'theSearch.dart';
import 'viewMore.dart';

class TheHome extends StatefulWidget {
  @override
  _TheHomeState createState() => _TheHomeState();
}

class _TheHomeState extends State<TheHome> {
  List<allHeadLines> _headLine = List<allHeadLines>();

  Future<List<allHeadLines>> fetchNotes() async {
    var url =
        'http://newsapi.org/v2/everything?q=bitcoin&from=2020-06-09&sortBy=publishedAt&apiKey=3d7e243862e14da8b428c23101b74624';
    var response = await http.get(url);
    var headLine = List<allHeadLines>();
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      var headsJson = json.decode(response.body);
      // ignore: unused_local_variable
      for (var linesJson in headsJson) {
        headLine.add(allHeadLines.fromJson(headsJson));
      }
    }
    return headLine;
  }

  @override
  void initState() {
    isLoading = true;
    fetchNotes().then((value) {
      setState(() {
        _headLine.addAll(value);
        isLoading = false;
      });
    });
    super.initState();
  }

  bool isLoading;

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
          "Articles",
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
      ),
      backgroundColor: Colors.black,
      body: Container(
          child: isLoading
              ? CircularProgressIndicator()
              : ListView.builder(
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
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
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
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => viewPage()),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ))))));
}

// ignore: camel_case_types
class allHeadLines {
  dynamic author;
  dynamic title;
  allHeadLines({this.author, this.title});
  // ignore: missing_return
  factory allHeadLines.fromJson(Map<String, dynamic> json) {
    return allHeadLines(
      author: json["HeadLines"],
      title: json["name"],
    );
  }
}
