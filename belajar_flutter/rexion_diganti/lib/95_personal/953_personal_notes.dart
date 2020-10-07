import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'package:rexion/12_function.dart' as rxFunction;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:rexion/95_personal/953_personal_notes_edit.dart';

class PersonalNotesPage extends StatefulWidget {
  @override
  _PersonalNotesPageState createState() =>
      _PersonalNotesPageState();
}

class _PersonalNotesPageState extends State<PersonalNotesPage> {
// 1. Definisi Variable
  List dataJSON;
  List items = List();

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
          title: Text("Notes"),
          backgroundColor: rxFunction.RexColors.AppBar,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightBlue[900],
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PersonalNotesEditPage(
                        header: null,
                        descr: null,
                        backcolor: Colors.red[50]))).whenComplete(() => _initCheck());
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
                            var name = widget['header'].toLowerCase();
                            return name.contains(value);
                          }).toList();
                     });
                  },
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 32.0, vertical: 14.0),
                      hintText: 'Search Note',
                      suffixIcon: Icon(Icons.search),
                      border: InputBorder.none),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5.0,
                        mainAxisSpacing: 5.0,
                    ),
                    itemCount: items == null ? 0 : items.length,
                    itemBuilder: (BuildContext context, int index) =>
                        buildGridView(context, index)),
              ),
            ],
          ),
        ));
  }

// 4. Widget GridView
  Widget buildGridView(BuildContext context, int index) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PersonalNotesEditPage(
                        id: items[index]['id'],
                        header: items[index]['header'],
                        descr: items[index]['descr'],
                        backcolor: items[index]['backcolor'],
                      ))).whenComplete(() => _initCheck());
        },
        child: Container(
            child: Card(
              color: items[index]['backcolor'],
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      items[index]['header'] != null ? items[index]['header'] : '',
                      style: TextStyle(color: Colors.blue[900], fontSize: 25),
                    ),
                    Text(
                      items[index]['descr'] != null
                          ? items[index]['descr']
                          : '',
                      style: TextStyle(color: Colors.teal, fontSize: 18),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Spacer(),
                    Container(
                      height: 1.0,
                      color: Colors.grey.shade400,
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      "Created Date: ${items[index]['create_date']}" ,
                      style: TextStyle(color: Colors.teal, fontSize: 10),
                    )
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
          'get_notes' +
          '?db=' +
          cCompanyCode +
          '&username=' +
          cUserName),
      headers: {"Accept": "'application/json"}
      );

    if (response.statusCode == 200) {
      setState(() {
        dataJSON = jsonDecode(response.body);
        // print(dataJSON);
        _changeStringToColor();
        items.clear();
        items.addAll(dataJSON);
      });
    }   
  }

// Untuk mengganti string warna jadi type color
  void _changeStringToColor(){
    dataJSON.forEach((data) { 
      if (data['backcolor'].toLowerCase() == 'red'){
        data['backcolor'] = Colors.red[50];
      }
      else if (data['backcolor'].toLowerCase() == 'orange'){
        data['backcolor'] = Colors.orange[50];
      }
      else if (data['backcolor'].toLowerCase() == 'amber'){
        data['backcolor'] = Colors.amber[50];
      }
      else if (data['backcolor'].toLowerCase() == 'green'){
        data['backcolor'] = Colors.green[50];
      }
      else if (data['backcolor'].toLowerCase() == 'teal'){
        data['backcolor'] = Colors.teal[50];
      }
      else if (data['backcolor'].toLowerCase() == 'blue'){
        data['backcolor'] = Colors.blue[50];
      }
      else if (data['backcolor'].toLowerCase() == 'indigo'){
        data['backcolor'] = Colors.indigo[50];
      }
      else if (data['backcolor'].toLowerCase() == 'purple'){
        data['backcolor'] = Colors.purple[50];
      }
      else if (data['backcolor'].toLowerCase() == 'bluegrey'){
        data['backcolor'] = Colors.blueGrey[50];
      }
      else if (data['backcolor'].toLowerCase() == 'brown'){
        data['backcolor'] = Colors.brown[50];
      }
    });
  }
}
