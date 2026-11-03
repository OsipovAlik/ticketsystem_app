import 'package:flutter/material.dart';
import '../../providers/ticket_details_provider/model/ticket_details_model.dart';
import '../../widget/ticket_details_card/ticket_details_card.dart';

class TicketDetailsWidget extends StatelessWidget {
final List<TicketDetailsModel> list;
const TicketDetailsWidget({ 
  super.key, 
  required this. list, 
  });

  @override
  Widget build(BuildContext context){
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: list.length,
      itemBuilder: (BuildContext context,int idx){
        TicketDetailsModel event = list[idx];
       return TicketDetailsCard(event: event);
      }
        );
  }
 
}