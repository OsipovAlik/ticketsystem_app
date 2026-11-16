import 'package:flutter/material.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';

import '../../generated/l10n.dart';
import '../../providers/event_item_provider/model/event_category_filter.dart';
import '../../theme/custom_colors.dart';
import '../../theme/styles_text.dart';

/// "Cinemas" row — the real list of theaters/venues from the backend
/// (the same `theater` filter group the advanced-search screen uses),
/// shown as tappable cards that filter the main event list in place.
class CinemasWidget extends StatelessWidget {
  final List<Item> cinemas;
  final void Function(Item) onToggle;
  final VoidCallback onSeeAll;

  const CinemasWidget({
    super.key,
    required this.cinemas,
    required this.onToggle,
    required this.onSeeAll,
  });

  @override
  Widget build(BuildContext context) {
    if (cinemas.isEmpty) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(S.current.cinemas, style: ThemeText.w18b),
              GestureDetector(
                onTap: onSeeAll,
                child: Text(S.current.see_all, style: ThemeText.c14b),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 96,
          child: ListView.separated(
            padding: const EdgeInsets.only(left: 16.0),
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            itemCount: cinemas.length,
            separatorBuilder: (context, index) => const SizedBox(width: 12),
            itemBuilder: (BuildContext context, int index) {
              final item = cinemas[index];
              return GestureDetector(
                onTap: () => onToggle(item),
                child: GlassContainer(
                  width: 88,
                  padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 10.0),
                  shape: const LiquidRoundedSuperellipse(borderRadius: 12),
                  settings: item.isChecked
                      ? LiquidGlassSettings(glassColor: CustomColors.cyan.withOpacity(0.5))
                      : null,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.theaters_outlined,
                        size: 26,
                        color: item.isChecked ? CustomColors.cyan : CustomColors.textPrimary,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        item.value,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: item.isChecked ? ThemeText.c12 : ThemeText.w12,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
