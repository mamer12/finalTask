import 'package:flutter/material.dart';
import 'sources.dart';
import 'TopHeadlines.dart';
import 'Everything.dart';
import 'theSearch.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData.dark(),
    debugShowCheckedModeBanner: false,
    title: 'Named Routes Demo',
    initialRoute: '/',
    routes: {
      "/": (context) => TheHome(),
      '/second': (context) => TheTop(),
      '/search': (context) => TheSearchs(),
      '/sources': (context) => Thesources(),
    },
  ));
}
