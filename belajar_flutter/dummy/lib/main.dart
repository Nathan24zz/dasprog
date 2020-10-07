import 'package:flutter/material.dart';
import 'package:dummy/10_home.dart';
import 'package:intl/intl.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String cLoginDate = '';
  String cTrnDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  bool isLogin = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RexionOne',
//      home: SplashPage(),
      home: HomePage(),
    );
  }
}
