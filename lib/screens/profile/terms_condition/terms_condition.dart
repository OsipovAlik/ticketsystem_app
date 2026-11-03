import 'package:flutter/material.dart';
import 'package:ticketsystem/generated/l10n.dart';
import 'package:ticketsystem/theme/custom_colors.dart';
import 'package:ticketsystem/theme/styles_text.dart';
import 'package:ticketsystem/widget/app_bar_ticket/app_bar_ticket.dart';


class TermsCondition extends StatelessWidget {
const TermsCondition({ super.key });

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarTicket(context: context, title: S.current.settings),
      backgroundColor: CustomColors.blueBold,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(S.current.terms_info,style:ThemeText.w16b),
        ),
      )
    );
  }
}