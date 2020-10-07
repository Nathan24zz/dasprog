import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rexion/12_function.dart' as rxFunction;

class AdminDepartmentEditPage extends StatefulWidget {
  String id, code;
  // int index;

  AdminDepartmentEditPage({this.id, this.code});

  @override
  _AdminDepartmentEditPageState createState() =>
      _AdminDepartmentEditPageState();
}

class _AdminDepartmentEditPageState
    extends State<AdminDepartmentEditPage> {
// 1. Definisi Variable
  String cID;
  bool isAddNew = false;
  bool phoneCorrectness = false;
  final _formKey = GlobalKey<FormState>();

  TextEditingController entryCode = TextEditingController();

// 3. Widget Utama (entry, button, listview lebih baik dipisah jadi widget)
  @override
  Widget build(BuildContext context) {
    if (widget.code == null) {
      entryCode = TextEditingController();
      isAddNew = true;
    } else {
      cID = widget.id;
      entryCode = TextEditingController(text: widget.code);

      // supaya department bisa di-delete
      phoneCorrectness = true;
    }

    return Scaffold(
// 3.1. AppBar & ActionButton
        appBar: AppBar(
          title: Text("Department"),
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
                      _entryCode(),
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

// 4. Widget Entry Code
  Widget _entryCode() {
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
              controller: entryCode,
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Invalid Code...';
                }
                return null;
              },
              decoration: InputDecoration(
                  labelText: 'Code',
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

// 4. Widget Button Delete
  Widget _buttonDelete() {
    return InkWell(
        onTap: () {
          // jika mau menghapus department baru
          if (isAddNew == true) {
            return _showErrorDialog(context, 'Invalid Data !!!');
          }
          // jika mau menghapus department lama
          else if (isAddNew == false) {
            return _showDeletePermission(
                context, 'Your department will be deleted');
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
            'delete_department' +
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
    // jika department baru
    if (isAddNew == true) {
      response = await http.post(
          Uri.encodeFull(rxFunction.RexString.restapi_company +
              'save_department' +
              '?db=' +
              cCompanyCode +
              '&username=' +
              cUserName +
              '&code='+
              entryCode.text.toUpperCase()),
          headers: {"Accept": "'application/json"});
    }
    // jika department yg sudah ada
    else if (isAddNew == false) {
      response = await http.put(
          Uri.encodeFull(rxFunction.RexString.restapi_company +
              'update_department' +
              '?db=' +
              cCompanyCode +
              '&username=' +
              cUserName +
              '&id=' +
              cID +
              '&code='+
              entryCode.text.toUpperCase()),
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
                // jika ditekan maka department akan dihapus
                onPressed: () {
                  Navigator.of(context).pop();
                  _clickDelete();
                },
              ),
              FlatButton(
                child: Text('Cancel'),
                // jika ditekan maka department tidak jadi dihapus
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
