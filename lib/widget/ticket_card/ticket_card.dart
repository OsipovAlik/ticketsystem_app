import 'package:flutter/material.dart';
import 'package:ticketsystem/config/config.dart';
import 'package:ticketsystem/providers/home_provider/model/event_model.dart';
import 'package:ticketsystem/theme/box_decoration.dart';
import 'package:ticketsystem/theme/custom_colors.dart';
import 'package:ticketsystem/theme/styles_text.dart';
import 'package:ticketsystem/widget/global_cash_img/global_cash_img.dart';

import '../my_separator/my_separator.dart';

class TicketCard extends StatelessWidget {
  final EventModel event;
  final Function addFavorite;
  final bool isFavorite;
  const TicketCard(
      {super.key,
      required this.event,
      required this.addFavorite,
      required this.isFavorite});

  @override
  Widget build(BuildContext context) {
    final rawParts = event.hour.split(':');
    final parts = rawParts.length >= 2 ? rawParts : const ['--', '--'];
    final width = MediaQuery.of(context).size.width;
    return Container(
      decoration: MyBoxDecoration.ticketCard,
      width: (MediaQuery.of(context).size.width / 2) - 16,
      margin: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Stack(
            children: [
              AspectRatio(
                aspectRatio: 0.78,
                // height: ((MediaQuery.of(context).size.width / 2) - 16)*1.285,
                child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(8.0),
                      bottomLeft: Radius.zero,
                      bottomRight: Radius.zero,
                    ),
                    child: GlobalCashImg(photo: event.posterImageEvent, fit: BoxFit.cover)),
              ),
                 _liked(context, event),
            ],
          ),
          
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(event.day, style: ThemeText.w26b),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(event.month, style: ThemeText.w14b),
                    Text(event.dayOfWeek, style: !event.isWeekday? ThemeText.r14b: ThemeText.w14b),
                    Row(
                      children: [
                        Text(
                          parts[0],
                          style: ThemeText.w16,
                        ),
                        SizedBox(width: 2),
                        Text(
                          ':',
                         style: ThemeText.w16,
                        ),
                        SizedBox(width: 2),
                        Text(
                          parts[1],
                          style: ThemeText.w16,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 8),
                const MySeparator(color: CustomColors.cyan),
                const SizedBox(height: 8),
                SizedBox(
                  height: 46,
                  child: Text(event.name,
                      style: ThemeText.c14b,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2),
                ),
                const SizedBox(height: 8),
                const MySeparator(color: CustomColors.cyan),
                const SizedBox(height: 8),
                Row(
                  spacing: 4,
                  children: [
                     Icon(Icons.location_on,size: 16,color: CustomColors.textPrimary),
                    SizedBox(
                      width: isIPad(context)? width / 3.8:  width / 3,
                      child: Text(event.thName,
                          style: ThemeText.w12b,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _liked(BuildContext context,EventModel event) {
    return Positioned(
      right: -6,
      top: -4,
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: !isFavorite ? 100 : 450),
        switchInCurve: Curves.easeIn,
        switchOutCurve: Curves.easeOut,
        transitionBuilder: (Widget child, Animation<double> animation) {
          return ScaleTransition(scale: animation, child: child);
        },
        child: Container(
          key: Key(isFavorite ? 'liked' : 'not_liked'), // Key should change with state
          padding: EdgeInsets.all(6.0),
          child: IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            isSelected: !isFavorite,
            icon: Icon(
              Icons.favorite,
              color: isFavorite ? CustomColors.cyan : Colors.black,
              size: 28,
            ),
            selectedIcon: const Icon(
              Icons.favorite_border,
              color: CustomColors.cyan,
              size: 28,
            ),
            onPressed: () {
              addFavorite(context, event);
            },
          ),
        ),
      ),
    );
  }
}
