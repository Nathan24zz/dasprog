import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:dummy/12_function.dart' as rexfunc;

class SalesSummaryPage extends StatefulWidget {
  @override
  _SalesSummaryPageState createState() => _SalesSummaryPageState();
}

class _SalesSummaryPageState extends State<SalesSummaryPage> {
  String cCompanyCode = '';

  double nMonthly = 0;
  double nYearly = 0;
  List dataPeriod;

  @override
  void initState() {
    super.initState();
    _initDefault();
    _initCheck();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey[300],
        child: ListView(
          children: <Widget>[
            SizedBox(height: 10),
            _card1Summary(),
            SizedBox(height: 10),
            _card2Summary(),
            SizedBox(height: 10),
            _card3Summary(),
            SizedBox(height: 100),
          ],
        ));
  }

  // ignore: non_constant_identifier_names
  Widget _card1Summary() {
    return Container(
      height: 150,
      child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Row(children: <Widget>[
                Spacer(
                  flex: 3,
                ),
                Text(
                  "Monthly",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
                Spacer(
                  flex: 10,
                ),
                Text(
                  NumberFormat('#,##0.00').format(nMonthly),
                  textAlign: TextAlign.right,
                  style: TextStyle(color: Colors.blue[900], fontSize: 25),
                ),
                Spacer(
                  flex: 3,
                ),
              ]),
              Row(children: <Widget>[
                Spacer(
                  flex: 3,
                ),
                Text(
                  "Yearly",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
                Spacer(
                  flex: 10,
                ),
                Text(
                  NumberFormat('#,##0.00').format(nYearly),
                  textAlign: TextAlign.right,
                  style: TextStyle(color: Colors.blue[900], fontSize: 25),
                ),
                Spacer(
                  flex: 3,
                ),
              ]),
            ],
          )),
    );
  }

/*
  Widget _card01_Summary() {
    return Container(
      height: 150,
      child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Row(children: <Widget>[
                Spacer(
                  flex: 3,
                ),
                Text(
                  "Monthly",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
                Spacer(
                  flex: 10,
                ),
                Text(
                  NumberFormat('#,##0.00').format(nMonthly),
                  textAlign: TextAlign.right,
                  style: TextStyle(color: Colors.blue[900], fontSize: 25),
                ),
                Spacer(
                  flex: 3,
                ),
              ]),
              Row(children: <Widget>[
                Spacer(
                  flex: 3,
                ),
                Text(
                  "Yearly",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
                Spacer(
                  flex: 10,
                ),
                Text(
                  NumberFormat('#,##0.00').format(nYearly),
                  textAlign: TextAlign.right,
                  style: TextStyle(color: Colors.blue[900], fontSize: 25),
                ),
                Spacer(
                  flex: 3,
                ),
              ]),
            ],
          )),
    );
  }
*/

  Widget _card2Summary() {
    List<Sales> dataList = [];
    double nAmount;
    for (int i = 0; i < dataPeriod.length; i++) {
      nAmount = double.parse(dataPeriod[i]['amount']) / 1000000;
      dataList
          .add(Sales(dataPeriod[i]['period'], nAmount, rexfunc.randomColor));
    }
/*
    var data = [
      Sales("01", 50, rexfunc.randomColor),
      Sales("02", 70, rexfunc.randomColor),
    ];
*/

    var series = [
      charts.Series(
          domainFn: (Sales sales, _) => sales.day,
          measureFn: (Sales sales, _) => sales.sold,
          colorFn: (Sales sales, _) => sales.color,
          id: 'Sales',
          data: dataList,
          labelAccessorFn: (Sales sales, _) => '')
    ];

    var chart = charts.BarChart(
      series,
      barRendererDecorator: charts.BarLabelDecorator<String>(),
      domainAxis: charts.OrdinalAxisSpec(renderSpec: charts.NoneRenderSpec()),
    );

/*
    var chartpie = charts.PieChart(
      series,
      defaultRenderer: charts.ArcRendererConfig(
          arcRendererDecorators: [charts.ArcLabelDecorator()], arcWidth: 100),
      animate: true,
    );
*/

    return Container(
      height: 500,
      child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          margin: EdgeInsets.all(10),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[
                Text(
                  'Hello World',
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(height: 400, child: chart),
              ],
            ),
          )),
    );
  }

  Widget _card3Summary() {
    return Container(
        height: 300,
        child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            margin: EdgeInsets.all(10),
            child: ListView.builder(
              itemCount: dataPeriod == null ? 0 : dataPeriod.length,
              itemBuilder: (BuildContext context, int index) => Container(
                  child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(children: <Widget>[
                    Text(dataPeriod[index]['period'],
                        style: new TextStyle(fontSize: 20.0)),
                    Spacer(),
                    Text(
                      NumberFormat('#,##0.00')
                          .format(double.parse(dataPeriod[index]['amount'])),
                      style: new TextStyle(fontSize: 25.0),
                    ),
                  ]),
                ),
              )),
            )));
  }

  void _initDefault() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      cCompanyCode = prefs.getString('company_code');
    });
  }

  void _initCheck() async {
    List dataJSON;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      cCompanyCode = prefs.getString('company_code');
    });

    var response = await http.post(
        Uri.encodeFull(
            'https://rexion.my.id/apps/index.php/restapi_sales/get_summary' +
                '?db=' +
                cCompanyCode),
        headers: {"Accept": "'application/json"});

    dataJSON = jsonDecode(response.body);
    if (response.statusCode == 200) {
      setState(() {
        nYearly = double.parse(dataJSON[0]['amount']);
        nMonthly = double.parse(dataJSON[0]['amttax']);
      });
    }

    var response2 = await http.post(
        Uri.encodeFull(
            'https://rexion.my.id/apps/index.php/restapi_sales/get_period' +
                '?db=' +
                cCompanyCode),
        headers: {"Accept": "'application/json"});
    setState(() {
      dataPeriod = jsonDecode(response2.body);
    });
  }
}

class Sales {
  final String day;
  final double sold;
  final charts.Color color;

  Sales(this.day, this.sold, Color color)
      : this.color = charts.Color(
            r: color.red, g: color.green, b: color.blue, a: color.alpha);
}
