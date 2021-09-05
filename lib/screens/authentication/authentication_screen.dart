import 'package:crypto_trading_game/generated/l10n.dart';
import 'package:crypto_trading_game/provider/theme_provider.dart';
import 'package:crypto_trading_game/screens/authentication/tabs/login_tab.dart';
import 'package:crypto_trading_game/screens/authentication/tabs/register_tab.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crypto_trading_game/size_config.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            S.of(context).titleText,
          ),
          actions: [
            IconButton(
              onPressed: () {
                context
                    .read<ThemeProvider>()
                    .toggleTheme(!context.read<ThemeProvider>().isDarkMode);
              },
              icon: context.watch<ThemeProvider>().isDarkMode
                  ? Icon(
                      Icons.nightlight_round,
                    )
                  : Icon(
                      Icons.wb_sunny,
                      color: Colors.amber,
                    ),
            ),
            TextButton(
              onPressed: () {},
              child: Text('EN'),
            ),
          ],
          bottom: TabBar(
            tabs: [
              Tab(
                child: Text(S.of(context).loginText),
              ),
              Tab(
                child: Text(S.of(context).registerText),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            LogInTab(),
            RegisterTab(),
          ],
        ),
      ),
    );
  }
}
