import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:crypto_trading_game/size_config.dart';

class ChartCard extends StatelessWidget {
  ChartCard({Key? key}) : super(key: key);

  final List<Color> gradientColors = [
    Color(0xff23b6e6),
    Color(0xff02d39a),
  ];

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey.withOpacity(0.1),
            ),
            child: Icon(
              Icons.attach_money,
              size: getProportionateScreenHeight(35),
            ),
          ),
          SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('USD'),
              Text('1.6%'),
            ],
          ),
          SizedBox(width: 40),
          Flexible(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: LineChart(
                LineChartData(
                  lineTouchData: LineTouchData(
                    enabled: false,
                  ),
                  titlesData: FlTitlesData(
                    show: false,
                  ),
                  gridData: FlGridData(
                    show: false,
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        FlSpot(0, 3),
                        FlSpot(2.6, 2),
                        FlSpot(4.9, 5),
                        FlSpot(6.8, 2.5),
                        FlSpot(8, 4),
                        FlSpot(9.5, 3),
                        FlSpot(11, 4),
                      ],
                      isCurved: false,
                      colors: gradientColors,
                      barWidth: 1,
                      dotData: FlDotData(show: false),
                      belowBarData: BarAreaData(
                        show: true,
                        colors: gradientColors
                            .map((color) => color.withOpacity(0.1))
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: 40),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("\$43.543,23"),
            ],
          ),
        ],
      ),
    );
  }
}
