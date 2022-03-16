import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Constants {
  // Colours
  /// Light pink
  static const Color lightPrimary = Color(0xFFFFC9C9);
  /// Medium pink
  static const Color mediumPrimary = Color(0xffec8686);
  /// Dark pink
  static const Color darkPrimary = Color(0xFFFF8585);
  /// Light teal
  static const Color lightSecondary = Color(0xFFB5ECE6);
  /// Dark teal
  static const Color darkSecondary = Color(0xFF61D2C6);
  /// Golden yellow
  static const Color highlight = Color(0xFFFFCF3E);
  /// Grey subtitle
  static const Color subtitleColor = Color(0xFF525252);

  /// Spouse Color Codes
  static const Color pinkSpouse = Color(0xFFFFADAD);
  static const Color blueSpouse = Color(0xFF92DFD8);

  /// Button red
  static const Color buttonRed = Color(0xFFFF8585);
  /// Button green
  static const Color buttonGreen = Color(0xFF95E28E);

  /// Material color
  static Map<int, Color> materialSwatchMap = {
    50: Color.fromRGBO(lightPrimary.red, lightPrimary.green, lightPrimary.blue, 0.05),
    100: Color.fromRGBO(lightPrimary.red, lightPrimary.green, lightPrimary.blue, 0.1),
    200: Color.fromRGBO(lightPrimary.red, lightPrimary.green, lightPrimary.blue, 0.2),
    300: Color.fromRGBO(lightPrimary.red, lightPrimary.green, lightPrimary.blue, 0.3),
    400: Color.fromRGBO(lightPrimary.red, lightPrimary.green, lightPrimary.blue, 0.4),
    500: Color.fromRGBO(lightPrimary.red, lightPrimary.green, lightPrimary.blue, 0.5),
    600: Color.fromRGBO(lightPrimary.red, lightPrimary.green, lightPrimary.blue, 0.6),
    700: Color.fromRGBO(lightPrimary.red, lightPrimary.green, lightPrimary.blue, 0.7),
    800: Color.fromRGBO(lightPrimary.red, lightPrimary.green, lightPrimary.blue, 0.8),
    900: Color.fromRGBO(lightPrimary.red, lightPrimary.green, lightPrimary.blue, 0.9),
  };
  static MaterialColor appMaterialSwatch = MaterialColor(lightPrimary.value, materialSwatchMap);

  // Styles
  /// AppBar title TextStyle
  static const appBarStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black);
  /// Card header TextStyle
  static const cardHeaderStyle = TextStyle(fontSize: 23, fontWeight: FontWeight.w700, color: Colors.black);
  /// Card content TextStyle
  static const cardContentStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.normal, color: Colors.black);
  /// Card detail greyed TextStyle
  static const detailStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black);
  /// Card detail greyed TextStyle
  static const detailGreyedStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.grey);
  /// Dialog content TextStyle
  static const dialogContentStyle = TextStyle(fontSize: 23, fontWeight: FontWeight.normal, color: Colors.black);
  /// Chip selected TextStyle
  static const chipSelectedStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white);
  /// Chip unselected TextStyle
  static const chipUnselectedStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: darkSecondary);
  /// List item title TextStyle
  static const listTitleStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black);
  /// List item subtitle TextStyle
  static const listSubtitleStyle = TextStyle(fontSize: 13, fontWeight: FontWeight.normal, color: subtitleColor);
  /// Title TextStyle
  static const title = TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0);

  /// Budget Expense TextStyle
  static const budgetExpense = TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0, color: darkSecondary);
  ///List item task price textStyle
  static const taskPrice = TextStyle(fontWeight: FontWeight.bold, fontSize: 23.0, color: Colors.black);
  /// Button red TextStyle
  static const buttonRedStyle = TextStyle(fontFamily: 'Roboto', fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white);
  /// Button white TextStyle
  static const buttonWhiteStyle = TextStyle(fontFamily: 'Roboto', fontSize: 18, fontWeight: FontWeight.bold, color: buttonRed);
}