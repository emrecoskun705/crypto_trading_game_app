import 'package:crypto_trading_game/generated/l10n.dart';
import 'package:crypto_trading_game/provider/language_change_provider.dart';
import 'package:crypto_trading_game/provider/theme_provider.dart';
import 'package:crypto_trading_game/screens/authentication/authentication_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => LanguageChangeProvider()),
      ],
      child: Consumer2<ThemeProvider, LanguageChangeProvider>(
        builder: (context, theme, language, child) {
          return MaterialApp(
            locale: language.currentLocale,
            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            title: 'Flutter Demo',
            themeMode: theme.themeMode,
            theme: MyThemes.lightTheme,
            darkTheme: MyThemes.darkTheme,
            home: AuthenticationScreen(),
          );
        },
      ),
    );
  }
}
