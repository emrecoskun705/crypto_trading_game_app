import 'package:crypto_trading_game/screens/widgets/chart_card.dart';
import 'package:crypto_trading_game/size_config.dart';
import 'package:flutter/material.dart';

class CryptoCurrencyList extends StatelessWidget {
  const CryptoCurrencyList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(
                vertical: getProportionateScreenHeight(10)),
            child: ChartCard(),
          );
        },
      ),
    );
  }
}
