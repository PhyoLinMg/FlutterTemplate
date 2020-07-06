import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Utils {
  static getSizedBox({double width, double height}) {
    return SizedBox(
      height: height,
      width: width,
    );
  }

  static changeDate(String date) {
    return DateFormat("dd.MM.yyyy").parse(date);
  }

  static String base64Encode(List<int> bytes) => base64.encode(bytes);

  static Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String stringValue = prefs.getString('token') ?? "";
    return "Bearer " + stringValue;
  }

  static String convertDateFromString(String strDate, String format) {
    if (strDate == null) {
      return null;
    }
    DateTime datetime = new DateFormat("yyyy-MM-dd hh:mm:ss").parse(strDate);
    String date = new DateFormat(format).format(datetime);
    return date;
  }

  static Future<String> uploadImageMultiPart(filename, url) async {
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.headers['Authorization'] = await getToken();
    request.files.add(await http.MultipartFile.fromPath('picture', filename));
    var res = await request.send();
    return res.reasonPhrase;
  }

  //Check if biometric is available or not
  static Future<bool> canCheckBioMetric(
      LocalAuthentication auth, bool mounted) async {
    bool canCheckBiometrics;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
      return canCheckBiometrics;
    } on PlatformException catch (e) {
      print("The platform exception error $e");
    }
    if (!mounted) return null;
  }

  //FingerPrint or Face
  static Future<List<BiometricType>> getAvailableBiometric(
      LocalAuthentication auth, bool mounted) async {
    List<BiometricType> availableBiometrics;
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
      return availableBiometrics;
    } on PlatformException catch (e) {
      print(e);
    }

    if (!mounted) return null;
  }

  //Finally Start Authenticating...
  static Future<bool> authenticate(
      LocalAuthentication auth, bool mounted) async {
    bool authenticated = false;
    try {
      authenticated = await auth.authenticateWithBiometrics(
          localizedReason: "Scan to Authenticate",
          useErrorDialogs: true,
          stickyAuth: true);
      return authenticated;
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return null;
  }
}
