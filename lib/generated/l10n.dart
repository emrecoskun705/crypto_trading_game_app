// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Crypto`
  String get titleText {
    return Intl.message(
      'Crypto',
      name: 'titleText',
      desc: '',
      args: [],
    );
  }

  /// `Portfolio`
  String get portfolioText {
    return Intl.message(
      'Portfolio',
      name: 'portfolioText',
      desc: '',
      args: [],
    );
  }

  /// `Total Wallet Balance`
  String get totalWalletBalanceText {
    return Intl.message(
      'Total Wallet Balance',
      name: 'totalWalletBalanceText',
      desc: '',
      args: [],
    );
  }

  /// `Charts`
  String get chartsText {
    return Intl.message(
      'Charts',
      name: 'chartsText',
      desc: '',
      args: [],
    );
  }

  /// `See All`
  String get seeAllText {
    return Intl.message(
      'See All',
      name: 'seeAllText',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get homeText {
    return Intl.message(
      'Home',
      name: 'homeText',
      desc: '',
      args: [],
    );
  }

  /// `Trade`
  String get tradeText {
    return Intl.message(
      'Trade',
      name: 'tradeText',
      desc: '',
      args: [],
    );
  }

  /// `Wallet`
  String get walletText {
    return Intl.message(
      'Wallet',
      name: 'walletText',
      desc: '',
      args: [],
    );
  }

  /// `Search cryptocurrency`
  String get searchCurrencyText {
    return Intl.message(
      'Search cryptocurrency',
      name: 'searchCurrencyText',
      desc: '',
      args: [],
    );
  }

  /// `Cryptocurrency`
  String get cryptocurrencyText {
    return Intl.message(
      'Cryptocurrency',
      name: 'cryptocurrencyText',
      desc: '',
      args: [],
    );
  }

  /// `1 Day Chart`
  String get oneDayChartText {
    return Intl.message(
      '1 Day Chart',
      name: 'oneDayChartText',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get priceText {
    return Intl.message(
      'Price',
      name: 'priceText',
      desc: '',
      args: [],
    );
  }

  /// `My Favourites`
  String get favouritesText {
    return Intl.message(
      'My Favourites',
      name: 'favouritesText',
      desc: '',
      args: [],
    );
  }

  /// `Buy`
  String get buyText {
    return Intl.message(
      'Buy',
      name: 'buyText',
      desc: '',
      args: [],
    );
  }

  /// `Sell`
  String get sellText {
    return Intl.message(
      'Sell',
      name: 'sellText',
      desc: '',
      args: [],
    );
  }

  /// `High`
  String get highText {
    return Intl.message(
      'High',
      name: 'highText',
      desc: '',
      args: [],
    );
  }

  /// `Low`
  String get lowText {
    return Intl.message(
      'Low',
      name: 'lowText',
      desc: '',
      args: [],
    );
  }

  /// `Volume`
  String get volumeText {
    return Intl.message(
      'Volume',
      name: 'volumeText',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancelText {
    return Intl.message(
      'Cancel',
      name: 'cancelText',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'tr'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
