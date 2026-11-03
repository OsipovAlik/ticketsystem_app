import 'package:flutter/material.dart';
import 'package:ticketsystem/generated/l10n.dart';
import 'package:ticketsystem/global/global.dart';
import 'package:ticketsystem/routes/animated_navigate.dart';
import 'package:ticketsystem/screens/event_chart/event_chart.dart';
import 'package:ticketsystem/theme/custom_buttons.dart';
import 'package:ticketsystem/theme/custom_colors.dart';
import 'package:ticketsystem/theme/styles_text.dart';

import '../../../providers/event_details_provider/model/event_details_model.dart';
import '../../../theme/box_decoration.dart';

class Schedule extends StatelessWidget {
  final List<TimeLine> list;
  const Schedule({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        
          // SizedBox(height: 16),
          ListView.builder(
              shrinkWrap: true,
              itemCount: list.length,
              padding: EdgeInsets.zero, 
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int idx) {
                TimeLine data = list[idx];
                return SizedBox(
                  child: Row(
                    spacing: 28,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data.day, style: ThemeText.w38b),
                          Text(data.month, style: ThemeText.w14)
                        ],
                      ),
                      Column(
                        spacing: 8,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            spacing: 8,
                            children: [
                              Text(data.dayOfWeek, style: !data.isWeekday? ThemeText.rm16b : ThemeText.w16b),
                              Text(data.hour, style: ThemeText.w16b),
                            ],
                          ),
                          Container(
                            height: 36,
                            decoration: MyBoxDecoration.ticketButton,
                            child: ElevatedButton(
                              onPressed: () {
                                 webViewLink = data.url;
                                Navigator.of(context).push(createOpacityTransition(const EventChart()));
                              },
                              style: CustomButtons.byTicket,
                              child: Text(S.current.by_ticket.toUpperCase(), style: ThemeText.w12),
                            ),
                          ),
                         const Divider(color: CustomColors.blueLight),
                        ],
                      ),
                                     
                    ],
                  ),
                );
              })
        ],
      ),
    );
  }
}
