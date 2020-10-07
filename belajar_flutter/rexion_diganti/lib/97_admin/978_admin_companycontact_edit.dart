import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rexion/12_function.dart' as rxFunction;
import 'package:rexion/97_admin/978_admin_companycontact.dart';

class AdminCompanyContactEditPage extends StatefulWidget {
  String id, name, phone;
  // int index;

  AdminCompanyContactEditPage({this.id, this.name, this.phone});

  @override
  _AdminCompanyContactEditPageState createState() =>
      _AdminCompanyContactEditPageState();
}

class _AdminCompanyContactEditPageState
    extends State<AdminCompanyContactEditPage> {
// 1. Definisi Variable
  String cID;
  bool isAddNew = false;
  bool phoneCorrectness = false;
  final _formKey = GlobalKey<FormState>();

  TextEditingController entryName = TextEditingController();
  TextEditingController entryPhone = TextEditingController();

// 3. Widget Utama (entry, button, listview lebih baik dipisah jadi widget)
  @override
  Widget build(BuildContext context) {
    if (widget.name == null && widget.phone == null) {
      entryName = TextEditingController();
      entryPhone = TextEditingController();
      isAddNew = true;
    } else {
      cID = widget.id;
      entryName = TextEditingController(text: widget.name);
      entryPhone = TextEditingController(text: widget.phone);

      // supaya kontak bisa di-delete
      phoneCorrectness = true;
    }

    return Scaffold(
// 3.1. AppBar & ActionButton
        appBar: AppBar(
          title: Text("Company Contact"),
          backgroundColor: rxFunction.RexColors.AppBar,
        ),
// 3.2. Body
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
                      _entryName(),
                      _entryPhone(),
                      SizedBox(height: 50),
                      Row(children: <Widget>[
                        Container(
                          child: _buttonDelete(),
                        ),
                        Spacer(),
                        Container(
                          child: _buttonSave(),
                        ),
                      ]),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )));
  }

// 4. Widget Entry Nama
  Widget _entryName() {
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
              controller: entryName,
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Invalid Name...';
                }
                return null;
              },
              decoration: InputDecoration(
                  labelText: 'Name',
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

// 4. Widget Entry Phone
  Widget _entryPhone() {
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
              controller: entryPhone,
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Invalid Phone...';
                }
                return null;
              },
              decoration: InputDecoration(
                  labelText: 'Phone',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  prefixIcon: Icon(
                    Icons.phone,
                    color: rxFunction.RexColors.Icon,
                    size: 25,
                  ),
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

// 4. Widget Button Delete
  Widget _buttonDelete() {
    return InkWell(
        onTap: () {
          // jika mau menghapus kontak baru
          if (isAddNew == true) {
            return _showErrorDialog(context, 'Invalid Data !!!');
          }
          // jika mau menghapus kontak lama
          else if (isAddNew == false) {
            return _showDeletePermission(
                context, 'Your contact will be deleted');
          }
        },
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.0, 0, 0, 0),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
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
              'Delete',
              style: TextStyle(
                  fontSize: 20, color: rxFunction.RexColors.ButtonText),
            ),
          ),
        ));
  }

// 4. Widget Button Save
  Widget _buttonSave() {
    return InkWell(
        onTap: () {
          if (_formKey.currentState.validate()) {
            _clickSave();
          }
        },
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 20.0, 0),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
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

// 4. Widget Click Delete
  void _clickDelete() async {
    String cCompanyCode;
    String cUserName;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      cCompanyCode = prefs.getString('company_code');
      cUserName = prefs.getString('username');
    });

    var response = await http.delete(
        Uri.encodeFull(rxFunction.RexString.restapi_company +
            'delete_companycontact' +
            '?db=' +
            cCompanyCode +
            '&username=' +
            cUserName +
            '&id=' +
            cID),
        headers: {"Accept": "'application/json"});

    if (response.statusCode != 200) {
      return _showErrorDialog(context, 'Network Error !!!');
    } else {
      Navigator.pop(context, true);
    }

//    Navigator.pushReplacement(context,
//        MaterialPageRoute(builder: (context) => AdminCompanyContactPage()));
  }

// 4. Widget Click Save
  void _clickSave() async {
    String cCompanyCode;
    String cUserName;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      cCompanyCode = prefs.getString('company_code');
      cUserName = prefs.getString('username');
    });

    var response;
    // jika kontak baru
    if (isAddNew == true) {
      response = await http.post(
          Uri.encodeFull(rxFunction.RexString.restapi_company +
              'save_companycontact' +
              '?db=' +
              cCompanyCode +
              '&username=' +
              cUserName +
              '&name=' +
              entryName.text +
              '&phone=' +
              entryPhone.text),
          headers: {"Accept": "'application/json"});
    }
    // jika kontak yg sudah ada
    else if (isAddNew == false) {
      response = await http.put(
          Uri.encodeFull(rxFunction.RexString.restapi_company +
              'update_companycontact' +
              '?db=' +
              cCompanyCode +
              '&username=' +
              cUserName +
              '&id=' +
              cID +
              '&name=' +
              entryName.text +
              '&phone=' +
              entryPhone.text),
          headers: {"Accept": "'application/json"});
    }

    if (response.statusCode != 200) {
      return _showErrorDialog(context, 'Network Error !!!');
    } else {
      Navigator.pop(context, true);
    }
  }

// 5. Widget Message
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

  // 5. Widget Message
  Future _showDeletePermission(BuildContext context, _message) {
    return showDialog(
      builder: (context) {
        return AlertDialog(
            title: Text('Warning'),
            content: Text(_message),
            actions: <Widget>[
              FlatButton(
                child: Text('OK'),
                // jika ditekan maka kontak akan dihapus
                onPressed: () {
                  Navigator.of(context).pop();
                  _clickDelete();
                },
              ),
              FlatButton(
                child: Text('Cancel'),
                // jika ditekan maka kontak tidak jadi dihapus
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ]);
      },
      context: context,
    );
  }
}
