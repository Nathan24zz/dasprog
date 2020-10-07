import 'package:flutter/material.dart';
import 'package:contact/main.dart';

class EditContact extends StatelessWidget {
  String name, number;
  int index;
  bool newContact = false;
  bool delete = false;

  EditContact({this.name, this.number, this.index});
  
  TextEditingController nameController; 
  TextEditingController numberController;

  @override
  Widget build(BuildContext context) {
    
    // untuk mengetahui apakah menambah kontak baru atau cuma edit kontak 
    if (name==null && number==null){
      nameController = TextEditingController();
      numberController = TextEditingController();
      newContact = true;
    }
    else {
      nameController = TextEditingController(text: name);
      numberController = TextEditingController(text: number);
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.cancel),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          FlatButton(
            onPressed: () {
              // jika kontak baru
              if (newContact == true){
                Navigator.pushAndRemoveUntil(context, 
                MaterialPageRoute(builder: (context) 
                  => Home(name: name, number: number, index: null, delete: delete,))
                  ,(Route<dynamic> route) => false,);
              }
              // jika kontak yang sudah ada
              else {
                Navigator.pushAndRemoveUntil(context, 
                MaterialPageRoute(builder: (context) 
                  => Home(name: name, number: number, index: index, delete: delete,))
                  ,(Route<dynamic> route) => false,);
              }
            },
            child: Text(
              'Save',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          )
        ],
        title: Text('Edit Contact'),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Name : '),
                SizedBox(width: 10.0),
                Expanded(
                  child: TextField(
                    controller: nameController,
                    onChanged: (value) {
                      name = value;
                    },
                ),)
              ],
            ),
            SizedBox(height: 10.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Number : '),
                SizedBox(width: 10.0),
                Expanded(
                  child: TextField(
                    controller: numberController,
                    onChanged: (value) {
                      number = value;
                    },
                  ),
                )
              ],
            ),
            SizedBox(height: 40.0,),
            FlatButton(
              onPressed: () {
                // untuk mengetahui apakah ini kontak baru / lama
                // jika index tdk sama dgn null -> kontak lama
                if (index != null){
                  delete = true;
                  Navigator.pushAndRemoveUntil(context, 
                  MaterialPageRoute(builder: (context) 
                    => Home(name: name, number: number, index: index, delete: delete,))
                    ,(Route<dynamic> route) => false,);
                }
              }, 
              child: Text('Delete'))
          ]
        ),
      )
    );
  }
}