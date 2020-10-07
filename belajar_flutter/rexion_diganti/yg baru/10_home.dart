import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:rexion/17_login.dart';
import 'package:rexion/11_home_drawer.dart';
import 'package:rexion/12_function.dart' as rxFunction;

class HomePage extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  double nMonthly = 12310412;
  double nYearly = 122132330;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
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
      body: StaggeredGridView.count(
        crossAxisCount: 2,
//        crossAxisSpacing: 12.0,
//        mainAxisSpacing: 12.0,
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 100.0),

        children: <Widget>[
          _card1Summary(),
          _card2Summary(),
          _card3Summary(),
          _card4Summary(),
          _card5Summary(),
          _card1Summary(),
          _card1Summary(),
          _card1Summary(),
          _card1Summary(),
          _card1Summary(),
          _card1Summary(),
        ],
        staggeredTiles: [
          StaggeredTile.extent(2, 150.0),
          StaggeredTile.extent(1, 250.0),
          StaggeredTile.extent(1, 250.0),
          StaggeredTile.extent(2, 400.0),
          StaggeredTile.extent(2, 400.0),
          StaggeredTile.extent(1, 150.0),
          StaggeredTile.extent(1, 150.0),
        ],
      ),
    );
  }

  Widget _card1Summary() {
    return Container(
      child: Card(
          color: Colors.amber,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
              ),
              Text(
                "Berisi Summary To Do, Approval, Message",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ],
          )),
    );
  }

  Widget _card2Summary() {
    return Container(
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
              ),
              Text(
                "Summary Absensi bulan ini, dan bulan lalu",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              Text(
                "Ambil dari Group Absensi",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ],
          )),
    );
  }

  Widget _card3Summary() {
    return Container(
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
              ),
              Text(
                "Tombol Check IN",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              Text(
                "Tombol Check OUT",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ],
          )),
    );
  }

  Widget _card4Summary() {
    return Container(
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
              ),
              Text(
                "Company News",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              Text(
                "ada tombol SEE MORE",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ],
          )),
    );
  }

  Widget _card5Summary() {
    return Container(
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
              ),
              Text(
                "Unit News / Dept News",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              Text(
                "ada tombol SEE MORE",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ],
          )),
    );
  }

  void _homePage() async {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  void _logoutPage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('strdate_login', 'aa');
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }
}
