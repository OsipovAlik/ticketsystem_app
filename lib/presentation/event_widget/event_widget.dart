import 'package:flutter/material.dart';
import 'package:ticketsystem/config/config.dart';
import 'package:ticketsystem/providers/home_provider/model/event_model.dart';
import 'package:ticketsystem/screens/event_details/details.dart';
import '../../global/global.dart';
import '../../widget/ticket_card/ticket_card.dart';

class EventWidget extends StatelessWidget {
  final List<EventModel> eventList;
  final Function addFavorite;
  const EventWidget(
      {super.key,
      required this.eventList,
      required this.addFavorite});

  @override
  Widget build(BuildContext context) {
    return Padding(
       padding: const EdgeInsets.only(left: 8.0,right: 8.0),
      child: GridView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero, 
          physics: NeverScrollableScrollPhysics(),
          itemCount: eventList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              // childAspectRatio: MediaQuery.of(context).size.width /
              //     (MediaQuery.of(context).size.height),
              mainAxisExtent:isIPad(context) ? 620: 460,
              crossAxisCount:isIPad(context) ? 3: 2,
              ),
          itemBuilder: (BuildContext context, int index) {
            EventModel event = eventList[index];
            return GestureDetector(
                onTap: () {
                  eventId = event.id.toString();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Details(),
                    ),
                  );
                },
                child: TicketCard(
                  event: event,
                  isFavorite: event.isFavorite,
                  addFavorite: addFavorite,
                ));
          }),
    );
  }
}
