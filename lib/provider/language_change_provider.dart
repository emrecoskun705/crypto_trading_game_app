import 'package:flutter/cupertino.dart';

class LanguageChangeProvider extends ChangeNotifier {
  Locale _currentLocale = Locale('en');

  Locale get currentLocale => _currentLocale;

  void changeLocale(String locale) {
    this._currentLocale = Locale(locale);
    notifyListeners();
  }

  void toggleLanguage(bool isOn) {
    this._currentLocale = isOn ? Locale('en') : Locale('tr');
    notifyListeners();
  }
}
