import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../global/global.dart';

class PricePattern extends StatelessWidget {
  final dynamic  price;
  final TextStyle style;
  const PricePattern({super.key, required this.price,required this.style});

  @override
  Widget build(BuildContext context) {
    return Text(
      ((price - price.truncate()) * 100).truncate() > 0
          ? "${NumberFormat.decimalPattern().format(double.parse(price.toStringAsFixed(2)))} $globalSymbol"
          : "${NumberFormat.decimalPattern().format(price.truncate())} $globalSymbol", style: style);
  }
}
