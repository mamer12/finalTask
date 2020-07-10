import 'package:flutter/material.dart';
import 'Everything.dart';

class viewPage extends StatefulWidget {
  @override
  _viewPageState createState() => _viewPageState();
}

class _viewPageState extends State<viewPage> {
  @override
  void initState() {
    isLoading = true;
    {
      setState(() {
        isLoading = false;
      });
    }
    ;
    super.initState();
  }

  bool isLoading;

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("view read more about . . "),
        ),
        body: Container(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
          ),
        ));
  }
}

class allHeadLines {
  String description;
  String url;
  allHeadLines(this.description, this.url);
  factory allHeadLines.fromJson(Map<String, dynamic> json) {
    // ignore: unused_label
    description:
    json["HeadLines"];
    // ignore: unused_label
    url:
    json["name"];
  }
}
