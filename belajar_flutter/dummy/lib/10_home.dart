import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dummy/11_home_drawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  String cCompanyCode = '';

  @override
  void initState() {
    super.initState();
    _initCheck();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue[900], Colors.blue[700]], 
            ),
            image: DecorationImage(
              image: AssetImage('images/pattern.png'),
              fit: BoxFit.contain,
              repeat: ImageRepeat.repeat
            )
          ),
        ),
      ),
      drawer: HomeDrawer(),
      body: Center(
        child: Text('This is HOME PAGE'),
      ),
    );
  }

  void _initCheck() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString('company_code', '106-merak');
    });
  }
}
