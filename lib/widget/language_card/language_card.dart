import 'package:flutter/material.dart';
import 'package:ticketsystem/theme/box_decoration.dart';
import '../../../theme/styles_text.dart';

class LanguageCard extends StatelessWidget {
  final bool visible;
  final String image;
  final String name;
  final String value;

  const LanguageCard(
      {super.key,
      required this.image,
      required this.name,
      required this.value,
      required this.visible,
});

  @override
  Widget build(BuildContext context) {
    return Container(
  // width: 128,
  alignment: Alignment.center,
  decoration: MyBoxDecoration.ticketCard,
  padding: EdgeInsets.symmetric(horizontal: 8.0),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center, // Center the content
    children: <Widget>[
      Container(
        padding: EdgeInsets.all(4.0),
        child: Image.asset(image, height: 18, width: 18),
      ),
      const SizedBox(width: 6),
      Text(
        name,
        style: visible ? ThemeText.c16b : ThemeText.w16b,
        textAlign: TextAlign.center, // Ensure text is centered
      ),
    ],
  ),
);

  }
}
