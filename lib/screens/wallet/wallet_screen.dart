import 'package:crypto_trading_game/generated/l10n.dart';
import 'package:crypto_trading_game/screens/widgets/hr_widget.dart';
import 'package:flutter/material.dart';
import 'package:crypto_trading_game/screens/home/widgets/portfolio.dart';
import 'package:crypto_trading_game/constants.dart';
import 'package:crypto_trading_game/screens/wallet/widgets/currency_wallet_card.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _spacer = SizedBox(height: 20);
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _spacer,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                S.of(context).myWalletsText,
                style: kSectionTitle(),
              ),
            ),
            _spacer,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Portfolio(),
            ),
            HRWidget(),
            Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: 2,
                itemBuilder: (context, index) {
                  return CryptocurrencyWalletCard(
                    currencyShortName: 'BTC',
                    currencyFullName: 'Bitcoin',
                    amount: 2.3,
                    totalPrice: 89543.32,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
