import 'dart:convert';
import 'package:crypto_trading_game/constants.dart';
import 'package:crypto_trading_game/generated/l10n.dart' as lng;
import 'package:crypto_trading_game/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:k_chart/chart_style.dart';
import 'package:k_chart/chart_translations.dart';
import 'package:k_chart/flutter_k_chart.dart';
import 'package:k_chart/k_chart_widget.dart';
import 'package:provider/provider.dart';
import 'package:crypto_trading_game/provider/theme_provider.dart';

class CryptoCandleChart extends StatefulWidget {
  const CryptoCandleChart({Key? key}) : super(key: key);

  @override
  _CryptoCandleChartState createState() => _CryptoCandleChartState();
}

class _CryptoCandleChartState extends State<CryptoCandleChart> {
  List<KLineEntity>? datas;
  bool showLoading = true;
  MainState _mainState = MainState.NONE;
  bool _volHidden = true;
  SecondaryState _secondaryState = SecondaryState.NONE;
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
    return Expanded(
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          buildPriceSection(context),
          buildTimeChoiceButtons(),
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
    );
  }

  Padding buildPriceSection(BuildContext context) {
    Color titleColor = context.read<ThemeProvider>().isDarkMode
        ? Colors.white60
        : kDarkModeBrightColor;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '\$49.321,23',
            style: TextStyle(fontSize: getProportionateScreenHeight(30)),
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    lng.S.of(context).highText,
                    style: TextStyle(color: titleColor),
                  ),
                  Text(
                    lng.S.of(context).lowText,
                    style: TextStyle(color: titleColor),
                  ),
                  Text(
                    lng.S.of(context).volumeText,
                    style: TextStyle(color: titleColor),
                  ),
                ],
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('49.321,23'),
                  Text('48.321'),
                  Text('20.88M'),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Padding buildTimeChoiceButtons() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            child: Text('Line',
                style: TextStyle(
                  color: isLine ? null : kDarkModeBrightColor,
                )),
            onTap: () {
              setState(() {
                isLine = !isLine;
              });
            },
          ),
          GestureDetector(
            child: Text('15m'),
          ),
          GestureDetector(
            child: Text('1h'),
          ),
          GestureDetector(
            child: Text('4h'),
          ),
          GestureDetector(
            child: Text('1d'),
          ),
          GestureDetector(
            child: Text('Depth'),
            onTap: () {},
          ),
        ],
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
                  kDarkModeColor,
                  kDarkModeColor,
                ]
              : [
                  kWhiteColor,
                  kWhiteColor,
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
          child: Text(
            'MA',
            style: TextStyle(
              color: _mainState == MainState.MA
                  ? null
                  : Colors.grey.withOpacity(0.8),
            ),
          ),
          onTap: () {
            setState(() {
              if (_mainState == MainState.MA) {
                _mainState = MainState.NONE;
              } else {
                _mainState = MainState.MA;
              }
            });
          },
        ),
        GestureDetector(
          child: Text(
            'BOLL',
            style: TextStyle(
              color: _mainState == MainState.BOLL ? null : kDarkModeBrightColor,
            ),
          ),
          onTap: () {
            setState(() {
              if (_mainState == MainState.BOLL) {
                _mainState = MainState.NONE;
              } else {
                _mainState = MainState.BOLL;
              }
            });
          },
        ),
        GestureDetector(
          child: Text(
            'MACD',
            style: TextStyle(
              color: _secondaryState == SecondaryState.MACD
                  ? null
                  : kDarkModeBrightColor,
            ),
          ),
          onTap: () {
            setState(() {
              if (_secondaryState == SecondaryState.MACD) {
                _secondaryState = SecondaryState.NONE;
              } else {
                _secondaryState = SecondaryState.MACD;
              }
            });
          },
        ),
        GestureDetector(
          child: Text(
            'KDJ',
            style: TextStyle(
              color: _secondaryState == SecondaryState.KDJ
                  ? null
                  : kDarkModeBrightColor,
            ),
          ),
          onTap: () {
            setState(() {
              if (_secondaryState == SecondaryState.KDJ) {
                _secondaryState = SecondaryState.NONE;
              } else {
                _secondaryState = SecondaryState.KDJ;
              }
            });
          },
        ),
        GestureDetector(
          child: Text(
            'RSI',
            style: TextStyle(
              color: _secondaryState == SecondaryState.RSI
                  ? null
                  : kDarkModeBrightColor,
            ),
          ),
          onTap: () {
            setState(() {
              if (_secondaryState == SecondaryState.RSI) {
                _secondaryState = SecondaryState.NONE;
              } else {
                _secondaryState = SecondaryState.RSI;
              }
            });
          },
        ),
        GestureDetector(
          child: Text(
            'WR',
            style: TextStyle(
              color: _secondaryState == SecondaryState.WR
                  ? null
                  : kDarkModeBrightColor,
            ),
          ),
          onTap: () {
            setState(() {
              if (_secondaryState == SecondaryState.WR) {
                _secondaryState = SecondaryState.NONE;
              } else {
                _secondaryState = SecondaryState.WR;
              }
            });
          },
        ),
        GestureDetector(
          child: Text(
            'CCI',
            style: TextStyle(
              color: _secondaryState == SecondaryState.CCI
                  ? null
                  : kDarkModeBrightColor,
            ),
          ),
          onTap: () {
            setState(() {
              if (_secondaryState == SecondaryState.CCI) {
                _secondaryState = SecondaryState.NONE;
              } else {
                _secondaryState = SecondaryState.CCI;
              }
            });
          },
        ),
        GestureDetector(
          child: Text(
            'VOL',
            style: TextStyle(
              color: !_volHidden ? null : kDarkModeBrightColor,
            ),
          ),
          onTap: () {
            setState(() {
              _volHidden = !_volHidden;
            });
          },
        ),
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
        ? kGreyColor
        : Color(0xFFF3F2F2);
    chartColors.selectBorderColor = context.read<ThemeProvider>().isDarkMode
        ? kGreyColor
        : Color(0xFFF3F2F2);
    chartColors.crossTextColor = context.read<ThemeProvider>().isDarkMode
        ? Color(0xFFFAFAFA)
        : Colors.black;
    chartColors.maxColor = context.read<ThemeProvider>().isDarkMode
        ? Color(0xFFFAFAFA)
        : Colors.black;
    chartColors.minColor = context.read<ThemeProvider>().isDarkMode
        ? Color(0xFFFAFAFA)
        : Colors.black;

    chartColors.upColor = context.read<ThemeProvider>().isDarkMode
        ? Color(0xff4DAA90)
        : Colors.green.withOpacity(0.8);
    chartColors.nowPriceUpColor = context.read<ThemeProvider>().isDarkMode
        ? Color(0xff4DAA90)
        : Colors.green.withOpacity(0.8);
    chartColors.dnColor = context.read<ThemeProvider>().isDarkMode
        ? Color(0xffC15466)
        : Colors.redAccent;
    chartColors.nowPriceDnColor = context.read<ThemeProvider>().isDarkMode
        ? Color(0xffC15466)
        : Colors.redAccent;
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
