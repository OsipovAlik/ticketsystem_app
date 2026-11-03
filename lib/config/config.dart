import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// NAVIGATOR KEY ALL PAGES
  final List<GlobalKey<NavigatorState>> navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>()
  ];

String formatStartDate(String startDate) {
  DateTime parsedDate = DateTime.parse(startDate);
  String formattedDate = DateFormat('dd MMM').format(parsedDate);
  return formattedDate;
}

 bool isIPad(BuildContext context) {
  final size = MediaQuery.of(context).size;
  return size.width >= 768; // Минимальная ширина iPad (в dp)
}