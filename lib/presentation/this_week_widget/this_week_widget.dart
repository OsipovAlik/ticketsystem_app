import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../../global/global.dart';
import '../../providers/home_provider/model/event_model.dart';
import '../../screens/event_details/details.dart';
import '../../theme/styles_text.dart';
import '../../widget/this_week_card/this_week_card.dart';

/// "This Week" section — events starting in the next 7 days, shown as a
/// horizontal row of date-forward cards, matching the website's homepage.
class ThisWeekWidget extends StatelessWidget {
  final List<EventModel> eventList;
  const ThisWeekWidget({super.key, required this.eventList});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(S.current.this_week, style: ThemeText.w18b),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 150,
          child: ListView.builder(
            padding: const EdgeInsets.only(left: 16.0),
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            itemCount: eventList.length,
            itemBuilder: (BuildContext context, int index) {
              final event = eventList[index];
              return ThisWeekCard(
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
    );
  }
}
