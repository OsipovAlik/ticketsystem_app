import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ticketsystem/generated/l10n.dart';
import '../../../theme/styles_text.dart';

class FavoriteEmptyShimmer extends StatelessWidget {
  const FavoriteEmptyShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height / 1.6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 50,
        children: [
          Lottie.asset('lib/assets/lottie/fav.json',
              delegates: LottieDelegates(
                values: [
                  ValueDelegate.color(
                    const ['LayerName', '**'], // Replace with your layer name
                    value: Colors.red, // Change to your desired color
                  ),
                ],
              ),
              width: 180,
              height: 180,
              fit: BoxFit.fill),
          Text(S.current.favorite_empty, style: ThemeText.t16b)
        ],
      ),
    );
  }
}
