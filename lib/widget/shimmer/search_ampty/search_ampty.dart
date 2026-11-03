import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ticketsystem/generated/l10n.dart';
import '../../../theme/styles_text.dart';

class SearchAmpty extends StatelessWidget {
  const SearchAmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 120),
        Lottie.asset('lib/assets/lottie/empty.json',
        width: 180,
        height: 180,
        fit: BoxFit.fill,  frameRate: FrameRate.max),
        SizedBox(height: 50),
        SizedBox(
          width: 300,
          child: Text(S.current.empty_search_1, style: ThemeText.t16b,
          maxLines: 2,textAlign: TextAlign.center,),
        )
      ],
    );
  }
}
