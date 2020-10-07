import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rexion/10_home.dart';
import 'package:rexion/11_home_drawer.dart';
import 'package:rexion/17_login.dart';
import 'package:rexion/20_sales/201_sales_summary.dart' as summary;
import 'package:rexion/20_sales/202_sales_omzet.dart' as omzet;
import 'package:rexion/20_sales/203_sales_receivable.dart' as receivable;
import 'package:rexion/20_sales/204_sales_payable.dart' as payable;
import 'package:rexion/12_function.dart' as rxFunction;

// 111
class SalesOmzetPage extends StatefulWidget {
  @override
  _SalesOmzetState createState() => _SalesOmzetState();
}

class _SalesOmzetState extends State<SalesOmzetPage>
    with SingleTickerProviderStateMixin {
// 222
  TabController controller;

// 333
  @override
  void initState() {
    controller = new TabController(vsync: this, length: 5);
    //tambahkan SingleTickerProviderStateMikin pada class _HomeState
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

// 444
  @override
  Widget build(BuildContext context) {
// 444111
    TabBar myTabBar = TabBar(
      isScrollable: true,
      controller: controller,
      //source code lanjutan
      tabs: <Widget>[
        new Tab(
          icon: new Icon(Icons.email),
          text: "Summary",
        ),
        new Tab(
          icon: new Icon(Icons.queue_music),
          text: "Omzet",
        ),
        new Tab(
          icon: new Icon(Icons.shopping_cart),
          text: "Receivable",
        ),
        new Tab(
          icon: new Icon(Icons.phone_android),
          text: "Payable",
        ),
        new Tab(
          icon: new Icon(Icons.shopping_cart),
          text: "Stock",
        ),
      ],
    );

// 444222
    return new Scaffold(
      appBar: AppBar(
        title: Text('Sales Omzet'),
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
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(myTabBar.preferredSize.height),
            child: Container(color: Colors.lightBlue[800], child: myTabBar)),
      ),
      body: new TabBarView(controller: controller, children: <Widget>[
        new summary.SalesSummaryPage(),
        new omzet.SalesOmzetPage(),
        new receivable.SalesReceivablePage(),
        new payable.SalesPayablePage(),
        new summary.SalesSummaryPage(),
      ]),
      drawer: HomeDrawer(),
    );
  }

// 555
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
