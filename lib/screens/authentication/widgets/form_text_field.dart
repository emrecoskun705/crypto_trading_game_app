import 'package:crypto_trading_game/provider/theme_provider.dart';
import 'package:crypto_trading_game/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crypto_trading_game/constants.dart';

class FormTextField extends StatelessWidget {
  final String hint;
  final IconData prefixIcon;
  final TextEditingController controller;
  final bool obscureText;

  FormTextField(
      {required this.hint,
      required this.prefixIcon,
      required this.controller,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenHeight(15),
        horizontal: getProportionateScreenHeight(18),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            isDense: true,
            hintText: hint,
            filled: true,
            fillColor: context.watch<ThemeProvider>().isDarkMode
                ? kGreyColor
                : Colors.grey.withOpacity(0.4),
            prefixIcon: Icon(prefixIcon),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide.none,
            )),
      ),
    );
  }
}
