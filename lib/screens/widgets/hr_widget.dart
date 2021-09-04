import 'package:crypto_trading_game/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crypto_trading_game/provider/theme_provider.dart';

class HRWidget extends StatelessWidget {
  const HRWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(20)),
      child: SizedBox(
        height: 3,
        child: Container(
          color: context.watch<ThemeProvider>().isDarkMode
              ? Colors.grey.shade800
              : Color(0xFFe6e6e6),
        ),
      ),
    );
  }
}
