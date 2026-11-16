import 'package:flutter/material.dart';

import '../../global/global.dart';
import '../../providers/category_provider/model/category_model.dart';
import '../../providers/home_provider/model/event_model.dart';
import '../../screens/event_details/details.dart';
import '../../theme/styles_text.dart';
import '../../widget/event_carousel_card/event_carousel_card.dart';

/// "All of Armenia's events in one place" — one horizontal carousel per
/// category, each titled with the real category name from the backend.
/// Categories with no events for this row are simply skipped.
class CategoryRowsWidget extends StatelessWidget {
  final List<CategoryModel> categoryList;
  final Map<String, List<EventModel>> categoryRows;
  const CategoryRowsWidget({
    super.key,
    required this.categoryList,
    required this.categoryRows,
  });

  @override
  Widget build(BuildContext context) {
    final rows = categoryList.where((c) => (categoryRows[c.id]?.isNotEmpty ?? false)).toList();
    if (rows.isEmpty) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: rows.map((category) {
        final events = categoryRows[category.id]!;
        return Padding(
          padding: const EdgeInsets.only(bottom: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(category.name, style: ThemeText.w18b),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 190,
                child: ListView.separated(
                  padding: const EdgeInsets.only(left: 16.0),
                  scrollDirection: Axis.horizontal,
                  clipBehavior: Clip.none,
                  itemCount: events.length,
                  separatorBuilder: (context, index) => const SizedBox(width: 12),
                  itemBuilder: (BuildContext context, int index) {
                    final event = events[index];
                    return EventCarouselCard(
                      event: event,
                      onTap: () {
                        eventId = event.id.toString();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Details()),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
