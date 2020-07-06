import 'package:flutter/material.dart';

import 'dart:collection';

import 'package:template/utils/color_utils.dart';

class FontSizeUtils {
  static double itemTitleFontSize = 18;
  static double itemSubtitleFontSize = 15;
  static var appText = TextStyle();
  static TextStyle labelTabStyle =
      appText.copyWith(fontSize: 14.0, fontWeight: FontWeight.bold);

  static TextStyle appBarTextStyle = appText.copyWith(
      fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold);

  static TextStyle defaultTextStyle = appText.copyWith(
      fontSize: 13.5, color: Colors.black, fontWeight: FontWeight.normal);
  static TextStyle defaultMediumTextStyle = appText.copyWith(
      fontSize: 18, color: Colors.black, fontWeight: FontWeight.normal);
  static TextStyle defaultXSmallTextStyle = appText.copyWith(
      fontSize: 8, color: Colors.black, fontWeight: FontWeight.normal);
  static TextStyle defaultSmallTextStyle = appText.copyWith(
      fontSize: 11, color: Colors.black, fontWeight: FontWeight.normal);
  static TextStyle defaultLightTextStyle = appText.copyWith(
      fontSize: 13.5, color: Colors.black, fontWeight: FontWeight.normal);
  static TextStyle defaultBoldTextStyle = appText.copyWith(
      fontSize: 14.0, color: Colors.black, fontWeight: FontWeight.bold);
  static TextStyle defaultXBoldTextStyle = appText.copyWith(
      fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.bold);
  static TextStyle defaultXXBoldTextStyle = appText.copyWith(
      fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.bold);
  static TextStyle defaultXXXBoldTextStyle = appText.copyWith(
      fontSize: 24.0, color: Colors.black, fontWeight: FontWeight.bold);

  static TextStyle defaultAlertBoldTextStyle = appText.copyWith(
      fontSize: 14.0,
      color: ColorUtils.accentColor,
      fontWeight: FontWeight.bold);
  static TextStyle defaultWarningBoldTextStyle = appText.copyWith(
      fontSize: 14.0,
      color: ColorUtils.accentColor,
      fontWeight: FontWeight.bold);

  static double titleSpacing = 0 /*-10*/;

  ///add outline around text
  static TextStyle applyOutLine(TextStyle textStyle,
      {double strokeWidth = 2,
      Color strokeColor = Colors.black,
      int precision = 5,
      Color textColor}) {
    if (textStyle == null) return textStyle;
    Set<Shadow> result = HashSet();
    for (int x = 1; x < strokeWidth + precision; x++) {
      for (int y = 1; y < strokeWidth + precision; y++) {
        double offsetX = x.toDouble();
        double offsetY = y.toDouble();
        result.add(Shadow(
            offset: Offset(-strokeWidth / offsetX, -strokeWidth / offsetY),
            color: strokeColor));
        result.add(Shadow(
            offset: Offset(-strokeWidth / offsetX, strokeWidth / offsetY),
            color: strokeColor));
        result.add(Shadow(
            offset: Offset(strokeWidth / offsetX, -strokeWidth / offsetY),
            color: strokeColor));
        result.add(Shadow(
            offset: Offset(strokeWidth / offsetX, strokeWidth / offsetY),
            color: strokeColor));
      }
    }
    List<Shadow> outlinedTextShadows = result.toList();
    return textStyle?.copyWith(shadows: outlinedTextShadows, color: textColor);
  }
}
