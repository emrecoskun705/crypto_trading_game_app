import 'package:crypto_trading_game/constants.dart';
import 'package:crypto_trading_game/generated/l10n.dart';
import 'package:crypto_trading_game/screens/widgets/chart_card.dart';
import 'package:crypto_trading_game/screens/widgets/change_theme_button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:crypto_trading_game/screens/home/widgets/portfolio.dart';
import 'package:crypto_trading_game/size_config.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final _spacer = SizedBox(height: 20);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(S.of(context).titleText),
        actions: [
          ChangeThemeButtonWidget(),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              S.of(context).portfolioText,
              style: kSectionTitle(),
            ),
            _spacer,
            Portfolio(),
            _spacer,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  S.of(context).chartsText,
                  style: TextStyle(fontSize: getProportionateScreenHeight(20)),
                ),
                Text(S.of(context).seeAllText),
              ],
            ),
            _spacer,
            ChartCard(),
            _spacer,
            ChartCard(),
            _spacer,
            ChartCard(),
            _spacer,
            ChartCard(),
          ],
        ),
      ),
    );
  }
}
