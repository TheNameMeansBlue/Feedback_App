import 'package:flutter/material.dart';
import 'package:world_time/pages/comment.dart';
import 'package:world_time/pages/home.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

void main() {
  runApp(Phoenix(
    child: MaterialApp(
      initialRoute: '/home',
      routes: {
        '/home': (context) => Home(),
        '/comment': (context) => Com(),
      },
    ),
  ));
}
