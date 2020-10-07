import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rexion/12_function.dart' as rxFunction;
// import 'package:rexion/97_admin/978_admin_companycontact.dart';

class PersonalNotesEditPage extends StatefulWidget {
  String id, header, descr;
  Color backcolor;
  // int index;

  PersonalNotesEditPage({this.id, this.header, this.descr, this.backcolor});

  @override
  _PersonalNotesEditPageState createState() => _PersonalNotesEditPageState();
}

class _PersonalNotesEditPageState extends State<PersonalNotesEditPage> {
// 1. Definisi Variable
  String cID, tempHeader, tempDescr, sColor;
  bool isAddNew = false;
  bool changeColor = false;
  final _formKey = GlobalKey<FormState>();

  List colors = [
    [Colors.red[50], 'red'],
    [Colors.orange[50], 'orange'],
    [Colors.amber[50], 'amber'],
    [Colors.green[50], 'green'],
    [Colors.teal[50], 'teal'],
    [Colors.blue[50], 'blue'],
    [Colors.indigo[50], 'indigo'],
    [Colors.purple[50], 'purple'],
    [Colors.blueGrey[50], 'bluegrey'],
    [Colors.brown[50], 'brown'], 
  ];

  TextEditingController entryHeader = TextEditingController();
  TextEditingController entryDescr = TextEditingController();

// 2. Mengisi Text Field (isi _initCheck ada di bawah)
  @override
  void initState() {
    super.initState();
    _initCheck();
  }

// 3. Widget Utama (entry, button, listview lebih baik dipisah jadi widget)
  @override
  Widget build(BuildContext context) {
    _changeColorToString();
    // supaya saat pilih warna, apa yg sudah ditulis di entry header
    // dan entry descr tidak hilang
    if(changeColor ==  true){
      entryHeader = TextEditingController(text: tempHeader);
      entryDescr = TextEditingController(text: tempDescr);
      
      changeColor = false;
    }

    return Scaffold(
// 3.1. AppBar & ActionButton
        appBar: AppBar(
          title: Text("Edit Notes"),
          backgroundColor: rxFunction.RexColors.AppBar,
          actions: <Widget>[
            PopupMenuButton<List> (
              onSelected: _choiceAction,
              icon: Icon(Icons.color_lens),
              itemBuilder: (BuildContext context){
                return colors.map((color){
                  // print(color[0]);
                  return PopupMenuItem<List>(
                    value: color,
                    child: Container(
                      color: color[0],
                      height: 40,       
                    )
                  );
                }).toList();
              }
            )
          ],
        ),
// 3.2. Body
        body: Container(
            color: widget.backcolor,
            child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Container(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 30),
                      _entryHeader(),
                      _entryDescr(),
                      SizedBox(height: 25),
                      Row(children: <Widget>[
                        Container(
                          child: _buttonDelete(),
                        ),
                        Spacer(),
                        Container(
                          child: _buttonSave(),
                        ),
                      ]),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )));
  }

// 4. Widget Entry Header
  Widget _entryHeader() {
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
              controller: entryHeader,
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Invalid Header...';
                }
                return null;
              },
              decoration: InputDecoration(
                  labelText: 'Header',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  prefixIcon: Icon(
                    Icons.title,
                    color: rxFunction.RexColors.Icon,
                    size: 25,
                  ),
                  fillColor: widget.backcolor,
                  filled: true))
        ],
      ),
    );
  }

// 4. Widget Entry Description
  Widget _entryDescr() {
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
              controller: entryDescr,
              keyboardType: TextInputType.multiline,
              minLines: 12,
              maxLines: 12,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Invalid Description...';
                }
                return null;
              },
              decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  prefixIcon: Icon(
                    Icons.description,
                    color: rxFunction.RexColors.Icon,
                    size: 25,
                  ),
                  fillColor: widget.backcolor,
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
                context, 'Your note will be deleted');
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
            'delete_notes' +
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
    // jika kontak baru
    if (isAddNew == true) {
      response = await http.post(
          Uri.encodeFull(rxFunction.RexString.restapi_company +
              'save_notes' +
              '?db=' +
              cCompanyCode +
              '&username=' +
              cUserName +
              '&header=' +
              entryHeader.text +
              '&descr=' +
              entryDescr.text +
              '&backcolor=' +
              sColor),
          headers: {"Accept": "'application/json"});
    }
    // jika kontak yg sudah ada
    else if (isAddNew == false) {
      response = await http.put(
          Uri.encodeFull(rxFunction.RexString.restapi_company +
              'update_notes' +
              '?db=' +
              cCompanyCode +
              '&username=' +
              cUserName +
              '&id=' +
              cID +
              '&header=' +
              entryHeader.text +
              '&descr=' +
              entryDescr.text +
              '&backcolor=' +
              sColor),
          headers: {"Accept": "'application/json"});
    }

    if (response.statusCode != 200) {
      return _showErrorDialog(context, 'Network Error !!!');
    } else {
      Navigator.pop(context, true);
    }
  }

// 4. Widget Choice Color
  void _choiceAction(List color){
    setState(() {
      tempHeader = entryHeader.text;
      tempDescr = entryDescr.text;
      sColor = color[1];
      widget.backcolor = color[0];
      changeColor = true;
    });
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

// 5. Widget InitCheck
  Future _initCheck() async {
    if (widget.header == null && widget.descr == null) {
        entryHeader = TextEditingController();
        entryDescr = TextEditingController();
        isAddNew = true;
      } 
      else {
        cID = widget.id;
        entryHeader = TextEditingController(text: widget.header);
        entryDescr = TextEditingController(text: widget.descr); 
      }
  }

// Untuk mengganti warna dari type color jadi string
  void _changeColorToString(){
    if (widget.backcolor == Colors.red[50]){
      sColor = 'red';
    }
    else if (widget.backcolor == Colors.orange[50]){
      sColor = 'orange';
    }
    else if (widget.backcolor == Colors.amber[50]){
      sColor = 'amber';
    }
    else if (widget.backcolor == Colors.green[50]){
      sColor = 'green';
    }
    else if (widget.backcolor == Colors.teal[50]){
      sColor = 'teal';
    }
    else if (widget.backcolor == Colors.blue[50]){
      sColor = 'blue';
    }
    else if (widget.backcolor == Colors.indigo[50]){
      sColor = 'indigo';
    }
    else if (widget.backcolor == Colors.purple[50]){
      sColor = 'purple';
    }
    else if (widget.backcolor == Colors.blueGrey[50]){
      sColor = 'bluegrey';
    }
    else if (widget.backcolor == Colors.brown[50]){
      sColor = 'brown';
    }
  }
}
