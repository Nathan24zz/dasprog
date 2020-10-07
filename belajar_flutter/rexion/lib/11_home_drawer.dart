import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rexion/20_sales/20_salesomzet.dart';
import 'package:rexion/95_personal/95_personal.dart';
import 'package:rexion/97_admin/97_admin.dart';

// ignore: camel_case_types
class HomeDrawer extends StatefulWidget {
  @override
  _Home_DrawerState createState() => _Home_DrawerState();
}

class _Home_DrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: <Color>[
                Colors.lightBlue[900],
                Colors.lightBlue[700]
              ])),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Material(
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      elevation: 10,
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(3.0),
                      child: Text(
                        'Rexion',
                        style: TextStyle(color: Colors.white, fontSize: 15.0),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(1.0),
                      child: Text(
                        'Keuangan',
                        style: TextStyle(color: Colors.white, fontSize: 12.0),
                      ),
                    )
                  ],
                ),
              )),
          ListTile(
              title: Text('Sales'),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => SalesOmzetPage()));
              }),
          ListTile(
              title: Text('Personal'),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => PersonalPage()));
              }),
          ListTile(
              title: Text('Admin'),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => AdminPage()));
              }),
        ],
      ),
    );
  }
}
