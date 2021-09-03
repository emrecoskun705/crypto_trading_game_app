import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:k_chart/chart_style.dart';
import 'package:k_chart/chart_translations.dart';
import 'package:k_chart/flutter_k_chart.dart';
import 'package:k_chart/k_chart_widget.dart';
import 'package:provider/provider.dart';
import 'package:crypto_trading_game/provider/theme_provider.dart';

class CryptoCandleChartScreen extends StatefulWidget {
  const CryptoCandleChartScreen({Key? key}) : super(key: key);

  @override
  _CryptoCandleChartScreenState createState() =>
      _CryptoCandleChartScreenState();
}

class _CryptoCandleChartScreenState extends State<CryptoCandleChartScreen> {
  List<KLineEntity>? datas;
  bool showLoading = true;
  MainState _mainState = MainState.MA;
  bool _volHidden = false;
  SecondaryState _secondaryState = SecondaryState.MACD;
  bool isLine = false;
  bool isChinese = false;
  bool _hideGrid = false;
  bool _showNowPrice = true;
  List<DepthEntity>? _bids, _asks;
  bool isChangeUI = false;

  ChartStyle chartStyle = ChartStyle();
  ChartColors chartColors = ChartColors();

  @override
  void initState() {
    handleChartDarkModeColors();
    super.initState();
    getData('1day');

    // TODO: This part if for debugging and checking if it works fine
    rootBundle.loadString('assets/depth.json').then((result) {
      final parseJson = json.decode(result);
      final tick = parseJson['tick'] as Map<String, dynamic>;
      final List<DepthEntity> bids = (tick['bids'] as List<dynamic>)
          .map<DepthEntity>(
              (item) => DepthEntity(item[0] as double, item[1] as double))
          .toList();
      final List<DepthEntity> asks = (tick['asks'] as List<dynamic>)
          .map<DepthEntity>(
              (item) => DepthEntity(item[0] as double, item[1] as double))
          .toList();
      initDepth(bids, asks);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            buildChartWidget(context),
            buildChoiceButtons(),
            // TODO: Remove comment after everything in this screen and customize it
            /*if (_bids != null && _asks != null)
              Container(
                height: 230,
                width: double.infinity,
                child: DepthChart(_bids!, _asks!, chartColors),
              )*/
          ],
        ),
      ),
    );
  }

  Stack buildChartWidget(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
        height: 450,
        width: double.infinity,
        child: KChartWidget(
          datas,
          chartStyle,
          chartColors,
          bgColor: context.watch<ThemeProvider>().isDarkMode
              ? [
                  Colors.grey.shade900,
                  Colors.grey.shade900,
                ]
              : [
                  Color(0xFFFAFAFA),
                  Color(0xFFFAFAFA),
                ],
          isLine: isLine,
          mainState: _mainState,
          volHidden: _volHidden,
          secondaryState: _secondaryState,
          fixedLength: 2,
          timeFormat: TimeFormat.YEAR_MONTH_DAY,
          translations: kChartTranslations,
          showNowPrice: _showNowPrice,
          //`isChinese` is Deprecated, Use `translations` instead.
          isChinese: isChinese,
          hideGrid: _hideGrid,
          maDayList: [1, 100, 1000],
        ),
      ),
      if (showLoading)
        Container(
            width: double.infinity,
            height: 450,
            alignment: Alignment.center,
            child: const CircularProgressIndicator()),
    ]);
  }

  Row buildChoiceButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          child: Text('MA'),
          onTap: () {
            setState(() {
              _mainState = MainState.MA;
            });
          },
        ),
        GestureDetector(
          child: Text('BOLL'),
          onTap: () {
            setState(() {
              _mainState = MainState.BOLL;
            });
          },
        ),
        GestureDetector(
          child: Text('MACD'),
          onTap: () {
            setState(() {
              _secondaryState = SecondaryState.MACD;
            });
          },
        ),
        GestureDetector(
          child: Text('KDJ'),
          onTap: () {
            setState(() {
              _secondaryState = SecondaryState.KDJ;
            });
          },
        ),
        GestureDetector(
          child: Text('WR'),
          onTap: () {
            setState(() {
              _secondaryState = SecondaryState.WR;
            });
          },
        ),
        GestureDetector(
          child: Text('RSI'),
          onTap: () {
            setState(() {
              _secondaryState = SecondaryState.RSI;
            });
          },
        ),
        GestureDetector(
          child: Text('CCI'),
          onTap: () {
            setState(() {
              _secondaryState = SecondaryState.CCI;
            });
          },
        ),
        GestureDetector(
          child: Text('VOL'),
          onTap: () {
            setState(() {
              _volHidden = !_volHidden;
            });
          },
        )
      ],
    );
  }

  void initDepth(List<DepthEntity>? bids, List<DepthEntity>? asks) {
    if (bids == null || asks == null || bids.isEmpty || asks.isEmpty) return;
    _bids = [];
    _asks = [];
    double amount = 0.0;
    bids.sort((left, right) => left.price.compareTo(right.price));
    //累加买入委托量
    bids.reversed.forEach((item) {
      amount += item.vol;
      item.vol = amount;
      _bids!.insert(0, item);
    });

    amount = 0.0;
    asks.sort((left, right) => left.price.compareTo(right.price));
    //累加卖出委托量
    asks.forEach((item) {
      amount += item.vol;
      item.vol = amount;
      _asks!.add(item);
    });
    setState(() {});
  }

  void getData(String period) {
    final Future<String> future = getIPAddress(period);
    future.then((String result) {
      final Map parseJson = json.decode(result) as Map<dynamic, dynamic>;
      final list = parseJson['data'] as List<dynamic>;
      datas = list
          .map((item) => KLineEntity.fromJson(item as Map<String, dynamic>))
          .toList()
          .reversed
          .toList()
          .cast<KLineEntity>();
      DataUtil.calculate(datas!);
      showLoading = false;
      setState(() {});
    }).catchError((_) {
      showLoading = false;
      setState(() {});
      print('### datas error $_');
    });
  }

  void handleChartDarkModeColors() {
    chartColors.gridColor = Colors.grey.withOpacity(0.2);
    chartColors.infoWindowNormalColor = context.read<ThemeProvider>().isDarkMode
        ? Color(0xFFFAFAFA)
        : Colors.black;
    chartColors.infoWindowTitleColor = context.read<ThemeProvider>().isDarkMode
        ? Colors.grey.withOpacity(0.8)
        : Colors.grey.withOpacity(0.7);
    chartColors.selectFillColor = context.read<ThemeProvider>().isDarkMode
        ? Color(0xFF383838)
        : Color(0xFFF3F2F2);
    chartColors.selectBorderColor = context.read<ThemeProvider>().isDarkMode
        ? Color(0xFF383838)
        : Color(0xFFF3F2F2);
    chartColors.crossTextColor = context.read<ThemeProvider>().isDarkMode
        ? Color(0xFFFAFAFA)
        : Colors.black;
  }

  Future<String> getIPAddress(String? period) async {
    var url =
        'https://api.huobi.br.com/market/history/kline?period=${period ?? '1day'}&size=300&symbol=btcusdt';
    late String result;
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      result = response.body;
    } else {
      print('Failed getting IP address');
    }
    return result;
  }
}
