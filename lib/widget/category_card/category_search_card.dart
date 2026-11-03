import 'package:flutter/material.dart';
import 'package:ticketsystem/theme/box_decoration.dart';
import 'package:ticketsystem/theme/styles_text.dart';
import 'package:ticketsystem/widget/global_cash_img/global_cash_img.dart';

import '../../providers/category_provider/model/category_model.dart';


class CategorySearchCard extends StatelessWidget {
  final CategoryModel data;
const CategorySearchCard({ super.key, required this.data});

  @override
  Widget build(BuildContext context){
    return Container(
      decoration: MyBoxDecoration.ticketCard,
      padding: EdgeInsets.only(left: 8.0, top: 18.0,right: 8.0, bottom: 18.0),
      // margin: const EdgeInsets.only(right: 12.0, bottom: 12.0),
      child: Column(
        children: [
          GlobalCashImg(photo: data.icon, fit: BoxFit.cover, width: 35,height: 35),
          SizedBox(height: 12),
          Text(data.name, style: ThemeText.w16b),
        ],
      ),
    );
  }
}