import 'package:flutter/material.dart';

class FancyButton extends StatelessWidget {
  final GestureTapCallback onPress;
  FancyButton({this.onPress});

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 3,
      child: RawMaterialButton(
        shape: const StadiumBorder(),
        fillColor: Colors.deepOrange,
        splashColor: Colors.orange,
        onPressed: onPress,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(
                Icons.add_circle,
                color: Colors.amber,
              ),
              SizedBox(
                width: 5.0,
              ),
              Text(
                'ADD LEVEL',
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
