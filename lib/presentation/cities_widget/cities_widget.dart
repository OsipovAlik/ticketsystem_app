import 'package:flutter/material.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';

import '../../generated/l10n.dart';
import '../../providers/event_item_provider/model/event_category_filter.dart';
import '../../theme/custom_colors.dart';
import '../../theme/styles_text.dart';

/// "Cities" row — the real `city` filter group from the backend, shown as
/// plain pill chips that filter the main event list in place.
class CitiesWidget extends StatelessWidget {
  final List<Item> cities;
  final void Function(Item) onToggle;
  final VoidCallback onSeeAll;

  const CitiesWidget({
    super.key,
    required this.cities,
    required this.onToggle,
    required this.onSeeAll,
  });

  @override
  Widget build(BuildContext context) {
    if (cities.isEmpty) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(S.current.cities, style: ThemeText.w18b),
              GestureDetector(
                onTap: onSeeAll,
                child: Text(S.current.see_all, style: ThemeText.c14b),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 48,
          child: ListView.separated(
            padding: const EdgeInsets.only(left: 16.0),
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            itemCount: cities.length,
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            itemBuilder: (BuildContext context, int index) {
              final item = cities[index];
              return GestureDetector(
                onTap: () => onToggle(item),
                child: GlassContainer(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  alignment: Alignment.center,
                  shape: const LiquidRoundedSuperellipse(borderRadius: 100),
                  settings: item.isChecked
                      ? LiquidGlassSettings(glassColor: CustomColors.cyan.withOpacity(0.5))
                      : null,
                  child: Text(
                    item.value,
                    style: item.isChecked ? ThemeText.c14b : ThemeText.w14,
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
