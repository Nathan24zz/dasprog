import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rexion/10_home.dart';
import 'package:rexion/11_home_drawer.dart';
import 'package:rexion/17_login.dart';
import 'package:rexion/12_function.dart' as rxFunction;
import 'package:rexion/97_admin/978_admin_companycontact.dart';
import 'package:rexion/97_admin/973_admin_department.dart';

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin'),
        backgroundColor: rxFunction.RexColors.AppBar,
        actions: <Widget>[
          new IconButton(
            icon: Icon(Icons.home),
            onPressed: _homePage,
          ),
          new IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: _logoutPage,
          )
        ],
      ),
      drawer: HomeDrawer(),
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 100),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                padding: EdgeInsets.all(10),
                children: <Widget>[
                  CategoryCard(
                      Icons.home, 'User', () => {Navigator.pop(context)}),
                  CategoryCard(Icons.settings, 'Role Menu',
                      () => {Navigator.pop(context)}),
                  CategoryCard(Icons.settings, 'Department',
                      () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        AdminDepartmentPage()))
                          }),
                  CategoryCard(Icons.settings, 'Login Log',
                      () => {Navigator.pop(context)}),
                  CategoryCard(
                      Icons.settings,
                      'Company' + '\n' + 'Contact',
                      () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        AdminCompanyContactPage()))
                          }),
                  CategoryCard(Icons.settings, 'Discussion',
                      () => {Navigator.pop(context)}),
                  CategoryCard(Icons.settings, 'Just Info',
                      () => {Navigator.pop(context)}),
                  CategoryCard(Icons.settings, 'Just Info',
                      () => {Navigator.pop(context)}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _homePage() async {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  void _logoutPage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('date_login', 'aa');
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }
}

class CategoryCard extends StatelessWidget {
  IconData cardIcon;
  String cardText;
  Function cardOnTap;

  CategoryCard(
    this.cardIcon,
    this.cardText,
    this.cardOnTap,
  );
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(
//        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 17),
              blurRadius: 17,
              spreadRadius: -23,
              color: Colors.lightBlue,
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: cardOnTap,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Spacer(),
                  Icon(
                    cardIcon,
                    color: Colors.lightBlueAccent[700],
                    size: 25,
                  ),
//                  SvgPicture.asset(svgSrc),
                  Spacer(),
                  Text(
                    cardText,
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
