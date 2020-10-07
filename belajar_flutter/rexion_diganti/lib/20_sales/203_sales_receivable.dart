import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:intl/intl.dart';
import 'package:rexion/12_function.dart' as function;
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'dart:convert';

class SalesReceivablePage extends StatefulWidget {
  @override
  _SalesReceivablePageState createState() => _SalesReceivablePageState();
}

class _SalesReceivablePageState extends State<SalesReceivablePage> {
  String cCompanyCode = '';

  double nMonthly = 0;
  double nYearly = 0;
  List dataPeriod;

  @override
  void initState() {
    super.initState();
    _initCheck();
  }

  String _valFriends; //Ini untuk menyimpan value data friend
  List _myFriends = [
    "Clara",
    "John",
    "Rizal",
    "Steve",
    "Laurel",
    "Bernard",
    "Miechel"
  ]; //Array My Friend

  Material myItems(IconData icon, String heading, int color) {
    return Material(
        color: Colors.white,
        elevation: 14.0,
        shadowColor: Color(0x802196F3),
        borderRadius: BorderRadius.circular(24.0),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      heading,
                      style: TextStyle(
                        color: new Color(color),
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
                Material(
                  color: new Color(color),
                  borderRadius: BorderRadius.circular(24.0),
                  child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Icon(
                        icon,
                        color: Colors.white,
                        size: 30.0,
                      )),
                )
              ],
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StaggeredGridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
        children: <Widget>[
          _card1Summary(),
          _card2Summary(),
          _card3Summary(),
          _card4Summary(),
          _card5Summary(),
          myItems(Icons.graphic_eq, "TotalViews", 0xffed622d),
          myItems(Icons.graphic_eq, "TotalViews", 0xffed622d),
          myItems(Icons.graphic_eq, "TotalViews", 0xffed622d),
          myItems(Icons.graphic_eq, "TotalViews", 0xffed622d),
//          MyItems(Icons.graphic_eq, "TotalViews", 0xffed622d),
//          MyItems(Icons.graphic_eq, "TotalViews", 0xffed622d),
        ],
        staggeredTiles: [
          StaggeredTile.extent(1, 100.0),
          StaggeredTile.extent(1, 100.0),
          StaggeredTile.extent(2, 100.0),
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
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
              ),
              Text(
                "This Month",
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
              Text(
                NumberFormat('#,##0').format(nMonthly / 1000000) + 'M',
                textAlign: TextAlign.right,
                style: TextStyle(color: Colors.blue[900], fontSize: 25),
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
                "This Year",
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
              Text(
                NumberFormat('#,##0').format(nYearly / 1000000) + 'M',
                textAlign: TextAlign.right,
                style: TextStyle(color: Colors.blue[900], fontSize: 25),
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
        child: DropdownButton(
          isExpanded: true,
          style: TextStyle(fontSize: 20, color: Colors.purple),
          value: _valFriends,
          items: _myFriends.map((value) {
            return DropdownMenuItem(
              child: Text(value),
              value: value,
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              _valFriends = value;
            });
          },
        ),
      ),
    );
  }

  Widget _card4Summary() {
    List<dataGraph> dataList = [];
    double nAmount;
    for (int i = 0; i < dataPeriod.length; i++) {
      nAmount = double.parse(dataPeriod[i]['amount']) / 1000000;
      dataList.add(
          dataGraph(dataPeriod[i]['period'], nAmount, function.randomColor));
    }

    var series = [
      charts.Series(
          domainFn: (dataGraph sales, _) => sales.month,
          measureFn: (dataGraph sales, _) => sales.sales,
          colorFn: (dataGraph sales, _) => sales.color,
          id: 'Sales',
          data: dataList,
          labelAccessorFn: (dataGraph sales, _) => '')
    ];

    var chart = charts.BarChart(
      series,
      barRendererDecorator: charts.BarLabelDecorator<String>(),
      domainAxis: charts.OrdinalAxisSpec(renderSpec: charts.NoneRenderSpec()),
    );

    return Container(
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Text(
                  'Sales Omzet per Period',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 300, child: chart),
              ],
            ),
          )),
    );
  }

  Widget _card5Summary() {
    return Container(
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
                padding: EdgeInsets.fromLTRB(10, 5, 20, 5),
                child: ListView.builder(
                  itemCount: dataPeriod == null ? 0 : dataPeriod.length,
                  itemBuilder: (BuildContext context, int index) => Container(
                      child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Row(children: <Widget>[
                        Text(dataPeriod[index]['period'],
                            style: new TextStyle(fontSize: 20.0)),
                        Spacer(),
                        Text(
                          NumberFormat('#,##0').format(
                              double.parse(dataPeriod[index]['amount'])),
                          style: new TextStyle(fontSize: 22.0),
                        ),
                      ]),
                    ),
                  )),
                ))));
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
                cCompanyCode +
                '&unitcompany=' +
                'ALL' +
                '&fromperiod=' +
                '202001' +
                '&toperiod=' +
                '202012'),
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
                cCompanyCode +
                '&unitcompany=' +
                'ALL' +
                '&fromperiod=' +
                '202001' +
                '&toperiod=' +
                '202012'),
        headers: {"Accept": "'application/json"});
    setState(() {
      dataPeriod = jsonDecode(response2.body);
    });
  }
}

class dataGraph {
  final String month;
  final double sales;
  final charts.Color color;

  dataGraph(this.month, this.sales, Color color)
      : this.color = charts.Color(
            r: color.red, g: color.green, b: color.blue, a: color.alpha);
}
