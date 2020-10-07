import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:rexion/20_sales/2021_sales_omzet_period.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SalesOmzetPage extends StatefulWidget {
  @override
  _SalesOmzetPageState createState() => _SalesOmzetPageState();
}

class _SalesOmzetPageState extends State<SalesOmzetPage> {
  int tempYear = DateTime.now().year;
  DateTime dateTimeFrom, dateTimeTo;
  CalendarController _controller = CalendarController();

  String cCompanyCode = '';
  String cCompany = 'ALL';

  bool isLoading = false;
  List unitCompany;
  
  @override
  void initState() {
    super.initState();
    dateTimeFrom = DateTime.utc(tempYear, 01, 01);
    dateTimeTo = DateTime.now();
    // cYear = tempYear.toString();
    _initCheck();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: Center(
      child: isLoading
          ? CircularProgressIndicator() 
          : StaggeredGridView.count(
              crossAxisCount: 12,
              crossAxisSpacing: 12.0,
              mainAxisSpacing: 12.0,
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
              children: <Widget>[
                _card1Summary(),
                _card2Summary(),
                _card3Summary(),
                _card4Summary(),
                _card5Summary(),
                _card6Summary(),
                _card7Summary(),
                _card8Summary(),
                _card9Summary(),
                _card10Summary(),
              ],
              staggeredTiles: [
                StaggeredTile.extent(12, 100.0),
                StaggeredTile.extent(4, 85.0),
                StaggeredTile.extent(4, 85.0),
                StaggeredTile.extent(4, 85.0),
                StaggeredTile.extent(4, 85.0),
                StaggeredTile.extent(4, 85.0),
                StaggeredTile.extent(4, 85.0),
                StaggeredTile.extent(4, 85.0),
                StaggeredTile.extent(4, 85.0),
                StaggeredTile.extent(4, 85.0),
                StaggeredTile.extent(4, 85.0),
                StaggeredTile.extent(4, 85.0),
                StaggeredTile.extent(4, 85.0),
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
              padding: const EdgeInsets.all(10.0),
              child: Row(
                // mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    padding: EdgeInsets.zero,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "From ",
                          // textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.black, fontSize: 12),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          dateTimeFrom.toString().substring(0,10),
                          // textAlign: TextAlign.right,
                          style: TextStyle(
                              color: Colors.blue[900], fontSize: 15),
                        ),
                      ],
                    ),
                    onPressed: () {
                      showCalendarFrom(context);
                    },
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  RaisedButton(
                    padding: EdgeInsets.zero,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "To ",
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.black, fontSize: 12),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          dateTimeTo.toString().substring(0,10),
                          textAlign: TextAlign.right,
                          style:
                              TextStyle(color: Colors.blue[900], fontSize: 15),
                        ),
                      ],
                    ),
                    onPressed: () {
                      showCalendarTo(context);
                    },
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  RaisedButton(
                    padding: EdgeInsets.zero,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
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
                          style:
                              TextStyle(color: Colors.blue[900], fontSize: 25),
                        ),
                      ],
                    ),
                    onPressed: () {
                      showUnitCompany(context);
                    },
                  ),
                ],
              ),
            )));
  }

  Widget _card2Summary() {
    return Container(
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: CategoryCard(
              Icons.settings,
              'Period',
              (() => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SalesOmzetPeriodPage(
                              dateTimeFrom: dateTimeFrom.toString().substring(0,10),
                              dateTimeTo: dateTimeTo.toString().substring(0,10),
                              cCompany: cCompany,
                            )))
                  }),
            )));
  }

  Widget _card3Summary() {
    return Container(
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: CategoryCard(
                Icons.settings, 'Unit', () => {Navigator.pop(context)})));
  }

  Widget _card4Summary() {
    return Container(
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: CategoryCard(
                Icons.settings, 'Salesman', () => {Navigator.pop(context)})));
  }

  Widget _card5Summary() {
    return Container(
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: CategoryCard(
                Icons.settings, 'Customer', () => {Navigator.pop(context)})));
  }

  Widget _card6Summary() {
    return Container(
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: CategoryCard(Icons.settings, 'Customer' + '\n' + 'Group',
                () => {Navigator.pop(context)})));
  }

  Widget _card7Summary() {
    return Container(
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: CategoryCard(Icons.settings, 'Customer' + '\n' + 'Category',
                () => {Navigator.pop(context)})));
  }

  Widget _card8Summary() {
    return Container(
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: CategoryCard(
                Icons.settings, 'Product', () => {Navigator.pop(context)})));
  }

  Widget _card9Summary() {
    return Container(
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: CategoryCard(Icons.settings, 'Product' + '\n' + 'Group',
                () => {Navigator.pop(context)})));
  }

  Widget _card10Summary() {
    return Container(
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: CategoryCard(Icons.settings, 'Product' + '\n' + 'Brand',
                () => {Navigator.pop(context)})));
  }

  // Widget show calendar 
  showCalendarTo(BuildContext context) {
    SimpleDialog dialog = SimpleDialog(
        title: const Text('Choose A Date'),
        children: [
          TableCalendar(
            initialSelectedDay: (dateTimeTo == null) ? DateTime.now() : dateTimeTo,
            calendarController: _controller,
            initialCalendarFormat: CalendarFormat.month,
            headerStyle: HeaderStyle(
              centerHeaderTitle: true,
              formatButtonVisible: false,
            ),
            calendarStyle: CalendarStyle(
              todayColor: Colors.white,
              todayStyle: TextStyle(
                color: Colors.black),
            ),
            startingDayOfWeek: StartingDayOfWeek.monday,
            onDaySelected: (date, event) {
              Navigator.of(context).pop();
              setState(() {
                dateTimeTo = date;
              });
            },
          )
        ],
      );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return dialog;   
      },
    );
  }

  // Widget show calendar 
  showCalendarFrom(BuildContext context) {
    SimpleDialog dialog = SimpleDialog(
        title: const Text('Choose A Date'),
        children: [
          TableCalendar(
            initialSelectedDay: (dateTimeFrom == null) ? DateTime.now() : dateTimeFrom,
            calendarController: _controller,
            initialCalendarFormat: CalendarFormat.month,
            headerStyle: HeaderStyle(
              centerHeaderTitle: true,
              formatButtonVisible: false,
            ),
            calendarStyle: CalendarStyle(
              todayColor: Colors.white,
              todayStyle: TextStyle(
                color: Colors.black),
            ),
            startingDayOfWeek: StartingDayOfWeek.monday,
            onDaySelected: (date, event) {
              Navigator.of(context).pop();
              setState(() {
                dateTimeFrom = date;
              });
            },
          )
        ],
      );

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
            Navigator.of(context).pop();
            setState(() {
              cCompany = value['id'];
            });
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
    setState(() => isLoading = true);

    // List dataJSON;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      cCompanyCode = prefs.getString('company_code');
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
  
}



class CategoryCard extends StatelessWidget {
  IconData cardIcon;
  String cardText;
  Function cardOnTap;

  CategoryCard(
    this.cardIcon,
    this.cardText,
    this.cardOnTap,
  );

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: cardOnTap,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Spacer(),
              Icon(
                cardIcon,
                color: Colors.lightBlueAccent[700],
                size: 25,
              ),
              Spacer(),
              Text(
                cardText,
                style: TextStyle(color: Colors.black, fontSize: 12),
              )
            ],
          ),
        ));
  }
}
