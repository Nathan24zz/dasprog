import 'package:flutter/material.dart';
import 'package:ninja_id/button.dart';

void main() => runApp(MaterialApp(
  home: NinjaCard()
));

class NinjaCard extends StatefulWidget {
  @override
  _NinjaCardState createState() => _NinjaCardState();
}

class _NinjaCardState extends State<NinjaCard> {

  int ninjaLevel = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Ninja ID Card'),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
      ),
      floatingActionButton: FancyButton(
        onPress: () {
          setState(() {
            ninjaLevel += 1;
          });}
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/thumb.jpg'),
                radius: 40.0,
              ),
            ),
            Divider(
              height: 60.0,
              color: Colors.grey[800],
            ),
            Text(
              'NAME',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0
              ),
            ),
            SizedBox(height: 10.0,),
            Text(
              'Nathanael',
              style: TextStyle(
                color: Colors.amber[200],
                letterSpacing: 2.0,
                fontWeight: FontWeight.bold,
                fontSize: 28.0
              ),
            ),
            SizedBox(height: 30.0,),
            Text(
              'CURRENT NINJA LEVEL',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0
              ),
            ),
            SizedBox(height: 10.0,),
            Text(
              '$ninjaLevel',
              style: TextStyle(
                color: Colors.amber[200],
                letterSpacing: 2.0,
                fontWeight: FontWeight.bold,
                fontSize: 28.0
              ),
            ),
            SizedBox(height: 30.0,),
            Row(
              children: [
                Icon(
                  Icons.email,
                  color: Colors.grey[400],
                ),
                SizedBox(width: 10.0,),
                Text(
                  'nathanterbaik@gmail.com',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 18.0,
                    letterSpacing: 1.0
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}


