import 'package:flutter/material.dart';
import 'package:rexion/12_function.dart' as rxFunction;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PersonalChangePasswordPage extends StatefulWidget {
  @override
  _PersonalChangePasswordPageState createState() =>
      _PersonalChangePasswordPageState();
}

class _PersonalChangePasswordPageState
    extends State<PersonalChangePasswordPage> {
  TextEditingController entryOldPassword = TextEditingController();
  TextEditingController entryNewPassword = TextEditingController();
  TextEditingController entryRetypePassword = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  var response;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Change Password"),
          backgroundColor: rxFunction.RexColors.AppBar,
        ),
        body: Container(
            child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Container(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 100),
                      _entryOldPassword(),
                      _entryNewPassword(),
                      _entryRetypePassword(),
                      SizedBox(height: 50),
                      _buttonSave(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )));
  }

  Widget _entryOldPassword() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 5,
          ),
          TextFormField(
              obscureText: true,
              controller: entryOldPassword,
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Invalid Password...';
                }
                return null;
              },
              decoration: InputDecoration(
                  labelText: 'Old Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: rxFunction.RexColors.Icon,
                    size: 25,
                  ),
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

  Widget _entryNewPassword() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 5,
          ),
          TextFormField(
              obscureText: true,
              controller: entryNewPassword,
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Invalid Password...';
                }
                return null;
              },
              decoration: InputDecoration(
                  labelText: 'New Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: rxFunction.RexColors.Icon,
                    size: 25,
                  ),
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

  Widget _entryRetypePassword() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 5,
          ),
          TextFormField(
              obscureText: true,
              controller: entryRetypePassword,
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Invalid Password...';
                }
                return null;
              },
              decoration: InputDecoration(
                  labelText: 'Retype Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: rxFunction.RexColors.Icon,
                    size: 25,
                  ),
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

  Widget _buttonSave() {
    return InkWell(
        onTap: () {
          _clickSave();
        },
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
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
                    colors: [
                      rxFunction.RexColors.ButtonFrom,
                      rxFunction.RexColors.ButtonTo
                    ])),
            child: Text(
              'Save',
              style: TextStyle(
                  fontSize: 20, color: rxFunction.RexColors.ButtonText),
            ),
          ),
        ));
  }

  void _clickSave() async {
    List dataJSON;
/*
    var response = await http.post(
        Uri.encodeFull(
            'https://rexion.my.id/apps/index.php/restapi_system/get_apiserver' +
                '?db=' +
                entryCompanyCode.text),
        headers: {"Accept": "'application/json"});

    if (response.statusCode != 200) {
      return _showErrorDialog(context, 'Invalid Company ID !!!');
    } else {
      var response2 = await http.post(
          Uri.encodeFull(
              'https://rexion.my.id/apps/index.php/restapi_username/get_admin_user' +
                  '?db=' +
                  entryCompanyCode.text.trim() +
                  '&username=' +
                  entryUserName.text.trim()),
          headers: {"Accept": "'application/json"});

      if (response2.statusCode != 200) {
        return _showErrorDialog(context, 'Invalid Username/Password !!!!!');
      } else {
        dataJSON = jsonDecode(response2.body);
        var cResult1 = dataJSON[0]['access'];
        var cResult2 = dataJSON[0]['userpassword'];
        var cResult3 = md5.convert(utf8.encode(entryPassword.text)).toString();

        print(cDeviceID);
        print(cResult1);
        print(cResult2);
        print(cResult3);

        if (cDeviceID != cResult1) {
          return _showErrorDialog(context, 'Invalid Mobile ID !!!');
        } else {
          if (cResult2 != cResult3) {
            return _showErrorDialog(context, 'Invalid Username/Password !!!');
          } else {
            var response3 = await http.post(
                Uri.encodeFull(
                    'https://rexion.my.id/apps/index.php/restapi_username/save_loginlog' +
                        '?db=' +
                        entryCompanyCode.text.trim() +
                        '&username=' +
                        entryUserName.text.trim() +
                        '&mobile_id=' +
                        cDeviceID),
                headers: {"Accept": "'application/json"});
            if (response3.statusCode == 200) {}

            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setString('company_code', entryCompanyCode.text.trim());
            prefs.setString('username', entryUserName.text.trim());

            var response4 = await http.post(
                Uri.encodeFull(
                    'https://rexion.my.id/apps/index.php/restapi_username/get_view_user' +
                        '?db=' +
                        entryCompanyCode.text.trim() +
                        '&username=' +
                        entryUserName.text.trim()),
                headers: {"Accept": "'application/json"});

            if (response4.statusCode == 200) {
              dataJSON = jsonDecode(response4.body);
              prefs.setString('strdate_login', cTrnDate);
              prefs.setString('employee_id', dataJSON[0]['employee_id']);
              prefs.setString('employee_code', dataJSON[0]['employee_code']);
              prefs.setString('employee_name', dataJSON[0]['employee_name']);
              prefs.setString(
                  'employee_position', dataJSON[0]['position_code']);

              var cDirEmployee = 'https://rexion.my.id/apps/company/' +
                  entryCompanyCode.text.substring(0, 3) +
                  '_' +
                  entryCompanyCode.text.substring(4).trim() +
                  '/employee/' +
                  dataJSON[0]['employee_image'];

              prefs.setString('employee_image', cDirEmployee);

              var cDirCompany = 'https://rexion.my.id/apps/rexion_logo/logo_' +
                  entryCompanyCode.text.substring(0, 3) +
                  '_' +
                  entryCompanyCode.text.substring(4).trim() +
                  '.png';
              prefs.setString('company_logo', cDirCompany);
            }

//            Navigator.push(
//                context, MaterialPageRoute(builder: (context) => Home()));
//            Navigator.pushReplacement(
//                context, MaterialPageRoute(builder: (context) => HomePage()));
          }
        }
      }
    }*/
  }

  Future _showErrorDialog(BuildContext context, _message) {
    return showDialog(
      builder: (context) {
        return AlertDialog(
            title: Text('Warning'),
            content: Text(_message),
            actions: <Widget>[
              FlatButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ]);
      },
      context: context,
    );
  }
}
