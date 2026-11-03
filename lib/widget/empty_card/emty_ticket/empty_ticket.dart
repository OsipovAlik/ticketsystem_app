import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ticketsystem/generated/l10n.dart';
import 'package:ticketsystem/theme/custom_colors.dart';
import 'package:ticketsystem/theme/styles_text.dart';

import '../../shimmer/global_shimmer/global_shimmer.dart';

class EmptyTicket extends StatelessWidget {
  const EmptyTicket({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalShimmer(
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 120.0),
        height: MediaQuery.of(context).size.height / 1.9,
        child: Column(
          spacing: 22,
          children: [
            SvgPicture.asset(
              "lib/assets/svg/empty_ticket.svg",
              width: 150,
              height: 150,
              colorFilter: ColorFilter.mode(
                CustomColors.blueLight, // Inactive color
                BlendMode.srcIn,
              ),
            ),
            Text(S.current.empty_search_1, style: ThemeText.g18b)
          ],
        ),
      ),
    );
  }
}
