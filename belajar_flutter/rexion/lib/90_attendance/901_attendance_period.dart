import 'package:flutter/material.dart';
import 'package:rexion/12_function.dart' as rxFunction;
import 'package:rexion/90_attendance/9011_attendance_period_daily.dart'
    as daily;

class AttendancePeriodPage extends StatefulWidget {
  @override
  _AttendancePeriodPageState createState() => _AttendancePeriodPageState();
}

class _AttendancePeriodPageState extends State<AttendancePeriodPage>
    with SingleTickerProviderStateMixin {
// 222
  TabController controller;

// 333
  @override
  void initState() {
    controller = new TabController(vsync: this, length: 4);
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
      controller: controller,
      //source code lanjutan
      tabs: <Widget>[
        new Tab(
          icon: new Icon(Icons.email),
          text: "Daily",
        ),
        new Tab(
          icon: new Icon(Icons.queue_music),
          text: "Absent",
        ),
        new Tab(
          icon: new Icon(Icons.shopping_cart),
          text: "Summary",
        ),
        new Tab(
          icon: new Icon(Icons.phone_android),
          text: "Detail",
        ),
      ],
    );

// 444222
    return new Scaffold(
      appBar: AppBar(
        title: Text('Attendance'),
        backgroundColor: rxFunction.RexColors.AppBar,
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(myTabBar.preferredSize.height),
            child: Container(color: Colors.lightBlue[800], child: myTabBar)),
      ),
      body: new TabBarView(controller: controller, children: <Widget>[
        new daily.AttendancePeriodDailyPage(),
        new daily.AttendancePeriodDailyPage(),
        new daily.AttendancePeriodDailyPage(),
        new daily.AttendancePeriodDailyPage(),
//        new omzet.SalesOmzetPage(),
//        new receivable.SalesReceivablePage(),
//        new payable.SalesPayablePage(),
//        new summary.SalesSummaryPage(),
      ]),
    );
  }
}
