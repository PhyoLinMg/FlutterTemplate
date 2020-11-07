import 'package:flutter/material.dart';

abstract class Languages {
  static Languages of(BuildContext context) {
    return Localizations.of<Languages>(context, Languages);
  }

  String get appName;

  String get labelWelcome;

  String get labelInfo;

  String get labelSelectLanguage;

  String get fruitTitle;

  String get vegetableTitle;

  String get addToCartTitle;

  String get orderTitle;

  String get productsTitle;

  String get cartTitle;

  String get readyToEat;

  String get readyToCook;

  String get juice;

  String get box;

  String get help;
}
