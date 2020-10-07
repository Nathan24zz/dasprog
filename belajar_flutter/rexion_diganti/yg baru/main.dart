import 'package:flutter/material.dart';
import 'package:rexion/10_home.dart';
import 'package:rexion/17_login.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:device_info/device_info.dart';
import 'dart:async';
import 'dart:io';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RexionOne',
      home: Splash(),
//      home: HomePage(),
    );
  }
}

class Splash extends StatefulWidget {
  Splash();

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  String cLoginDate = '';
  String cTrnDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  bool isLogin = false;

  @override
  void initState() {
    super.initState();
    _initCheck();
    Future.delayed(Duration(seconds: 1), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (c) => isLogin ? HomePage() : LoginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      backgroundColor: Colors.amber(0xff329cef),
      backgroundColor: Colors.amber,
      body: Center(
        child: Image.asset(
          "images/rexionone.png",
          width: 200.0,
          height: 200.0,
        ),
      ),
    );
  }

  void _initCheck() async {
    String cDeviceID;
    final DeviceInfoPlugin deviceInfoPlugin = new DeviceInfoPlugin();
    try {
      if (Platform.isAndroid) {
        var build = await deviceInfoPlugin.androidInfo;
        cDeviceID = build.androidId;
      } else if (Platform.isIOS) {
        var data = await deviceInfoPlugin.iosInfo;
        cDeviceID = data.identifierForVendor;
      }
    } catch (cDeviceID) {}

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('device_id', cDeviceID);

    isLogin = false;
    if (prefs.getString('strdate_login') != null) {
      setState(() {
        cLoginDate = prefs.getString('strdate_login');
        if (cLoginDate == cTrnDate) {
          isLogin = true;
        }
      });
    }
  }
}
