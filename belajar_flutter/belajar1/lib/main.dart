import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Home(),
));


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('my first app'),
        ),
        backgroundColor: Colors.red[800], 
      ),
      // 1. BELAJAR TEXT :
      // body: Center(
      //   child: Text(
      //     'hello guys',
      //     style: TextStyle(
      //         fontSize: 20.0,
      //         fontWeight: FontWeight.bold,
      //         letterSpacing: 2.0,
      //         color: Colors.red[100],
      //         fontFamily: 'IndieFLower',
      //       ),
      //   ),
      // ),


      // 2. BELAJAR IMAGE :
      // body: 
      // Image(
      //   // image: NetworkImage('https://images.unsplash.com/photo-1531306728370-e2ebd9d7bb99?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80'),
      //   image: AssetImage('assets/space-2.jpg'),
      // ),
      // Atau juga bisa kita lakukan dengan cara :
      // Center(
      //   // child: Image.network('https://images.unsplash.com/photo-1531306728370-e2ebd9d7bb99?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80'),
      //   child: Image.asset('assets/space-1.jpg'),
      // ),


      // 3. BELAJAR BUTTON & ICON
      // body: Center(
      //   child: 
        // Icon(
        //   Icons.airport_shuttle,
        //   color: Colors.lightBlue,
        //   size: 50.0,
        // ),

        // FlatButton(
        //   onPressed: () {
        //     print('you click me');
        //   },
        //   child: Text('click me'),
        //   color: Colors.lightBlue,
        // )

        // RaisedButton.icon(
        //   onPressed: () {},
        //   icon: Icon(Icons.mail),
        //   label: Text('mail me'),
        //   color: Colors.amber,
        // )

        // IconButton(
        //   onPressed: () {print('you click me');},
        //   icon: Icon(Icons.alternate_email),
        //   color: Colors.amber,
        // )
      // ),


      // 4. BELAJAR CONTAINERS & PADDING :
      // Beda Container dgn Padding : Padding tdk ada 'margin' dan 'color', Container ada
      // body: 
      // Container(
      //   // padding: EdgeInsets.fromLTRB(10.0, 20.0, 30.0, 40.0),
      //   padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
      //   margin: EdgeInsets.all(30.0),
      //   color: Colors.grey[400],
      //   child: Text('Hello'),
      // ),

      // Padding(
      //   padding: EdgeInsets.all(30.0),
      //   child: Text('Hello'),
      // ),


      // 5. BELAJAR ROWS :
      // body: Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     Text('Hello, world'),
      //     FlatButton(
      //       onPressed: () {},
      //       color: Colors.amber,
      //       child: Text('click me'),
      //     ),
      //     Container(
      //       color: Colors.cyan,
      //       padding: EdgeInsets.all(30.0),
      //       child: Text('inside'),
      //     )
      //   ],
      // ),


      // 6. BELAJAR COLUMNS :
      // body: Column(
      //   mainAxisAlignment: MainAxisAlignment.end,
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.end,
      //       children: [
      //         Container(
      //           padding: EdgeInsets.all(20.0),
      //           color: Colors.redAccent,
      //           child: Text('minus'),
      //         ),
      //         Container(
      //           padding: EdgeInsets.all(30.0),
      //           color: Colors.lightGreen,
      //           child: Text('zero'),
      //         ),
      //       ],
      //     ),
      //     Container(
      //       padding: EdgeInsets.all(30.0),
      //       color: Colors.pinkAccent,
      //       child: Text('two'),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.all(16.0),
      //       child: Container(
      //         padding: EdgeInsets.all(40.0),
      //         color: Colors.amber,
      //         child: Text('three'),
      //       ),
      //     ),
      //     Container(
      //       padding: EdgeInsets.all(20.0),
      //       color: Colors.cyan,
      //       child: Text('one'),
      //     )
      //   ],
      // ),


      // 7. BELAJAR EXPANDED WIDGETS :
      body: Row(
        children: [
          Expanded(
            flex: 3,
            child: Image.asset('assets/space-1.jpg')
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(30.0),
              color: Colors.cyan,
              child: Text('1'),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(30.0),
              color: Colors.pinkAccent,
              child: Text('2'),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(30.0),
              color: Colors.amber,
              child: Text('3'),
            ),
          ),
        ],
      ),

      
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text('click'),
        backgroundColor: Colors.red[300], 
      ),
    );
  }
}

