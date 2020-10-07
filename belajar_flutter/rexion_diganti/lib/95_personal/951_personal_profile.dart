import 'package:flutter/material.dart';
import 'package:rexion/12_function.dart' as rxFunction;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PersonalProfilePage extends StatefulWidget {
  @override
  _PersonalProfilePageState createState() => _PersonalProfilePageState();
}

class _PersonalProfilePageState extends State<PersonalProfilePage> {
  String cEmployeeImage = '';
  String cEmployeeCode = '';
  String cUserName = '';
  String cCompanyCode = '';
  List dataJSON;

  @override
  void initState() {
    super.initState();
    _initCheck();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
          backgroundColor: rxFunction.RexColors.AppBar,
        ),
        body: Container(
            color: Colors.grey[300],
            child: Form(
              child: ListView(
                children: <Widget>[
                  Container(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(height: 10),
                          _listProfile1(),
                          SizedBox(height: 10),
                          _listProfile2(),
                          SizedBox(height: 10),
                          _listProfile3(),
                          SizedBox(height: 10),
                          _listProfile4(),
                          SizedBox(height: 10),
                          _listProfile5(),
                          SizedBox(height: 10),
                          _listProfile6(),
                          SizedBox(height: 10),
                          _listProfile7(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }

  Widget _listProfile1() {
    return Container(
      child: Column(children: <Widget>[
        CircleAvatar(
          radius: 100,
          backgroundImage: NetworkImage(cEmployeeImage),
        ),
      ]),
    );
  }

  Widget _listProfile2() {
    return Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: EdgeInsets.all(10),
        child: Column(children: <Widget>[
          Row(
            children: <Widget>[
              SizedBox(height: 10, width: 20),
              Container(
                  child: Text('Personal',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25))),
              SizedBox(height: 40),
            ],
          ),
          _buildDivider(),
          _buildList('Name', dataJSON[0]['name'], false),
          _buildList('ID', dataJSON[0]['code'], false),
          _buildList('Birth Date', dataJSON[0]['birth_date'], false),
          _buildList('Birth Place', dataJSON[0]['birth place'], false),
          _buildList('Religion', dataJSON[0]['religion_code'], false),
        ]));
  }

  Widget _listProfile3() {
    return Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: EdgeInsets.all(10),
        child: Column(children: <Widget>[
          Row(
            children: <Widget>[
              SizedBox(height: 10, width: 20),
              Container(
                  child: Text('Company',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25))),
              SizedBox(height: 40),
            ],
          ),
          _buildDivider(),
          _buildList('divison', dataJSON[0]['division_code'], false),
          _buildList('location', dataJSON[0]['location_code'], false),
          _buildList('position', dataJSON[0]['position_code'], false),
          _buildList('status', dataJSON[0]['status_code'], false),
          _buildList('join date', dataJSON[0]['join_date'], false),
        ]));
  }

  Widget _listProfile4() {
    return Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: EdgeInsets.all(10),
        child: Column(children: <Widget>[
          Row(
            children: <Widget>[
              SizedBox(height: 10, width: 20),
              Container(
                  child: Text('Contact',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25))),
              SizedBox(height: 40),
            ],
          ),
          _buildDivider(),
          _buildList('Phone', '', true),
          _buildList('Email', '', true),
        ]));
  }

  Widget _listProfile5() {
    return Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: EdgeInsets.all(10),
        child: Column(children: <Widget>[
          Row(
            children: <Widget>[
              SizedBox(height: 10, width: 20),
              Container(
                  child: Text('Identity',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25))),
              SizedBox(height: 40),
            ],
          ),
          _buildDivider(),
          _buildList('No', '', true),
          _buildList('Address', '', true),
          _buildList('City', '', true),
        ]));
  }

  Widget _listProfile6() {
    return Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: EdgeInsets.all(10),
        child: Column(children: <Widget>[
          Row(
            children: <Widget>[
              SizedBox(height: 10, width: 20),
              Container(
                  child: Text('Bank',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25))),
              SizedBox(height: 40),
            ],
          ),
          _buildDivider(),
          _buildList('Bank', dataJSON[0]['bank_name'], false),
          _buildList('Account', dataJSON[0]['bank_norek'], false),
          _buildList('Name', dataJSON[0]['bank_namerek'], false),
        ]));
  }

  Widget _listProfile7() {
    return Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: EdgeInsets.all(10),
        child: Column(children: <Widget>[
          Row(
            children: <Widget>[
              SizedBox(height: 10, width: 20),
              Container(
                  child: Text('Tax',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25))),
              SizedBox(height: 40),
            ],
          ),
          _buildDivider(),
          _buildList('No', dataJSON[0]['tax_no'], false),
          _buildList('Status', dataJSON[0]['tax_code'], false),
        ]));
  }

  Future _initCheck() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      cCompanyCode = prefs.getString('company_code');
      cUserName = prefs.getString('username');
      cEmployeeCode = prefs.getString('employee_code');
      cEmployeeImage = prefs.getString('employee_image');
    });

    print(cCompanyCode);
    print(cEmployeeImage);

    var response = await http.post(
        Uri.encodeFull(rxFunction.RexString.restapi_employee +
            'get_employee_code' +
            '?db=' +
            cCompanyCode +
            '&code=' +
            cEmployeeCode),
        headers: {"Accept": "'application/json"});

    if (response.statusCode == 200) {
      setState(() {
        dataJSON = jsonDecode(response.body);
      });
    }
  }

  Container _buildDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 5.0,
      ),
      width: double.infinity,
      height: 3.0,
      color: Colors.grey.shade400,
    );
  }

  Widget _buildList(cHeader, cName, isChange) {
    var ChangeIcons = Icons.chevron_right;
    if (cName == null) {
      cName = '';
    }

    if (isChange) {
      ChangeIcons = Icons.chevron_right;
    } else {
      ChangeIcons = Icons.done;
    }

    return Column(children: <Widget>[
      Row(children: [
        SizedBox(width: 20),
        Container(
            child: Text(cHeader,
                style: TextStyle(color: Colors.black, fontSize: 15))),
        Spacer(),
        Container(
            child: Text(cName,
                style: TextStyle(color: Colors.blue[900], fontSize: 15))),
        Icon(ChangeIcons),
        SizedBox(width: 20),
      ]),
      Container(
        margin: const EdgeInsets.symmetric(
          vertical: 5.0,
          horizontal: 5.0,
        ),
        width: double.infinity,
        height: 1.0,
        color: Colors.grey.shade200,
      )
    ]);
  }
}
