import 'package:crypto_trading_game/constants.dart';
import 'package:crypto_trading_game/generated/l10n.dart';
import 'package:crypto_trading_game/provider/theme_provider.dart';
import 'package:crypto_trading_game/screens/authentication/widgets/forgot_password.dart';
import 'package:crypto_trading_game/screens/authentication/widgets/form_text_field.dart';
import 'package:crypto_trading_game/screens/main_persistent_tab.dart';
import 'package:crypto_trading_game/screens/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:crypto_trading_game/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

class LogInTab extends StatelessWidget {
  static final GlobalKey _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController password1Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _spacer = SizedBox(height: getProportionateScreenHeight(30));
    var language = S.of(context);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildForm(context),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  child: Text(language.forgotPasswordText),
                  onTap: () {
                    pushNewScreen(context, screen: ForgotPasswordScreen());
                  },
                ),
                SizedBox(width: 15),
              ],
            ),
            _spacer,
            buildLoginButton(context),
            _spacer,
            Center(
              child: Text(
                '- ${language.orText} -',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: context.watch<ThemeProvider>().isDarkMode
                      ? Colors.grey.shade700
                      : Colors.grey,
                ),
              ),
            ),
            _spacer,
            SvgPicture.asset(
              'assets/google.svg',
              semanticsLabel: 'Google',
              height: getProportionateScreenHeight(50),
            ),
          ],
        ),
      ),
    );
  }

  Form buildForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          FormTextField(
            hint: S.of(context).enterEmailText,
            prefixIcon: Icons.email,
            controller: emailController,
          ),
          FormTextField(
            hint: S.of(context).enterPasswordText,
            prefixIcon: Icons.lock,
            controller: password1Controller,
            obscureText: true,
          ),
        ],
      ),
    );
  }

  Padding buildLoginButton(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(25)),
      child: RoundedButton(
        name: S.of(context).loginText.toUpperCase(),
        bgColor: context.watch<ThemeProvider>().isDarkMode
            ? Colors.grey.shade700
            : Colors.lightBlueAccent,
        primaryColor: kWhiteColor,
        function: () {
          pushNewScreen(context, screen: MainPersistentTab());
        },
      ),
    );
  }
}
