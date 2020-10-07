import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:intl/intl.dart';
import 'package:rexion/12_function.dart' as rxFunction;
import 'package:http/http.dart' as http;
import 'dart:convert';

class AttendancePeriodDailyPage extends StatefulWidget {
  @override
  _AttendancePeriodDailyPageState createState() =>
      _AttendancePeriodDailyPageState();
}

class _AttendancePeriodDailyPageState extends State<AttendancePeriodDailyPage> {
  String cEmployeeCode = '';
  String cUserName = '';
  String cCompanyCode = '';
  List dataJSON;
  List dataPeriod;
  bool isLoading = false;

  int nCounter;
  int nMaxCounter;

  void _incrementCounter() {
    setState(() {
      if (nCounter >= nMaxCounter) {
        nCounter = nMaxCounter;
      } else {
        nCounter++;
      }
      _initCheck();
    });
  }

  void _decrementCounter() {
    setState(() {
      if (nCounter != 0) {
        nCounter--;
      } else {
        nCounter = 0;
      }
      _initCheck();
    });
  }

  @override
  void initState() {
    super.initState();
    _initPeriod();
    _initCheck();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: isLoading
          ? CircularProgressIndicator()
          : StaggeredGridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              children: <Widget>[
                _card1Summary(),
                _card2Summary(),
              ],
              staggeredTiles: [
                StaggeredTile.extent(2, 60.0),
                StaggeredTile.extent(2, 400.0),
              ],
            ),
    ));
  }

  Widget _card1Summary() {
    return Container(
        child: Card(
      color: Colors.green[100],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.navigate_before),
                color: Colors.lightBlue[700],
                onPressed: _decrementCounter,
              ),
              Spacer(flex: 1),
              Text(
                dataPeriod[nCounter]['name'],
                style: Theme.of(context).textTheme.headline6,
              ),
              Spacer(flex: 1),
              IconButton(
                icon: Icon(Icons.navigate_next),
                color: Colors.lightBlue[700],
                onPressed: _incrementCounter,
              ),
              Spacer(flex: 2),
            ],
          )),
    ));
  }

  Widget _card2Summary() {
    return Container(
        child: Card(
            color: Colors.green[100],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
                padding: EdgeInsets.fromLTRB(10, 5, 20, 5),
                child: ListView.builder(
                  itemCount: dataPeriod == null ? 0 : dataJSON.length,
                  itemBuilder: (BuildContext context, int index) => Container(
                      child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Row(children: <Widget>[
                        Column(
                          children: [
                            Text(
                              dataJSON[index]['dayofweek'],
                              style: new TextStyle(fontSize: 12.0),
                            ),
                            Text(
                              dataJSON[index]['trndate'].substring(8),
                              style: new TextStyle(fontSize: 20.0),
                            ),
                            Text(
                              dataJSON[index]['months'],
                              style: new TextStyle(fontSize: 20.0),
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          children: [
                            Text(
                              'check-in' + dataJSON[index]['default_in'],
                              style: new TextStyle(fontSize: 12.0),
                            ),
                            Text(
                              dataJSON[index]['default_in'],
                              style: new TextStyle(fontSize: 12.0),
                            ),
                            Text(
                              dataJSON[index]['time_in'],
                              style: new TextStyle(fontSize: 20.0),
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          children: [
                            Text(
                              'check-out' + dataJSON[index]['default_out'],
                              style: new TextStyle(fontSize: 12.0),
                            ),
                            Text(
                              dataJSON[index]['default_out'],
                              style: new TextStyle(fontSize: 12.0),
                            ),
                            Text(
                              dataJSON[index]['time_out'],
                              style: new TextStyle(fontSize: 20.0),
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          children: [
                            Text(
                              dataJSON[index]['descr'],
                              style: new TextStyle(fontSize: 12.0),
                            ),
                          ],
                        ),
                      ]),
                    ),
                  )),
                ))));
  }

  Future _initPeriod() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      cCompanyCode = prefs.getString('company_code');
      cEmployeeCode = prefs.getString('employee_code');
    });

    var response = await http.post(
        Uri.encodeFull(rxFunction.RexString.restapi_employee +
            'get_period_monthly' +
            '?db=' +
            cCompanyCode),
        headers: {"Accept": "'application/json"});

    if (response.statusCode == 200) {
      setState(() {
        dataPeriod = jsonDecode(response.body);
        nMaxCounter = dataPeriod.length - 1;
        nCounter = nMaxCounter;
      });
    }
  }

  Future _initCheck() async {
    setState(() => isLoading = true);
    await Future.delayed(Duration(seconds: 2));

    var response = await http.post(
        Uri.encodeFull(rxFunction.RexString.restapi_employee +
            'get_trnattendance_daily' +
            '?db=' +
            cCompanyCode +
            '&employee_code=' +
            cEmployeeCode +
            '&fromdate=' +
            '2018-01-01' +
            '&todate=' +
            '2018-05-05'),
        headers: {"Accept": "'application/json"});

    if (response.statusCode == 200) {
      setState(() {
        dataJSON = jsonDecode(response.body);
      });
    }
    setState(() => isLoading = false);
  }
}
