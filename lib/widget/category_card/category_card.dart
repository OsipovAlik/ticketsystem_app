import 'package:flutter/material.dart';
import 'package:ticketsystem/providers/category_provider/model/category_model.dart';
import 'package:ticketsystem/theme/custom_colors.dart';
import 'package:ticketsystem/theme/styles_text.dart';
import 'package:ticketsystem/widget/global_cash_img/global_cash_img.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel data;
  const CategoryCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: CustomColors.blueLight,
          borderRadius: BorderRadius.circular(8.0)),
      alignment: Alignment.center,
      margin: const EdgeInsets.only(right: 16.0),
      padding:
          const EdgeInsets.only(left: 16.0, top: 8.0, right: 16.0, bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GlobalCashImg(
              photo: data.icon, width: 25, height: 25, color: data.isActive? CustomColors.cyan: Colors.white, fit: BoxFit.cover),
          SizedBox(width: 10),
          Text(data.name, style: data.isActive? ThemeText.c14b:ThemeText.w14b),
        ],
      ),
    );
  }
}
