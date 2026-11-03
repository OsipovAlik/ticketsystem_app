import 'package:flutter/material.dart';

import '../../global/global.dart';

class LanguageProvider with ChangeNotifier {
  Locale _currentLocale = Locale(globalLanguage);
  final bool _loading = false;
  bool get loading => _loading;
  Locale get currentLocale => _currentLocale;


  ///$$$ CHANGE LANGUAGE $$$///
  void changeLocale(String locale) {
    _currentLocale = Locale(locale);
    notifyListeners();
  }
}
