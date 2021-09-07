import 'package:crypto_trading_game/generated/l10n.dart';
import 'package:crypto_trading_game/provider/theme_provider.dart';
import 'package:crypto_trading_game/screens/authentication/widgets/form_text_field.dart';
import 'package:crypto_trading_game/screens/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:crypto_trading_game/size_config.dart';
import 'package:crypto_trading_game/constants.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class RegisterTab extends StatelessWidget {
  static GlobalKey _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController password1Controller = TextEditingController();
  final TextEditingController password2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _spacer = SizedBox(height: getProportionateScreenHeight(30));
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildForm(context),
            _spacer,
            buildRegisterButton(context),
            _spacer,
            Center(
              child: Text(
                '- ${S.of(context).orText} -',
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

  Padding buildRegisterButton(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(25)),
      child: RoundedButton(
        name: S.of(context).registerText,
        bgColor: context.watch<ThemeProvider>().isDarkMode
            ? Colors.grey.shade700
            : Colors.lightBlueAccent,
        primaryColor: kWhiteColor,
        function: () {},
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
          FormTextField(
            hint: S.of(context).enterConfirmPassword,
            prefixIcon: Icons.lock,
            controller: password2Controller,
            obscureText: true,
          ),
        ],
      ),
    );
  }
}
