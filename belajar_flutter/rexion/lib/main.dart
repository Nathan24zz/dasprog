import 'package:flutter/material.dart';
import 'package:rexion/10_home.dart';
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
      title: 'RexionOne',
//      home: SplashPage(),
      home: HomePage(),
    );
  }
}
