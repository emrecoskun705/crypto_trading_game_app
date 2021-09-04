import 'package:crypto_trading_game/generated/l10n.dart';
import 'package:crypto_trading_game/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchCurrencyWidget extends StatefulWidget {
  final bool enabled;
  final TextEditingController controller;
  SearchCurrencyWidget(
      {Key? key, required this.enabled, required this.controller})
      : super(key: key);

  @override
  _SearchCurrencyWidgetState createState() => _SearchCurrencyWidgetState();
}

class _SearchCurrencyWidgetState extends State<SearchCurrencyWidget> {
  String previousText = '';

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: TextField(
        controller: this.widget.controller,
        onChanged: (val) {
          setState(() {
            previousText = val;
          });
        },
        maxLines: 1,
        enabled: widget.enabled,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          suffixIcon: previousText.length > 0
              ? IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    this.widget.controller.clear();
                    setState(() {
                      previousText = '';
                    });
                  },
                )
              : null,
          hintText: S.of(context).searchCurrencyText,
          filled: true,
          fillColor: context.watch<ThemeProvider>().themeMode == ThemeMode.dark
              ? Colors.grey.withOpacity(0.3)
              : Colors.grey.withOpacity(0.2),
          isDense: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
