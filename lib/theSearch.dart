import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TheSearchs extends StatefulWidget {
  @override
  _TheSearchsState createState() => _TheSearchsState();
}

class _TheSearchsState extends State<TheSearchs> {
  List<allHeadLines> _heads = List<allHeadLines>();
  List<allHeadLines> _headsForDisplay = List<allHeadLines>();

  Future<List<allHeadLines>> fetchNotes() async {
    var url =
        'http://newsapi.org/v2/everything?q=bitcoin&from=2020-06-09&sortBy=publishedAt&apiKey=3d7e243862e14da8b428c23101b74624';
    var response = await http.get(url);

    var headLine = List<allHeadLines>();

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
    fetchNotes().then((value) {
      setState(() {
        _heads.addAll(value);
        _headsForDisplay = _heads;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          "Top HeadLines",
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return index == 0 ? _searchBar() : _listItem(index - 1);
        },
        itemCount: _headsForDisplay.length + 1,
      ),
      backgroundColor: Colors.black,
    );
  }

  _searchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: "Search",
          hintText: "Search",
          prefixIcon: Icon(
            Icons.search,
            color: Colors.white,
          ),
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white, width: 3.0),
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
        onChanged: (text) {
          text = text.toLowerCase();
          setState(() {
            _headsForDisplay = _heads.where((note) {
              var noteTitle = note.name.toLowerCase();
              return noteTitle.contains(text);
            }).toList();
          });
        },
      ),
    );
  }

  _listItem(index) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(
            top: 32.0, bottom: 32.0, left: 16.0, right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              _headsForDisplay[index].name,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              _headsForDisplay[index].name,
              style: TextStyle(color: Colors.grey.shade600),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class allHeadLines {
  String source;
  String name;
  allHeadLines(this.source, this.name);
  allHeadLines.fromJson(Map<String, dynamic> json) {
    source = json["HeadLines"];
    name = json["name"];
  }
}
