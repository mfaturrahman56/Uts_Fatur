import 'package:flutter/material.dart';
import 'package:uts/page/loginpage.dart';


void main() {
  runApp(BengkelBubutApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BengkelBubutApp(),
    );
  }
}