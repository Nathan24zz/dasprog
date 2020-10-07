import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:rexion/17_login.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPasswordPage> {
  String cMobileID;

  TextEditingController entryCompanyCode = TextEditingController();
  TextEditingController entryUserName = TextEditingController();
  TextEditingController entryMobileNo = TextEditingController();
  TextEditingController entryDescription = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initCheck();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
            title: new Text('Forgot Password'),
            backgroundColor: Colors.lightBlue[900],
            leading: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: Icon(Icons.arrow_back),
            )),
        body: new ListView(children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 10),
                  _entryCompanyCode(),
                  SizedBox(height: 5),
                  _entryUserName(),
                  SizedBox(height: 5),
                  _entryMobileNo(),
                  SizedBox(height: 5),
                  _entryDescription(),
                  SizedBox(height: 50),
                  _buttonSave(),
                  SizedBox(height: 100),
                  _entryMobileID(),
                ],
              ),
            ),
          ),
        ]));
  }

  Widget _entryCompanyCode() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: entryCompanyCode,
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value.isEmpty) {
                return 'Invalid Company Code...';
              }
              return null;
            },
            decoration: InputDecoration(
                labelText: 'Company Code*',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                prefixIcon: Icon(
                  Icons.person,
                  size: 40,
                ),
                fillColor: Color(0xfff3f3f4),
                filled: true),
          ),
        ],
      ),
    );
  }

  Widget _entryUserName() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          TextField(
              controller: entryUserName,
              decoration: InputDecoration(
                  labelText: 'UserName*',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  prefixIcon: Icon(
                    Icons.person,
                    size: 40,
                  ),
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

  Widget _entryMobileNo() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          TextField(
              controller: entryMobileNo,
              decoration: InputDecoration(
                  labelText: 'Mobile No',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  prefixIcon: Icon(
                    Icons.person,
                    size: 40,
                  ),
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

  Widget _entryDescription() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          TextField(
              controller: entryDescription,
              decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  prefixIcon: Icon(
                    Icons.person,
                    size: 40,
                  ),
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

  Widget _entryMobileID() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(cMobileID),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Widget _buttonSave() {
    return InkWell(
      onTap: () {
        _clickSave();
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.lightBlue[900], Colors.lightBlue[700]])),
        child: Text(
          'Save',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  void _clickSave() async {
    var response = await http.post(
        Uri.encodeFull(
            'https://rexion.my.id/apps/index.php/restapientryUserName/save_trnforgotpassword' +
                '?db=' +
                entryCompanyCode.text +
                '&username=' +
                entryUserName.text +
                '&mobile_id=' +
                cMobileID +
                '&description=' +
                entryDescription.text +
                '&mobileno=' +
                entryMobileNo.text),
        headers: {"Accept": "'application/json"});
    if (response.statusCode == 200) {}

    return _showInformationDialog(
        context, 'Data Has Been Saved, Wait for Approval...');
  }

  void _initCheck() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getString('mobile_id') != null) {
      setState(() {
        cMobileID = prefs.getString('mobile_id');
      });
    }

    if (prefs.getString('company_code') != null) {
      setState(() {
        entryCompanyCode.text = prefs.getString('company_code');
      });
    }

    if (prefs.getString('username') != null) {
      setState(() {
        entryUserName.text = prefs.getString('username');
      });
    }
  }

  Future _showInformationDialog(BuildContext context, _message) {
    return showDialog(
      builder: (context) {
        return AlertDialog(
            title: Text('Information'),
            content: Text(_message),
            actions: <Widget>[
              FlatButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
              )
            ]);
      },
      context: context,
    );
  }
}
