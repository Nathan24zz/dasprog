import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dummy/11_home_drawer.dart';
import 'package:dummy/20_sales/201_sales_summary.dart' as summary;
import 'package:dummy/20_sales/202_sales_omzet.dart' as omzet;
import 'package:dummy/20_sales/203_sales_receivable.dart' as receivable;
import 'package:dummy/20_sales/204_sales_payable.dart' as payable;
import 'package:dummy/12_function.dart' as Function;


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
    controller = TabController(vsync: this, length: 5);
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
        Tab(
          icon: Icon(Icons.email),
          text: "Summary",
        ),
        Tab(
          icon: Icon(Icons.queue_music),
          text: "Omzet",
        ),
        Tab(
          icon: Icon(Icons.shopping_cart),
          text: "Receivable",
        ),
        Tab(
          icon: Icon(Icons.phone_android),
          text: "Payable",
        ),
        Tab(
          icon: Icon(Icons.shopping_cart),
          text: "Stock",
        ),
      ],
    );

// 444222
    return Scaffold(
      appBar: AppBar(
        title: Text('Sales Omzet'),
        backgroundColor: Function.RexColors.AppBar,
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(myTabBar.preferredSize.height),
            child: Container(color: Colors.lightBlue[800], child: myTabBar)),
      ),
      body: TabBarView(controller: controller, children: <Widget>[
        summary.SalesSummaryPage(),
        omzet.SalesOmzetPage(),
        receivable.SalesReceivablePage(),
        payable.SalesPayablePage(),
        summary.SalesSummaryPage(),
      ]),
      drawer: HomeDrawer(),
    );
  }
}

