import 'package:flutter/material.dart';
import 'package:ticketsystem/theme/custom_colors.dart';
import 'package:ticketsystem/theme/styles_text.dart';




AppBar appBarTicket({required String title, required BuildContext context}) {
  return AppBar(
    // leading: IconButton(
    //   icon: const Icon(Icons.arrow_back, color: Colors.white),
    //   onPressed: () => Navigator.of(context).pop(),
    // ),
    backgroundColor: CustomColors.blueBold,
    centerTitle: true,
    title: Text(title, style: ThemeText.w18b),
  );
}