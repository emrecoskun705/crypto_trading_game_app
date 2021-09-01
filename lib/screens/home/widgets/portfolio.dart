import 'package:crypto_trading_game/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:crypto_trading_game/size_config.dart';
import 'package:crypto_trading_game/constants.dart';
import 'package:provider/provider.dart';

class Portfolio extends StatelessWidget {
  const Portfolio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height: 5),
            buildWalletTitle(),
            SizedBox(height: getProportionateScreenHeight(30)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$45.342,12',
                  style: TextStyle(
                    fontSize: getProportionateScreenHeight(30),
                  ),
                ),
                buildProfitLoss(context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Row buildWalletTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              Icons.account_balance_wallet_outlined,
              size: getProportionateScreenHeight(30),
            ),
            SizedBox(width: 5),
            Text(
              'Total Wallet Balance',
              style: TextStyle(
                fontSize: getProportionateScreenHeight(20),
              ),
            ),
          ],
        ),
        Text(
          'USD',
          style: TextStyle(
            decoration: TextDecoration.underline,
          ),
        ),
      ],
    );
  }

  Container buildProfitLoss(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: context.watch<ThemeProvider>().themeMode == ThemeMode.dark
            ? kForestGreen
            : Colors.lightGreen,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        '+3.55%',
        style: TextStyle(
          color: Color(0xFFFAFAFA),
        ),
      ),
    );
  }
}
