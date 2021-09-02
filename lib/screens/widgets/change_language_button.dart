import 'package:crypto_trading_game/provider/language_change_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangeLanguageButton extends StatelessWidget {
  const ChangeLanguageButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final languageChangeProvider = Provider.of<LanguageChangeProvider>(context);
    return Switch.adaptive(
      value: languageChangeProvider.currentLocale == Locale('en') ? true:false,
      onChanged: (value) {
        final provider = Provider.of<LanguageChangeProvider>(context, listen: false);
        provider.toggleLanguage(value);
      },
    );
  }
}
