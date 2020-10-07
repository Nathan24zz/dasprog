import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:rexion/12_function.dart' as rxFunction;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rexion/97_admin/978_admin_companycontact_edit.dart';

class AdminCompanyContactPage extends StatefulWidget {
  @override
  _AdminCompanyContactPageState createState() =>
      _AdminCompanyContactPageState();
}

class _AdminCompanyContactPageState extends State<AdminCompanyContactPage> {
// 1. Definisi Variable
  List dataJSON;
  List items=List();

// 2. Ambil Data JSON (isi _initCheck ada di bawah)
  @override
  void initState() {
    super.initState();
    _initCheck();
  }

// 3. Widget Utama (entry, button, listview lebih baik dipisah jadi widget)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
// 3.1. AppBar & ActionButton
        appBar: AppBar(
          title: Text("Company Contact"),
          backgroundColor: rxFunction.RexColors.AppBar,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightBlue[900],
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AdminCompanyContactEditPage(
                        name: null,
                        phone: null))).whenComplete(() => _initCheck());
          },
          child: Icon(Icons.add),
        ),

// 3.2. Body
        body: Container(
          margin: EdgeInsets.all(5.0),
          child: Column(
            children: [
              Material(
                elevation: 8.0,
                borderRadius: BorderRadius.circular(30.0),
                child: TextField(
                  onChanged: (value) {
                    value = value.toLowerCase();
                    setState(() {
                      items = dataJSON.where((widget) {
                        var name = widget['name'].toLowerCase();
                        return name.contains(value);
                      }).toList();
                 });
                  },
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 32.0, vertical: 14.0),
                      hintText: 'Search Contact',
                      suffixIcon: Icon(Icons.search),
                      border: InputBorder.none),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: items == null ? 0 : items.length,
                    itemBuilder: (BuildContext context, int index) =>
                        buildListView(context, index)),
              ),
            ],
          ),
        ));
  }

// 4. Widget ListView
  Widget buildListView(BuildContext context, int index) {
    String cPhone = items[index]['phone'];
    String cSubPhone;

    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AdminCompanyContactEditPage(
                        id: items[index]['id'],
                        name: items[index]['name'],
                        phone: items[index]['phone'],
                        // index: index,
                      ))).whenComplete(() => _initCheck());
        },
        child: Container(
            child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  width: 35.0,
                  child: IconButton(
                    iconSize: 25.0,
                    icon: Icon(Icons.phone),
                    onPressed: () {
                      launch('tel:$cPhone');
                    },
                  ),
                ),
                SizedBox(
                  width: 5.0,
                ),
                Container(
                  width: 35.0,
                  child: IconButton(
                    iconSize: 25.0,
                    icon: Icon(FontAwesomeIcons.whatsapp),
                    onPressed: () {
                      if (cPhone[0] != '+') {
                        cSubPhone = '+62' + cPhone.substring(1, cPhone.length);
                        launch(
                            'https://api.whatsapp.com/send?phone=$cSubPhone');
                      } else if (cPhone[0] == '+') {
                        launch('https://api.whatsapp.com/send?phone=$cPhone');
                      }
                    },
                  ),
                ),
                SizedBox(
                  width: 15.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      items[index]['name']!=null? items[index]['name']:'',
                      style: TextStyle(color: Colors.blue[900], fontSize: 25),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      items[index]['phone']!=null? items[index]['phone']:'',
                      style: TextStyle(color: Colors.teal, fontSize: 18),
                    ),
                  ],
                ),
                Spacer(flex: 1),
                Icon(Icons.chevron_right)
              ],
            ),
          ),
        )));
  }

// 5. Widget InitCheck
  Future _initCheck() async {
    String cCompanyCode;
    String cUserName;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      cCompanyCode = prefs.getString('company_code');
      cUserName = prefs.getString('username');
    });

    var response = await http.get(
        Uri.encodeFull(rxFunction.RexString.restapi_company +
            'get_companycontact' +
            '?db=' +
            cCompanyCode +
            '&username=' +
            cUserName),
        headers: {"Accept": "'application/json"});

    if (response.statusCode == 200) {
      setState(() {
        dataJSON = jsonDecode(response.body);
        
        items.clear();
        items.addAll(dataJSON);
      });
    }   
  }
}
