import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:dummy/20_sales/20_salesomzet.dart';

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
                gradient: LinearGradient(
                  colors: <Color>[
                    Colors.lightBlue[900],
                    Colors.lightBlue[700]
                  ],
                  begin: FractionalOffset.topLeft,
                  end: FractionalOffset.bottomRight
                )
              ),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Material(
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      elevation: 10,
                      child: Image.asset(
                        'images/icon.png',
                        height: 90,
                        width: 90,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(3.0),
                      child: Text(
                        'Rexion',
                        style: TextStyle(
                          color: Colors.white, 
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
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
          CustomListTile(text: 'Sales', icon: Icons.person, onTap: () {
            Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => SalesOmzetPage()));
            },
          ),
          CustomListTile(text: 'Sales Unit', icon: Icons.person_add, onTap: () {
            Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => SalesOmzetPage()));
            },
          ),
          CustomListTile(text: 'Settings', icon: Icons.settings, onTap: () {}
          ),
        ],
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {

  final String text;
  final IconData icon;
  final Function onTap;

  CustomListTile({this.text, this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: InkWell(
        splashColor: Colors.blue[700],
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade400))
          ),
          height: 50,
          child: Row(
            children: [
              Icon(icon),
              SizedBox(width: 8.0,),
              Text(
                text,
                style: TextStyle(fontSize: 16.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}