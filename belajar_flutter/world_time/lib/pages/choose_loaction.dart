import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  // void getData() async {
  //   // simulate network request for a username 
  //   String username = await Future.delayed(Duration(seconds: 3), () {
  //     return 'nathan';
  //   });

  //   // simulate netork request to get bio of the username
  //   String bio = await Future.delayed(Duration(seconds: 2), () {
  //     return 'vegan, musician & egg collector';
  //   });

  //   print('$username - $bio');
  // }

  // // int counter = 0;

  // @override
  // void initState() {
  //   super.initState();
  //   // print('initState function run');
  //   getData();
  //   print('Hey there!');
  // }

  @override
  Widget build(BuildContext context) {
    // print('buildState function run');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      // body: RaisedButton(
      //   onPressed: () {
      //     setState(() {
      //       counter += 1;
      //     });
      //   },
      //   child: Text('counter is $counter'),
      // ),
    );
  }
}