import 'package:flutter/cupertino.dart';

class LanguageChangeProvider extends ChangeNotifier {
  Locale _currentLocale = Locale('en');

  Locale get currentLocale => _currentLocale;

  void changeLocale(String locale) {
    this._currentLocale = Locale(locale);
    notifyListeners();
  }

  void toggleLanguage(Locale locale) {
    this._currentLocale = locale;
    notifyListeners();
  }
}
