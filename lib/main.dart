import 'package:flutter/material.dart';
import 'package:frivia/Pages/game_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Frivia',
      theme: ThemeData(
       fontFamily: 'ArchitectsDaughter',
        scaffoldBackgroundColor: Colors.black54,

        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }



}

