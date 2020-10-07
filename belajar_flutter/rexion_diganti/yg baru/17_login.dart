import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'package:rexion/10_home.dart';
import 'package:rexion/18_register.dart';
import 'package:rexion/19_forgot_password.dart';
import 'package:intl/intl.dart';
import 'package:rexion/12_function.dart' as rxFunction;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String cDeviceID;

  TextEditingController entryCompanyCode = TextEditingController();
  TextEditingController entryUserName = TextEditingController();
  TextEditingController entryPassword = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  var response;

  @override
  void initState() {
    super.initState();
    _initCheck();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
//                  SizedBox(height: 50),
                  _headerMenu(),
                  SizedBox(height: 20),
                  _entryCompanyCode(),
                  _entryUserName(),
                  _entryPassword(),
                  SizedBox(height: 50),
                  _buttonLogin(),
                  _buttonForgotPassword(),
                  SizedBox(height: 10),
                  _buttonRegister(),
                ],
              ),
            ),
          ),
        ],
      ),
    )));
  }

  Widget _headerMenu() {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 4,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                rxFunction.RexColors.MenuFrom,
                rxFunction.RexColors.MenuTo
              ],
//              colors: [Color(0xE6F4FE), Color(0xFF219BF8)],
            ),
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100))),
        child: Column(children: <Widget>[
          SizedBox(height: 20),
          Align(
              alignment: Alignment.center,
              child:
                  Image.asset('images/rexionone.png', width: 80, height: 80)),
          RichText(
              textAlign: TextAlign.center,
              text: TextSpan(text: '', children: [
                TextSpan(
                  text: 'Rexion',
                  style: TextStyle(
                      color: Colors.blue[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
                TextSpan(
                  text: 'One',
                  style: TextStyle(color: Colors.black, fontSize: 30),
                ),
              ]))
        ]));

    /*
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(text: '', children: [
        TextSpan(
          text: 'Rexion',
          style: TextStyle(
              color: Colors.indigo[900],
              fontWeight: FontWeight.bold,
              fontSize: 30),
        ),
        TextSpan(
          text: 'One',
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
      ]),
    );
*/
  }

  Widget _entryCompanyCode() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: <Widget>[
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
                  labelText: 'Company Code',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  prefixIcon: Icon(
                    Icons.business,
                    color: rxFunction.RexColors.Icon,
                    size: 25,
                  ),
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

  Widget _entryUserName() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
              controller: entryUserName,
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Invalid UserName...';
                }
                return null;
              },
              decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  prefixIcon: Icon(
                    Icons.person,
                    color: rxFunction.RexColors.Icon,
                    size: 25,
                  ),
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

  Widget _entryPassword() {
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
              controller: entryPassword,
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Invalid Password...';
                }
                return null;
              },
              decoration: InputDecoration(
                  labelText: 'Password',
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

  Widget _buttonLogin() {
    return InkWell(
        onTap: () {
          _clickLogin();
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
              'Login',
              style: TextStyle(
                  fontSize: 20, color: rxFunction.RexColors.ButtonText),
            ),
          ),
        ));
  }

  Widget _buttonForgotPassword() {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ForgotPasswordPage()));
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        alignment: Alignment.centerRight,
        child: Text('Forgot Password ?',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
      ),
    );
  }

  Widget _buttonRegister() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => RegisterPage()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Don\'t have an account ?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Register',
              style: TextStyle(
                  color: Color(0xfff79c4f),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  void _clickLogin() async {
    List dataJSON;
    String cTrnDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

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

            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          }
        }
      }
    }
  }

  void _initCheck() async {
    String cCompanyCode;
    String cUserName;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      cDeviceID = prefs.getString('device_id');
      cCompanyCode = prefs.getString('company_code');
      cUserName = prefs.getString('username');
      entryCompanyCode.text = cCompanyCode;
      entryUserName.text = cUserName;
    });
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
