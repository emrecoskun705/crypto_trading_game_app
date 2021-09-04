import 'package:crypto_trading_game/constants.dart';
import 'package:crypto_trading_game/generated/l10n.dart';
import 'package:crypto_trading_game/screens/cryptocurrency/widgets/search_currency.dart';
import 'package:crypto_trading_game/screens/search/widgets/currency_search_card.dart';
import 'package:flutter/material.dart';
import 'package:crypto_trading_game/size_config.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  final TextEditingController searchTextController = TextEditingController();

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
            children: [
              buildSearchBar(context),
              CurrencySearchCard(
                mainCryptocurrency: 'BTC',
                secondaryCryptocurrency: 'USDT',
                price: 49504.23,
                percentage: '+20,5',
                isFavourite: true,
              ),
              CurrencySearchCard(
                mainCryptocurrency: 'BTC',
                secondaryCryptocurrency: 'USDT',
                price: 49504.23,
                percentage: '+20,5',
                isFavourite: false,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row buildSearchBar(BuildContext context) {
    return Row(
      children: [
        Flexible(
            child: Hero(
          tag: kHeroSearchBar,
          child: SearchCurrencyWidget(
            enabled: true,
            controller: searchTextController,
          ),
        )),
        SizedBox(width: 10),
        InkWell(
          borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding: EdgeInsets.all(3.0),
            child: Text(S.of(context).cancelText),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
