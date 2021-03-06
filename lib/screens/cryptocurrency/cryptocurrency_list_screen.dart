import 'package:crypto_trading_game/constants.dart';
import 'package:crypto_trading_game/generated/l10n.dart';
import 'package:crypto_trading_game/screens/cryptocurrency/widgets/cryptocurrency_list.dart';
import 'package:crypto_trading_game/screens/cryptocurrency/widgets/search_currency.dart';
import 'package:crypto_trading_game/screens/search/search_screen.dart';
import 'package:crypto_trading_game/size_config.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class CryptocurrencyScreen extends StatelessWidget {
  const CryptocurrencyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(10),
            vertical: getProportionateScreenHeight(30),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GestureDetector(
                child: Hero(
                  tag: kHeroSearchBar,
                  child: SearchCurrencyWidget(
                    enabled: false,
                    controller: TextEditingController(),
                  ),
                ),
                onTap: () {
                  pushNewScreen(
                    context,
                    screen: SearchScreen(),
                    withNavBar: false,
                    pageTransitionAnimation: PageTransitionAnimation.fade,
                  );
                },
              ),
              SizedBox(height: 25),
              Text(S.of(context).favouritesText, style: kSectionTitle()),
              SizedBox(height: getProportionateScreenHeight(20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(S.of(context).cryptocurrencyText),
                  Text(S.of(context).oneDayChartText),
                  Text(S.of(context).priceText)
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(10)),
              CryptoCurrencyList(),
            ],
          ),
        ),
      ),
    );
  }
}
