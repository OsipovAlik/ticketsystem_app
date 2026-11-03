import 'package:flutter/material.dart';
import 'package:ticketsystem/theme/box_decoration.dart';
import 'package:ticketsystem/theme/custom_colors.dart';
import 'package:ticketsystem/theme/styles_text.dart';



class MyChip extends StatelessWidget {
  final Function onOpen;
  final String title;
  final Function onDelete;
  const MyChip({
    super.key, 
    required this.onOpen, 
    required this.title,
    required this.onDelete
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: MyBoxDecoration.filterBtn,
      padding:
          const EdgeInsets.only(left: 16.0, top: 8.0, right: 16.0, bottom: 8.0),
      child: Row(
        spacing: 8,
        children: [
          InkWell(
            onTap: ()=> onOpen(),
            child: Text(title, style: ThemeText.w16b)),
          InkWell(
            onTap: ()=> onDelete(),
            child: Icon(Icons.close,size: 20,color: CustomColors.textPrimary))
        ],
      ),
    );
  }
}