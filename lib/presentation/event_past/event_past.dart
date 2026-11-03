import 'package:flutter/material.dart';
import 'package:ticketsystem/global/global.dart';
import 'package:ticketsystem/providers/tickets_provider/model/ticket_past_upcoming_model.dart';
import 'package:ticketsystem/screens/ticket_details/ticket_details.dart';
import 'package:ticketsystem/widget/past_upcoming_card/past_upcoming_card.dart';



class EventPast extends StatelessWidget {
 final List<TicketPastUpcomingModel> pastList;
const EventPast({ 
  super.key, 
  required this. pastList, 
  });

 
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: pastList.length,
        itemBuilder: (BuildContext context,int idx){
          TicketPastUpcomingModel event = pastList[idx];
         return GestureDetector(
          onTap: (){
            ticketPrice = event.total;
            ticketTime = event.orderDate;
            ticketId = event.id.toString();
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TicketDetails(),
                ),
              );
          },
          child: PastUpcomingCard(event: event));
        }
    ));
  }
 
}