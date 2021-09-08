import 'package:crypto_trading_game/constants.dart';
import 'package:crypto_trading_game/generated/l10n.dart';
import 'package:crypto_trading_game/provider/theme_provider.dart';
import 'package:crypto_trading_game/screens/widgets/rounded_button.dart';
import 'package:crypto_trading_game/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'form_text_field.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final lng = S.of(context);
    final _spacer = SizedBox(height: getProportionateScreenHeight(20));
    return Scaffold(
      appBar: AppBar(
        title: Text(lng.changePasswordText),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: getProportionateScreenHeight(60),
            horizontal: getProportionateScreenWidth(30)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              lng.changePasswordInfoText,
              style: TextStyle(fontSize: getProportionateScreenHeight(18)),
            ),
            _spacer,
            FormTextField(
              hint: S.of(context).enterEmailText,
              prefixIcon: Icons.email,
              controller: emailController,
            ),
            _spacer,
            RoundedButton(
                name: lng.sendText,
                bgColor: context.watch<ThemeProvider>().isDarkMode
                    ? Colors.grey.shade700
                    : Colors.lightBlueAccent,
                primaryColor: kWhiteColor,
                function: () {})
          ],
        ),
      ),
    );
  }
}
