import 'package:flutter/material.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';

import '../../providers/home_provider/model/event_model.dart';
import '../../theme/styles_text.dart';

/// Date-forward card for the "This Week" row — big day number, time, title
/// and venue, matching the website's "This Week" section.
class ThisWeekCard extends StatelessWidget {
  final EventModel event;
  final VoidCallback onTap;

  const ThisWeekCard({super.key, required this.event, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: GlassContainer(
        width: 170,
        margin: const EdgeInsets.only(right: 12.0),
        padding: const EdgeInsets.all(14.0),
        shape: const LiquidRoundedSuperellipse(borderRadius: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(event.day, style: ThemeText.w26b),
                const SizedBox(width: 6),
                Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Text(event.month, style: ThemeText.g14b),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(event.hour, style: ThemeText.c14b),
            const SizedBox(height: 10),
            Text(event.name, style: ThemeText.w14b, maxLines: 2, overflow: TextOverflow.ellipsis),
            const SizedBox(height: 4),
            Text(event.thName, style: ThemeText.g14, maxLines: 1, overflow: TextOverflow.ellipsis),
          ],
        ),
      ),
    );
  }
}
