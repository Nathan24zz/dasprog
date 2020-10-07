import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:rexion/12_function.dart' as rxFunction;

class SalesOmzetPeriodPage extends StatefulWidget {
  String dateTimeFrom, dateTimeTo, cCompany;

  SalesOmzetPeriodPage({this.dateTimeFrom, this.dateTimeTo, this.cCompany});
  @override
  _SalesOmzetPeriodPageState createState() => _SalesOmzetPeriodPageState();
}

class _SalesOmzetPeriodPageState extends State<SalesOmzetPeriodPage> {
  String cCompanyCode = '';
  String cYearFrom, cMonthFrom;
  String cYearTo, cMonthTo;
  String cCompany;

  bool isLoading = false;
  // bool changeYear = false;
  // int i=1;

  double nMonthly = 0;
  double nYearly = 0;
  List dataPeriod;

  @override
  void initState() {
    super.initState();
    cCompany = widget.cCompany;
    cYearFrom = widget.dateTimeFrom.substring(0,4);
    cMonthFrom = widget.dateTimeFrom.substring(5,7);
    cYearTo = widget.dateTimeTo.substring(0,4);
    cMonthTo = widget.dateTimeTo.substring(5,7);
    _initCheck();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
// 3.1. AppBar & ActionButton
        appBar: AppBar(
          title: Text("Period"),
          backgroundColor: rxFunction.RexColors.AppBar,
        ),
        backgroundColor: Colors.blueGrey[50],
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
                  ],
                  staggeredTiles: [
                    StaggeredTile.extent(12, 90.0),
                    StaggeredTile.extent(12, 400.0),
                    StaggeredTile.extent(11, 400.0),
                    StaggeredTile.extent(1, 400.0),
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
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
              ),
              Text(
                "Total Sales",
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

  Widget _card2Summary() {
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

  Widget _card3Summary() {
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
                          // ini belum bener, bulan belum bener
                          // jika tahunnya lebih dari satu pasti salah
                          Image.asset('assets/year${year(index)}.png',
                              height: 20, width: 60),
                          Image.asset('assets/month${month(index)}.png',
                              height: 20, width: 60),
                        ]),
//                        Text(dataPeriod[index]['period'],
//                            style: new TextStyle(fontSize: 20.0)),
                        Spacer(),
                        Text(
                          NumberFormat('#,##0').format(
                              double.parse(dataPeriod[index]['amount'])),
                          style: new TextStyle(fontSize: 18.0),
                        ),
                      ]),
                    ),
                  )),
                ))));
  }

  Widget _card4Summary() {
    return Container(
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 5, 20, 5),
            )));
  }


  String year(int index){    
    return dataPeriod[index]['period'].toString().substring(0,4);
  }

  String month(int index) {
    return dataPeriod[index]['period'].toString().substring(4,6);
  }

  // // Cara sebelum tahu ada properti 'period' di dataPeriod :
  // // Syaratnya : Type cYearFrom, cYearTo, cMonthFrom, cMonthTo harus integer
  // int year(int index){    
  //   return cYearFrom;
  // }

  // String month(){
  //   String temp;
    
  //   if (cYearFrom != cYearTo) {
  //     if (changeYear == false){
  //       if(cMonthFrom < 12){
  //         temp = convertMonth(cMonthFrom);
  //         cMonthFrom += 1;
  //         print(temp);
  //         return temp;
  //       }
  //       else if(cMonthFrom == 12){
  //         temp = convertMonth(cMonthFrom);
  //         cYearFrom+=1;
  //         changeYear = true;
  //         print(temp);
  //         return temp;
  //       }
  //       // for (int i=cMonthFrom; i<=12; i++){
  //       //   convertMonth(i);
  //       // }
  //       // cYearFrom+=1;
  //       // changeYear = true;
  //     }
  //     else if (changeYear == true){
  //       if (i < 12){
  //         temp  = convertMonth(i);
  //         i+=1;
  //         print(temp);
  //         return temp;
  //       }
  //       else if(i == 12){
  //         temp = convertMonth(i);
  //         i=1;
  //         cYearFrom += 1;
  //         print(temp);
  //         return temp;
  //       }
  //       // for (int i=1; i<=12; i++){
  //       //   convertMonth(i);
  //       // }
  //       // cYearFrom+=1;
  //     }
  //   }

  //   else if(cYearFrom == cYearTo) {
  //     if (i <= cMonthTo){
  //       temp = convertMonth(i);
  //       i+=1;
  //       print(temp);
  //       return temp;
  //     }
  //     // for (int i=1; i<=cMonthTo; i++){
  //     //   convertMonth(i);
  //     // }
  //   }
  // }

  // // convert month to 2 digit
  // String convertMonth(int input){
  //   int index=input;
  //   if (index < 10){
  //     return '0'+index.toString();
  //   }
  //   else if(index>=10){
  //     return index.toString();
  //   }
  // }

  void _initCheck() async {
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
                cYearFrom +
                cMonthFrom +
                '&toperiod=' +
                cYearTo +
                cMonthTo),
        headers: {"Accept": "'application/json"});

    dataJSON = jsonDecode(response.body);
    if (response.statusCode == 200) {
      setState(() {
        nYearly = double.parse(dataJSON[0]['amount']);
      });
    }

    var response1 = await http.post(
        Uri.encodeFull(
            'https://rexion.my.id/apps/index.php/restapi_sales/get_period' +
                '?db=' +
                cCompanyCode +
                '&unitcompany=' +
                cCompany +
                '&fromperiod=' +
                cYearFrom +
                cMonthFrom +
                '&toperiod=' +
                cYearTo +
                cMonthTo),
        headers: {"Accept": "'application/json"});
    setState(() {
      dataPeriod = jsonDecode(response1.body);
    });

    setState(() => isLoading = false);
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
