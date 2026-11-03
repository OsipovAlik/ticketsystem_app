import 'package:flutter/material.dart';
import 'package:ticketsystem/providers/ticket_details_provider/model/ticket_details_model.dart';
import 'package:ticketsystem/theme/box_decoration.dart';
import 'package:ticketsystem/theme/custom_colors.dart';
import 'package:ticketsystem/theme/styles_text.dart';
import 'package:ticketsystem/widget/global_cash_img/global_cash_img.dart';
import 'package:ticketsystem/widget/my_separator/my_separator.dart';
import '../../global/global.dart';
import '../price_pattern/price_pattern.dart';


class TicketDetailItemCard extends StatelessWidget {
final TicketDetailsModel event;
const TicketDetailItemCard({ super.key, required this.event });

 @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width) - 16,
      margin: EdgeInsets.only(bottom: 8.0),
      height: 180,
      child: Column(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: MyBoxDecoration.pastBox,
                width: (MediaQuery.of(context).size.width / 3.2) - 16,
                child: AspectRatio(aspectRatio: 0.78,
                child: GlobalCashImg(photo: event.eventInfo.posterImageEvent, fit: BoxFit.cover)),
              ),
              SizedBox(
                height: 145,
                width: MediaQuery.of(context).size.width / 1.8,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(event.eventInfo.name,
                          style: ThemeText.w16b,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis),
                      Text("${event.eventInfo.day} ${event.eventInfo.month} ${event.eventInfo.dayOfWeek} ${event.eventInfo.hour} ",
                          style: ThemeText.w16,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis),
                       SizedBox(height: 40),
                      PricePattern(price: ticketPrice, style: ThemeText.w16b),
                    ]),
              )
            ],
          ),
          SizedBox(height: 18),
          const MySeparator(
            color: CustomColors.blue,
            height: 0.8,
          ),
          SizedBox(height: 6),
        ],
      ),
    );
  }
}


