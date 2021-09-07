import 'package:crypto_trading_game/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangeThemeButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context
            .read<ThemeProvider>()
            .toggleTheme(!context.read<ThemeProvider>().isDarkMode);
      },
      icon: context.watch<ThemeProvider>().isDarkMode
          ? Icon(
              Icons.nightlight_round,
            )
          : Icon(
              Icons.wb_sunny,
              color: Colors.amber,
            ),
    );
  }
}
