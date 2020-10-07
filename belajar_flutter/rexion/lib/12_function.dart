import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';

class RexString {
  static const String restapi_server = "https://rexion.my.id/apps/index.php/";
  static const String restapi_sales =
      "https://rexion.my.id/apps/index.php/restapi_sales/";
  static const String restapi_username =
      "https://rexion.my.id/apps/index.php/restapi_username/";
  static const String restapi_company =
      "https://rexion.my.id/apps/index.php/restapi_company/";
  static const String restapi_employee =
      "https://rexion.my.id/apps/index.php/restapi_employee/";
  static const String file_server = "https://rexion.my.id/apps/index.php/";
  static const String app_name = "RexionOne";
  static const String app_title = "PT. Rexion";
}

class RexColors {
  static const AppBar = Color(0xFF0D47A1); // lightBlue[900]
  static const ButtonFrom = Color(0xFF0D47A1); // lightBlue[900]
  static const ButtonTo = Color(0xFF0288D1); //lightBlue[700];
  static const ButtonText = Colors.white;
  static const Icon = Color(0xFF00BCD4); //cyan;
  static const MenuFrom = Color(0xFF29B6F6); //lightBlue[400];
  static const MenuTo = Color(0xFF0288D1); //lightBlue[700];
}

class RexIcons {
  static const IconData icon_app = Icons.android;
  static const IconData icon_home = Icons.home;
}

class RexImages {
  static const String Img_logo = "assets/images/icon.png";
}

class MasterData {
  static testCheck() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var yMobileID = '';
    if (prefs.getString('mobile_id') != null) {
      yMobileID = prefs.getString('mobile_id');
    }
    return yMobileID;
  }
}

Color get randomColor {
  List<Color> colors = [
    Colors.pink,
    Colors.green,
    Colors.lightBlue,
    Colors.purple,
    Colors.red,
    Colors.teal,
    Colors.brown,
    Colors.orange,
    Colors.cyan,
    Colors.grey,
    Colors.amber,
    Colors.blue,
    Colors.yellow,
    Colors.indigo,
    Colors.deepPurple,
    Colors.lime,
    Colors.deepOrange,
    Colors.lightGreen,
  ];
  return colors[Random().nextInt(colors.length)];
}
