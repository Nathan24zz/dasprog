import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rexion/10_home.dart';
import 'package:rexion/11_home_drawer.dart';
import 'package:rexion/17_login.dart';
import 'package:rexion/12_function.dart' as rxFunction;
import 'package:rexion/95_personal/951_personal_profile.dart';
import 'package:rexion/95_personal/952_personal_changepassword.dart';
import 'package:rexion/95_personal/955_personal_calendar.dart';
import 'package:rexion/95_personal/953_personal_notes.dart';

class PersonalPage extends StatefulWidget {
  @override
  _PersonalPageState createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal'),
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
                childAspectRatio: 1.00,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                padding: EdgeInsets.all(10),
                children: <Widget>[
                  CategoryCard(
                      Icons.home,
                      'Profile',
                      () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        PersonalProfilePage()))
                          }),
                  CategoryCard(
                      Icons.settings, 'To Do', () => {Navigator.pop(context)}),
                  CategoryCard(
                      Icons.settings, 'To Do', () => {Navigator.pop(context)}),
                  CategoryCard(
                      Icons.settings, 
                      'Notes', 
                      () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        PersonalNotesPage()))
                          }),
                  CategoryCard(
                      Icons.settings,
                      'Calendar',
                      () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        PersonalCalendarPage()))
                          }),
                  CategoryCard(Icons.settings, 'Discussion',
                      () => {Navigator.pop(context)}),
                  CategoryCard(
                      Icons.settings,
                      'Change' + '\n' + 'Password',
                      () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        PersonalChangePasswordPage()))
                          }),
                  CategoryCard(Icons.settings, 'Login Log',
                      () => {Navigator.pop(context)}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

/*
  Widget _headerMenu() {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 5.0,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.lightBlue[200], Colors.lightBlue[500]],
            ),
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100))),
        child: Column(children: <Widget>[
          Align(
              alignment: Alignment.center,
              child: Image.asset('images/icon.png', width: 120, height: 120))
        ]));
  }
*/

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
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
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
