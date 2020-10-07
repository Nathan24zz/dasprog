import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SalesOmzetPage extends StatefulWidget {
  @override
  _SalesSummaryPageState createState() => _SalesSummaryPageState();
}

class _SalesSummaryPageState extends State<SalesOmzetPage> {
  double nMonthly = 42342340;
  double nYearly = 345345340;
  List dataPeriod;

  @override
  void initState() {
    super.initState();
//    _initCheck();
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
//            _card03_Summary(),
            SizedBox(height: 100),
          ],
        ));
  }

  Widget _card1Summary() {
    return Container(
      height: 150,
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
              ),
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

  Widget _card2Summary() {
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
}
