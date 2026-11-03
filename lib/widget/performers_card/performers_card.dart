import 'package:flutter/material.dart';
import 'package:ticketsystem/theme/box_decoration.dart';
import 'package:ticketsystem/theme/styles_text.dart';
import 'package:ticketsystem/widget/global_cash_img/global_cash_img.dart';

class PerformersCard extends StatelessWidget {
  final String title;
  final String coverPhoto;
  const PerformersCard(
      {super.key, required this.title, required this.coverPhoto});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 160,
          width: 160,
          alignment: Alignment.center,
          decoration: MyBoxDecoration.castWidth1,
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(12.0),
            decoration: MyBoxDecoration.castWidth2,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: Center(child: GlobalCashImg(photo: coverPhoto, fit: BoxFit.cover, height: 160,width: 160))),
          ),
        ),
        SizedBox(height: 16),
        Flexible(child: Text(title,style: ThemeText.w18b,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        maxLines: 2,
        ))
      ],
    );
  }
}


