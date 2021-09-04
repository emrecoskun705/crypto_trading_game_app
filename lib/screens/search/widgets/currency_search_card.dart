import 'package:crypto_trading_game/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:crypto_trading_game/constants.dart';

class CurrencySearchCard extends StatelessWidget {
  final String mainCryptocurrency;
  final String secondaryCryptocurrency;
  final double price;
  final String percentage;
  final bool isFavourite;

  CurrencySearchCard(
      {required this.mainCryptocurrency,
      required this.secondaryCryptocurrency,
      required this.price,
      required this.percentage,
      required this.isFavourite});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: getProportionateScreenHeight(25)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                mainCryptocurrency,
                style: TextStyle(
                  fontSize: getProportionateScreenHeight(20),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 5),
              Text('/$secondaryCryptocurrency'),
            ],
          ),
          Column(
            children: [
              Text(
                price.toString(),
                style: TextStyle(fontSize: getProportionateScreenHeight(20)),
              ),
              SizedBox(height: 6),
              Text(
                '$percentage%',
                style: TextStyle(color: kForestGreen),
              ),
            ],
          ),
          isFavourite
              ? Icon(
                  Icons.star,
                  color: kStarYellowColor,
                )
              : Icon(
                  Icons.star_border,
                  color: kDarkModeBrightColor,
                ),
        ],
      ),
    );
  }
}
