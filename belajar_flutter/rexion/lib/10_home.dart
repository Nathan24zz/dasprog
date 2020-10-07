import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rexion/11_home_drawer.dart';

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
        backgroundColor: Colors.lightBlue[900],
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
      prefs.setString('username', '18-0001');
      prefs.setString('employee_id', '1122334455');
      prefs.setString('employee_code', '18-0001');
      prefs.setString('employee_name', 'Gunawan Makmur');
      prefs.setString('employee_position', 'Manager HRD');
      prefs.setString('employee_image',
          'https://rexion.my.id/apps/company/106_merak/employee/111.jpg');
    });
  }
}
