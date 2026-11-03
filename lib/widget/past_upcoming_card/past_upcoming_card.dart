import 'package:flutter/material.dart';
import 'package:ticketsystem/providers/tickets_provider/model/ticket_past_upcoming_model.dart';
import 'package:ticketsystem/theme/box_decoration.dart';
import 'package:ticketsystem/theme/custom_colors.dart';
import 'package:ticketsystem/theme/styles_text.dart';
import 'package:ticketsystem/widget/global_cash_img/global_cash_img.dart';
import '../../generated/l10n.dart';
import '../my_separator/my_separator.dart';

class PastUpcomingCard extends StatelessWidget {
  final TicketPastUpcomingModel event;
  const PastUpcomingCard({
    super.key,
    required this.event,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width) - 16,
      margin: EdgeInsets.only(bottom: 8.0),
      height: 170,
      child: Column(
        children: [
          Row(
            spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: MyBoxDecoration.pastBox,
                width: (MediaQuery.of(context).size.width / 3.2) - 16,
                child: AspectRatio(aspectRatio: 0.78,
                child:  GlobalCashImg(
                      photo: event.eventInfo.posterImageEvent, fit: BoxFit.cover)),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.8,
                child: Column(
                    spacing: 6,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(event.eventInfo.expiryDate, style: ThemeText.c14b),
                      Text(event.eventInfo.name,
                          style: ThemeText.w16b,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis),
                     
                      Text(event.eventInfo.address,
                          style: ThemeText.g14,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis),
                      Text("${S.current.tickets} ${event.ticketCount}", style: ThemeText.w16),
                 
                    ]),
              )
            ],
          ),
          SizedBox(height: 14),
          const MySeparator(
            color: CustomColors.blue,
            height: 0.8,
          ),
  
        ],
      ),
    );
  }
}


