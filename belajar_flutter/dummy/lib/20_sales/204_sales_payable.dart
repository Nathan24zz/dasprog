import 'package:flutter/material.dart';

class SalesPayablePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(height: 25),
        _buildProgrammCard(),
        SizedBox(height: 25),
        _buildProgrammCard(),
        SizedBox(height: 25),
      ],
    );
  }

  Widget _buildProgrammCard() {
    return Container(
      height: 250,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 5,
        margin: EdgeInsets.all(10),
      ),
    );
  }
}
