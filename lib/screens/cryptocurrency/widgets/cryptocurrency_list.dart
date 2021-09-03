import 'package:crypto_trading_game/screens/cryptocurrency/crypto_candle_chart_screen.dart';
import 'package:crypto_trading_game/screens/widgets/chart_card.dart';
import 'package:crypto_trading_game/size_config.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

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
            child: InkWell(
              child: ChartCard(),
              onTap: () {
                pushNewScreen(context,
                    screen: CryptoCandleChartScreen(), withNavBar: false);
              },
            ),
          );
        },
      ),
    );
  }
}
