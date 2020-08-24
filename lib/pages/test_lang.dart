import 'package:flutter/material.dart';
import 'package:template/localization/app_translations.dart';
import 'package:template/localization/application.dart';
import 'package:template/utils/constant.dart';
import 'package:template/utils/shared_prefs.dart';

class TestLang extends StatefulWidget {
  @override
  _TestLangState createState() => _TestLangState();
}

class _TestLangState extends State<TestLang> {
  String lang = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _getLang();
  }

  _getLang() async {
    String language = await SharedPrefs.getString("lang");
    setState(() {
      lang = language;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          AppTranslations.of(context).text("test_shared_pref"),
        ),
      ),
    );
  }
}
