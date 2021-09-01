import 'package:crypto_trading_game/screens/widgets/change_theme_button_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crypto'),
        actions: [
          ChangeThemeButtonWidget(),
        ],
      ),
      body: Container(
        child: Text('sds'),
      ),
    );
  }
}
