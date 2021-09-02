import 'package:crypto_trading_game/generated/l10n.dart';
import 'package:crypto_trading_game/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchCurrencyWidget extends StatelessWidget {
  const SearchCurrencyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 1,
      enabled: true,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search),
        suffixIcon: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
        ),
        hintText: S.of(context).searchCurrencyText,
        filled: true,
        fillColor: context.watch<ThemeProvider>().themeMode == ThemeMode.dark
            ? Colors.grey.withOpacity(0.3)
            : Colors.grey.withOpacity(0.2),
        isDense: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
