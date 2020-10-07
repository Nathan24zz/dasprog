import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rexion/10_home.dart';
import 'package:rexion/11_home_drawer.dart';
import 'package:rexion/17_login.dart';
import 'package:rexion/12_function.dart' as rxFunction;
import 'package:rexion/90_attendance/901_attendance_period.dart';

class AttendancePage extends StatefulWidget {
  @override
  _AttendancePageState createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance'),
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
                      'Attendance' + '\n' + 'Period',
                      () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        AttendancePeriodPage()))
                          }),
                  CategoryCard(Icons.settings, 'Attendance' + '\n' + 'Yearly',
                      () => {Navigator.pop(context)}),
                  CategoryCard(
                      Icons.settings,
                      'Calendar',
                      () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        AttendancePeriodPage()))
                          }),
                  CategoryCard(Icons.settings, 'Annual Leave',
                      () => {Navigator.pop(context)}),
                  CategoryCard(Icons.settings, 'Sick Leave',
                      () => {Navigator.pop(context)}),
                  CategoryCard(Icons.settings, 'Leave Request',
                      () => {Navigator.pop(context)}),
                  CategoryCard(Icons.settings, 'Business Trip',
                      () => {Navigator.pop(context)}),
                  CategoryCard(Icons.settings, 'Medical Claim',
                      () => {Navigator.pop(context)}),
                  CategoryCard(Icons.settings, 'Activity',
                      () => {Navigator.pop(context)}),
                  CategoryCard(
                      Icons.settings,
                      'Salary' + '\n' + 'Slip',
                      () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        AttendancePeriodPage()))
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
