import 'package:flutter/material.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';
import 'package:ticketsystem/providers/category_provider/model/category_model.dart';
import 'package:ticketsystem/theme/custom_colors.dart';
import 'package:ticketsystem/theme/styles_text.dart';
import 'package:ticketsystem/widget/global_cash_img/global_cash_img.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel data;
  const CategoryCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      shape: const LiquidRoundedSuperellipse(borderRadius: 8),
      // `color` only paints GlassSurfaceStyle.solid containers — for the
      // default glass style the tint has to go through `settings.glassColor`
      // instead, or it's silently ignored.
      settings: data.isActive ? LiquidGlassSettings(glassColor: const Color.fromARGB(255, 255, 255, 255)) : null,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(right: 16.0),
      padding: const EdgeInsets.only(left: 16.0, top: 8.0, right: 16.0, bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GlobalCashImg(photo: data.icon, width: 20, height: 20, color: data.isActive ? Colors.black : CustomColors.textPrimary, fit: BoxFit.cover),
          SizedBox(width: 5),
          Text(data.name, style: data.isActive ? ThemeText.b14 : ThemeText.w14),
        ],
      ),
    );
  }
}
