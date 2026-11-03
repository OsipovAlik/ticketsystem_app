import 'package:flutter/material.dart';
import 'package:ticketsystem/providers/event_details_provider/model/event_details_model.dart';
import 'package:ticketsystem/widget/performers_card/performers_card.dart';

class Performers extends StatelessWidget {
  final List<PerformersModel> bannerList;
  const Performers({super.key, required this.bannerList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: ListView.builder(
          clipBehavior: Clip.none,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: bannerList.length,
          itemBuilder: (context, idx) {
            final double widthPad = bannerList.length == 2 ? 16.0 : 8.0;
            PerformersModel item = bannerList[idx];
            return Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: widthPad), // Add spacing between items
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 2.5, // Adjust width for 2 items
                child: PerformersCard(title: item.name, coverPhoto: item.image),
              ),
            );
          }),
    );
  }
}
