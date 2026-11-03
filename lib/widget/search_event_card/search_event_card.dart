import 'package:flutter/material.dart';
import 'package:ticketsystem/theme/styles_text.dart';
import '../global_cash_img/global_cash_img.dart';

class SearchEventCard extends StatelessWidget {
  final String coverPhoto;
  final String name;
  const SearchEventCard({super.key,required this.coverPhoto, required this.name});

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width / 1.1;
    return Container(
      margin: EdgeInsets.only(right: 8.0),
         alignment: Alignment.center,
          width: maxWidth,
       height: MediaQuery.of(context).size.width / 1.9,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              child: AspectRatio(
                aspectRatio: 1.9,
                child: GlobalCashImg(photo: coverPhoto, fit: BoxFit.cover))),
                  SizedBox(height: 12),
              SizedBox(
                width: maxWidth,
                child: Text(name, style: ThemeText.w16b, maxLines: 1, overflow: TextOverflow.ellipsis,))
        ],
      ),
    );
  }
}
