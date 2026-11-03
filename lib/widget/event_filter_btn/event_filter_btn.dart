import 'package:flutter/material.dart';
import 'package:ticketsystem/theme/box_decoration.dart';
import 'package:ticketsystem/theme/styles_text.dart';

class EventFilterBtn extends StatelessWidget {
  final Function onTap;
  final String title;
  const EventFilterBtn({super.key, required this.onTap, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> onTap(),
      child: Container(
        decoration: MyBoxDecoration.filterBtn,
        padding:
            const EdgeInsets.only(left: 16.0, top: 8.0, right: 16.0, bottom: 8.0),
        child: Text(title, style: ThemeText.w16b),
      ),
    );
  }
}
