import 'package:flutter/material.dart';
import 'package:ticketsystem/generated/l10n.dart';
import 'package:ticketsystem/global/global.dart';
import 'package:ticketsystem/screens/event_details/details.dart';
import 'package:ticketsystem/theme/styles_text.dart';
import 'package:ticketsystem/widget/search_event_card/search_event_card.dart';
import '../../providers/home_provider/model/banner_model.dart';
import '../../routes/animated_navigate.dart';



class SearchEventWidget extends StatelessWidget {
   final List<BannerModel> dateList;
const SearchEventWidget({ super.key, required this.dateList});

  @override
  Widget build(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(S.current.simelar_event,style: ThemeText.w18b),
        SizedBox(height: 16),
        SizedBox(
            height: 260,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
                shrinkWrap: true,
                clipBehavior: Clip.none,
                itemCount: dateList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, idx) {
                  BannerModel item = dateList[idx];
                  return GestureDetector(
                      onTap: () {
                         eventId = item.id.toString();
         
                        Navigator.of(context)
                            .push(createRoute(const Details()));
                      },
                      child: SearchEventCard(
                          coverPhoto: item.mainImageEvent,
                          name: item.name));
                })),
                
      ],
    );
  }
}