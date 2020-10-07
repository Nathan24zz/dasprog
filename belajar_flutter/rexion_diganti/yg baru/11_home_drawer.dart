import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rexion/20_sales/20_salesomzet.dart';
import 'package:rexion/90_attendance/90_attendance.dart';
import 'package:rexion/95_personal/95_personal.dart';
import 'package:rexion/97_admin/97_admin.dart';
import 'dart:convert';

class HomeDrawer extends StatefulWidget {
  @override
  _HomeDrawerState createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  String cEmployeeImage = '';
  String cEmployeeName = '';
  String cEmployeePosition = '';
  List dataJSON;

  @override
  void initState() {
    super.initState();
    _initCheck();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(cEmployeeName,
                style: TextStyle(color: Colors.white, fontSize: 15.0)),
            accountEmail: Text(cEmployeePosition,
                style: TextStyle(color: Colors.white, fontSize: 12.0)),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Theme.of(context).accentColor,
              backgroundImage: NetworkImage(cEmployeeImage),
            ),
          ),
          Container(
            height: double.maxFinite,
            child: ListView.builder(
                itemCount: dataJSON == null ? 0 : dataJSON.length,
                itemBuilder: (BuildContext context, int index) {
                  if (dataJSON[index]['mainmenu_code'] == 'F20') {
                    return new CustomListTile(
                        Icons.notifications,
                        dataJSON[index]['mainmenu_name'],
                        () => {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SalesOmzetPage()))
                            });
                  }

                  if (dataJSON[index]['mainmenu_code'] == 'F25') {
                    return new CustomListTile(
                        Icons.settings,
                        dataJSON[index]['mainmenu_name'],
                        () => {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PersonalPage()))
                            });
                  }

                  if (dataJSON[index]['mainmenu_code'] == 'M40') {
                    return new CustomListTile(
                        Icons.settings,
                        dataJSON[index]['mainmenu_name'],
                        () => {Navigator.pop(context)});
                  }

                  if (dataJSON[index]['mainmenu_code'] == 'M4M') {
                    return new CustomListTile(
                        Icons.settings,
                        dataJSON[index]['mainmenu_name'],
                        () => {Navigator.pop(context)});
                  }

                  if (dataJSON[index]['mainmenu_code'] == 'M50') {
                    return new CustomListTile(
                        Icons.settings,
                        dataJSON[index]['mainmenu_name'],
                        () => {Navigator.pop(context)});
                  }

                  if (dataJSON[index]['mainmenu_code'] == 'MH0') {
                    return new CustomListTile(
                        Icons.settings,
                        dataJSON[index]['mainmenu_name'],
                        () => {Navigator.pop(context)});
                  }

                  if (dataJSON[index]['mainmenu_code'] == 'MN0') {
                    return new CustomListTile(
                        Icons.settings,
                        dataJSON[index]['mainmenu_name'],
                        () => {Navigator.pop(context)});
                  }

                  if (dataJSON[index]['mainmenu_code'] == 'MP0') {
                    return new CustomListTile(
                        Icons.settings,
                        dataJSON[index]['mainmenu_name'],
                        () => {Navigator.pop(context)});
                  }

                  if (dataJSON[index]['mainmenu_code'] == 'F90') {
                    return new CustomListTile(
                        Icons.settings,
                        dataJSON[index]['mainmenu_name'],
                        () => {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AttendancePage()))
                            });
                  }

                  if (dataJSON[index]['mainmenu_code'] == 'F95') {
                    return new CustomListTile(
                        Icons.settings,
                        dataJSON[index]['mainmenu_name'],
                        () => {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PersonalPage()))
                            });
                  }

                  if (dataJSON[index]['mainmenu_code'] == 'F97') {
                    return new CustomListTile(
                        Icons.settings,
                        dataJSON[index]['mainmenu_name'],
                        () => {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AdminPage()))
                            });
                  }
                }),
          ),
        ],
      ),
    );
  }

  Future _initCheck() async {
    String cCompanyCode;
    String cUserName;

    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      cCompanyCode = prefs.getString('company_code');
      cUserName = prefs.getString('username');
      cEmployeeName = prefs.getString('employee_name');
      cEmployeeImage = prefs.getString('employee_image');
      cEmployeePosition = prefs.getString('employee_position');
    });

    var response = await http.post(
        Uri.encodeFull(
            'https://rexion.my.id/apps/index.php/restapi_username/get_user_mainmenu' +
                '?db=' +
                cCompanyCode +
                '&username=' +
                cUserName),
        headers: {"Accept": "'application/json"});

    if (response.statusCode == 200) {
      setState(() {
        dataJSON = jsonDecode(response.body);
      });
    }
  }
}

class CustomListTile extends StatelessWidget {
  IconData icon;
  String text;
  Function onTap;

  CustomListTile(this.icon, this.text, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: Container(
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey.shade400))),
          child: InkWell(
              splashColor: Colors.orangeAccent,
              onTap: onTap,
              child: Container(
                  height: 50,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(icon),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                text,
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ),
                          ],
                        ),
                        Icon(Icons.arrow_right)
                      ])))),
    );
  }
}
