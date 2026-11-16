import 'package:flutter/material.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';
import 'package:ticketsystem/theme/styles_text.dart';

import '../../providers/home_provider/model/date_model.dart';

class DateWidget extends StatelessWidget {
  final List<DateModel> dateList;
  final Function onTap;
  const DateWidget({super.key, required this.dateList, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 16.0, left: 16.0),
      // color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: 80,
      child: ListView.builder(
          itemCount: dateList.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          clipBehavior: Clip.none,
          itemBuilder: (BuildContext context, int idx) {
            DateModel date = dateList[idx];
            return GestureDetector(
              onTap: () => onTap(idx, date.startDate),
              child: GlassContainer(
                shape: const LiquidRoundedSuperellipse(borderRadius: 8),
                // `color` only paints GlassSurfaceStyle.solid containers —
                // for the default glass style the tint has to go through
                // `settings.glassColor` instead, or it's silently ignored.
                settings: date.isActive ? LiquidGlassSettings(glassColor: const Color.fromARGB(255, 255, 255, 255)) : null,
                alignment: Alignment.center,
                margin: const EdgeInsets.only(right: 16.0),
                padding: const EdgeInsets.only(left: 18.0, top: 8.0, right: 18.0),
                child: Column(
                  children: [
                    Text(date.day, style: date.isActive ? ThemeText.b18b : ThemeText.w18b),
                    Text(date.weekday,
                        style: date.isActive
                            ? ThemeText.b14
                            : date.isWeekend
                                ? ThemeText.r14b
                                : ThemeText.w12),
                    Text(date.month, style: date.isActive ? ThemeText.b10 : ThemeText.w10),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
