import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:rexion/12_function.dart' as rxFunction;

class SalesSummaryPage extends StatefulWidget {
  @override
  _SalesSummaryPageState createState() => _SalesSummaryPageState();
}

class _SalesSummaryPageState extends State<SalesSummaryPage> {
  int tempYear = DateTime.now().year;

  String tempMonth = DateTime.now().month.toString();
  String cCompanyCode = '';
  String cYear;
  String cCompany = 'ALL';

  bool isLoading = false;

  double nMonthly = 0;
  double nYearly = 0;
  List dataPeriod;
  List unitCompany;
  List year = [0, 1, 2, 3, 4];

  @override
  void initState() {
    super.initState();
    cYear = tempYear.toString();
    _initCheck();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: isLoading
          ? CircularProgressIndicator()
          : StaggeredGridView.count(
              crossAxisCount: 12,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 12.0,
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              children: <Widget>[
                _card1Summary(),
                _card2Summary(),
                _card3Summary(),
                _card4Summary(),
                _card5Summary(),
                // _card6Summary(),
              ],
              staggeredTiles: [
                StaggeredTile.extent(12, 100.0),
                StaggeredTile.extent(6, 100.0),
                StaggeredTile.extent(6, 100.0),
                StaggeredTile.extent(12, 400.0),
                StaggeredTile.extent(11, 400.0),
                // StaggeredTile.extent(1, 400.0),
              ],
            ),
    ));
  }

  Widget _card1Summary() {
    return Container(
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Row(children: <Widget>[
                SizedBox(
                  width: 20.0,
                ),
                RaisedButton(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                      ),
                      Text(
                        "Year",
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        cYear,
                        textAlign: TextAlign.right,
                        style: TextStyle(color: Colors.blue[900], fontSize: 25),
                      ),
                    ],
                  ),
                  onPressed: () {
                    showYear(context);
                  },
                ),
                SizedBox(
                  width: 20.0,
                ),
                RaisedButton(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                      ),
                      Text(
                        "Company",
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        cCompany,
                        textAlign: TextAlign.right,
                        style: TextStyle(color: Colors.blue[900], fontSize: 25),
                      ),
                    ],
                  ),
                  onPressed: () {
                    showUnitCompany(context);
                  },
                ),
              ]),
            )));
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

  Widget _card4Summary() {
    List<dataGraph> dataList = [];
    double nAmount;
    for (int i = 0; i < dataPeriod.length; i++) {
      nAmount = double.parse(dataPeriod[i]['amount']) / 1000000;
      dataList.add(
          dataGraph(dataPeriod[i]['period'], nAmount, rxFunction.randomColor));
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
                padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                child: ListView.builder(
                  itemCount: dataPeriod == null ? 0 : dataPeriod.length,
                  itemBuilder: (BuildContext context, int index) => Container(
                      child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Row(children: <Widget>[
                        Column(children: <Widget>[
                          Image.asset('assets/year$cYear.png',
                              height: 20, width: 60),
                          Image.asset('assets/month${month(index+1)}.png',
                              height: 20, width: 60),
                        ]),
                        // Text(dataPeriod[index]['period'],
                        //    style: new TextStyle(fontSize: 20.0)),
                        Spacer(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              NumberFormat('#,##0').format(
                                  double.parse(dataPeriod[index]['amount'])),
                              style: new TextStyle(
                                  fontSize: 18.0, color: Colors.blue[900]),
                            ),
                            percentage(index)
                        ]),
                      ]),
                    ),
                  )),
                ))));
  }

  Widget _card6Summary() {
    return Container(
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 5, 20, 5),
            )));
  }

  Widget percentage(int index) {
    if (index == 0) {
      return Text('');
    } 
    else if (index > 0) {
      double lastMonth = double.parse(dataPeriod[index - 1]['amount']);
      double thisMonth = double.parse(dataPeriod[index]['amount']);
      double percentage = (thisMonth - lastMonth) / lastMonth * 100;
      String result = percentage.toStringAsFixed(2);

      if (percentage < 0) {
        return Row(
          children: [
            Icon(Icons.arrow_drop_down, color: Colors.red, size: 30.0,),
            Text(
              '$result%',
              style: TextStyle(color: Colors.red, fontSize: 10.0),
            )
          ],
        );
      }
      else if (percentage >= 0) {
        return Row(
          children: [
            Icon(Icons.arrow_drop_up, color: Colors.green, size: 30.0,),
            Text(
              '+$result%',
              style: TextStyle(color: Colors.green, fontSize: 10.0),
            )
          ],
        );
      }
    }
  }

