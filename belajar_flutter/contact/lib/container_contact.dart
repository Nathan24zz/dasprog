import 'package:flutter/material.dart';
import 'package:contact/add_edit_contact.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class ContainerContact extends StatelessWidget {
  final String text;
  final String number;
  final int index;
  String subNumber;

  ContainerContact({this.text, this.number, this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, 
          MaterialPageRoute(builder: (context) => EditContact(name: text, number: number, index: index,)));
      },
      child: Container(
        margin: EdgeInsets.only(top: 5.0, left: 8.0, right: 8.0),
        padding: EdgeInsets.symmetric(horizontal:5.0),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.shade400))
        ),
        height: 45,
        child: Row(
          children: [
            Container(
              width: 35.0,
              child: IconButton(
                iconSize: 20.0,
                icon: Icon(Icons.phone),
                onPressed: () {launch('tel:$number');},
              ),
            ),
            SizedBox(width: 5.0,),
            Container(
              width: 35.0,
              child: IconButton(  
                iconSize: 18.0,
                icon: Icon(FontAwesomeIcons.whatsapp),
                onPressed: () {
                  if(number[0]!='+'){
                    subNumber = '+62' + number.substring(1, number.length);
                    launch('https://api.whatsapp.com/send?phone=$subNumber');
                  }
                  else if (number[0]=='+'){
                    launch('https://api.whatsapp.com/send?phone=$number');
                  }
                },
              ),
            ),
            SizedBox(width: 15.0,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 8.0,),
                Text(number)
              ],
            ),
            Spacer(flex:1),
            Icon(Icons.chevron_right)
          ],
        ),
      ),
    );
  }
}