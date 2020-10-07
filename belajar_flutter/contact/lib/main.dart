import 'package:flutter/material.dart';
import 'package:contact/container_contact.dart';
import 'package:contact/contact.dart';
import 'package:contact/add_edit_contact.dart';


void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: Home(),
));

List<Contact> widgets = [
    Contact(text: 'Nathanael', number: '081357454556', count: 0),
    Contact(text: 'Jerry', number: '027494058312', count: 1),
    Contact(text: 'John', number: '087856127402', count: 2),
];

List<Contact> items = List<Contact>();
// untuk menandai setiap kontak pada list widgets,
// supaya wkt kontak di search dan dilakukan pengeditan tdk mengalami error 
int counter = 2;

class Home extends StatefulWidget {
  String name, number;
  int index;
  bool delete;
 
  Home({this.name, this.number, this.index, this.delete});
  @override
  _HomeState createState() => _HomeState(name: name, number: number, index: index, delete: delete);
}

class _HomeState extends State<Home> {

  String name, number;
  int index;
  bool delete;  
  
  _HomeState({this.name, this.number, this.index, this.delete}); 

  void changeInList(){
    if (delete == false){
      // jika kontak baru
      if (name!=null && number!=null && index==null ) {
        print('tambah kontak');
        counter++;
        widgets.add(Contact(text: name, number: number, count: counter));
      }
      // jika kontak sudah ada
      else if(name!=null && number!=null && index!=null ) {
        print('ganti kontak');
        widgets[index].text = name;
        widgets[index].number = number;
      }
    }
    // jika kontak yg sdh ada dihapus
    else if (delete == true){
      int x;
      print('dihapus');
      widgets.removeAt(index);
      counter--;
      // deklarasi ulang setiap penanda pada kontak
      for (x=0; x<=counter; x++){
        widgets[x].count = x;
      }
    }
    print(counter);
  }

  @override
    void initState(){
      print('awal');
      super.initState();
      changeInList();
      setState(() {
        items.clear();
        items.addAll(widgets);
      });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Contact',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepOrange, Colors.orangeAccent], 
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orangeAccent,
        onPressed: () {
          Navigator.push(context, 
            MaterialPageRoute(builder: (context) => EditContact(name: null, number: null)));
        },
        child: Icon(Icons.add),
      ),
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
                    items = widgets.where((widget) {
                      var name = widget.text.toLowerCase();
                      return name.contains(value);
                    }).toList();
                  });
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 14.0),
                  hintText: 'Search Contact',
                  suffixIcon: Icon(Icons.search),
                  border: InputBorder.none
                ),
              ),
            ),
            SizedBox(height: 5.0,),
            Expanded(
              child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return new ContainerContact(text:items[index].text, 
                  number:items[index].number, 
                  index: items[index].count,);
              }
            ),
            ),
          ],
        ),
      ),
    );
  }
}



