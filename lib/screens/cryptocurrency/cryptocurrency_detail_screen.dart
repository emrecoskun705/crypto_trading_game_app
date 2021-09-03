import 'package:crypto_trading_game/constants.dart';
import 'package:crypto_trading_game/generated/l10n.dart';
import 'package:crypto_trading_game/screens/cryptocurrency/widgets/crypto_candle_chart.dart';
import 'package:flutter/material.dart';
import 'package:crypto_trading_game/screens/widgets/rounded_button.dart';

class CryptocurrencyDetailScreen extends StatelessWidget {
  const CryptocurrencyDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text('BTC/USDT'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.star_border_purple500_outlined),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CryptoCandleChart(),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                RoundedButton(
                  name: S.of(context).buyText,
                  bgColor: Colors.green,
                  primaryColor: kWhiteColor,
                  function: () {},
                ),
                SizedBox(width: 10),
                RoundedButton(
                  name: S.of(context).sellText,
                  bgColor: Colors.red,
                  primaryColor: kWhiteColor,
                  function: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
