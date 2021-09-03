import 'package:crypto_trading_game/generated/l10n.dart';
import 'package:crypto_trading_game/provider/theme_provider.dart';
import 'package:crypto_trading_game/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

import 'cryptocurrency/cryptocurrency_list_screen.dart';

class MainPersistentTab extends StatefulWidget {
  const MainPersistentTab({Key? key}) : super(key: key);

  @override
  _MainPersistentTabState createState() => _MainPersistentTabState();
}

class _MainPersistentTabState extends State<MainPersistentTab> {
  @override
  Widget build(BuildContext context) {
    return buildPersistentTabView(context);
  }

  List<Widget> screens = [
    HomeScreen(),
    CryptocurrencyScreen(),
    Container(),
  ];

  List<PersistentBottomNavBarItem> _navbarItems(BuildContext context) {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: (S.of(context).homeText),
        activeColorPrimary: Colors.orangeAccent.withOpacity(0.8),
        inactiveColorPrimary: Colors.grey,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(initialRoute: '/'),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.signal_cellular_alt),
        title: (S.of(context).tradeText),
        activeColorPrimary: Colors.orangeAccent.withOpacity(0.8),
        inactiveColorPrimary: Colors.grey,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(initialRoute: '/'),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.account_balance_wallet_sharp),
        title: (S.of(context).walletText),
        activeColorPrimary: Colors.orangeAccent.withOpacity(0.8),
        inactiveColorPrimary: Colors.grey,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(initialRoute: '/'),
      ),
    ];
  }

  Widget buildPersistentTabView(BuildContext context) {
    return PersistentTabView(
      context,
      screens: screens,
      items: _navbarItems(context),
      confineInSafeArea: true,
      backgroundColor:
          context.watch<ThemeProvider>().themeMode == ThemeMode.dark
              ? Colors.grey.shade900
              : Color(0xFFFAFAFA), // Dark and light mode colors
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),

      navBarStyle:
          NavBarStyle.style6, // Choose the nav bar style with this property.
    );
  }
}
