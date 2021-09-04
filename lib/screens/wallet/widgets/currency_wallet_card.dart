import 'package:crypto_trading_game/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:crypto_trading_game/size_config.dart';
import 'package:crypto_trading_game/constants.dart';
import 'package:provider/provider.dart';

class CryptocurrencyWalletCard extends StatelessWidget {
  final String currencyShortName;
  final String currencyFullName;
  final double amount;
  final double totalPrice;

  CryptocurrencyWalletCard(
      {required this.currencyShortName,
      required this.currencyFullName,
      required this.amount,
      required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.monetization_on_rounded,
        size: getProportionateScreenHeight(40),
      ),
      title: Text(
        this.currencyShortName,
        style: TextStyle(
          fontSize: getProportionateScreenHeight(23),
        ),
      ),
      subtitle: Text(
        this.currencyFullName,
        style: TextStyle(color: Colors.grey),
      ),
      trailing: Column(
        children: [
          Text(
            this.amount.toString(),
            style: TextStyle(
              fontSize: getProportionateScreenHeight(20),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(10)),
          Text(
            '≈\$${this.totalPrice}',
            style: TextStyle(
              color: context.watch<ThemeProvider>().isDarkMode
                  ? kDarkModeBrightColor
                  : kDarkModeTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