// Widget show simple dialog of year
  showYear(BuildContext context) {
    SimpleDialog dialog = SimpleDialog(
        title: const Text('Choose Year'),
        children: year.map((value) {
          return new SimpleDialogOption(
            child: Text('${tempYear - value}'),
            onPressed: () {
              cYear = '${tempYear - value}';
              _initCheck();
              Navigator.of(context).pop();
            },
          );
        }).toList());

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return dialog;
      },
    );
  }

// Widget show simple dialog of year
  showUnitCompany(BuildContext context) {
    SimpleDialog dialog = SimpleDialog(
      title: const Text('Choose Unit Company'),
      children: unitCompany.map((value) {
        return new SimpleDialogOption(
          child: Text(value['id']),
          onPressed: () {
            cCompany = value['id'];
            _initCheck();
            Navigator.of(context).pop();
          },
        );
      }).toList(),
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return dialog;
      },
    );
  }

  void _initCheck() async {
    print(cCompany);
    setState(() => isLoading = true);

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
                cCompany +
                '&fromperiod=' +
                cYear +
                '01' +
                '&toperiod=' +
                cYear +
                '12'),
        headers: {"Accept": "'application/json"});

    dataJSON = jsonDecode(response.body);
    if (response.statusCode == 200) {
      setState(() {
        nYearly = double.parse(dataJSON[0]['amount']);
      });
    }

    if (tempMonth.length == 1) {
      tempMonth = '0' + tempMonth;
    }
    var response1 = await http.post(
        Uri.encodeFull(
            'https://rexion.my.id/apps/index.php/restapi_sales/get_summary' +
                '?db=' +
                cCompanyCode +
                '&unitcompany=' +
                cCompany +
                '&fromperiod=' +
                cYear +
                tempMonth +
                '&toperiod=' +
                cYear +
                tempMonth),
        headers: {"Accept": "'application/json"});

    dataJSON = jsonDecode(response1.body);
    if (response1.statusCode == 200) {
      setState(() {
        nMonthly = double.parse(dataJSON[0]['amount']);
      });
    }

    var response2 = await http.post(
        Uri.encodeFull(
            'https://rexion.my.id/apps/index.php/restapi_sales/get_period' +
                '?db=' +
                cCompanyCode +
                '&unitcompany=' +
                cCompany +
                '&fromperiod=' +
                cYear +
                '01' +
                '&toperiod=' +
                cYear +
                '12'),
        headers: {"Accept": "'application/json"});
    setState(() {
      dataPeriod = jsonDecode(response2.body);
    });

    var response3 = await http.post(
        Uri.encodeFull(
            'https://rexion.my.id/apps/index.php/restapi_sales/get_unitcompany' +
                '?db=' +
                cCompanyCode),
        headers: {"Accept": "'application/json"});

    if (response3.statusCode == 200) {
      setState(() {
        unitCompany = jsonDecode(response3.body);
      });
    }

    // untuk menambah 'ALL' pada list
    Map temp = new Map.from(unitCompany[0]);
    temp['id'] = 'ALL';
    temp['code'] = 'ALL';
    temp['name'] = 'ALL';
    unitCompany.insert(0, temp);

    setState(() => isLoading = false);
  }

  String month(int input){
    int index=input;
    if (index < 10){
      return '0'+index.toString();
    }
    else if(index>=10){
      return index.toString();
    }
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
