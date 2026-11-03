import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticketsystem/global/global.dart';
import 'package:ticketsystem/presentation/ticket_details_widget/ticket_details_widget.dart';
import 'package:ticketsystem/providers/ticket_details_provider/ticket_details_provider.dart';
import 'package:ticketsystem/theme/custom_colors.dart';
import 'package:ticketsystem/widget/global_refresh_indecator.dart/my_refresh_indicator.dart';
import 'package:ticketsystem/widget/shimmer/global_shimmer/global_shimmer.dart';
import 'package:ticketsystem/widget/shimmer/ticket_emty_shimmer/ticket_emty_shimmer.dart';
import 'package:ticketsystem/widget/shimmer/tickets_shimmer/tickets_shimmer.dart';
import 'package:ticketsystem/widget/ticket_detail_item_card/ticket_detail_item_card.dart';
import '../../theme/styles_text.dart';

class TicketDetails extends StatefulWidget {
  const TicketDetails({super.key});

  @override
  TicketDetailsState createState() => TicketDetailsState();
}

class TicketDetailsState extends State<TicketDetails> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<TicketDetailsProvider>(context, listen: false).getDetailsTickets(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: CustomColors.blueBold,
        centerTitle: true,
        title: Text(ticketTime, style: ThemeText.g18b),
      ),
      body: MyRefreshIndicator(
          onRefresh: () async {
            Provider.of<TicketDetailsProvider>(context, listen: false)
                .getDetailsTickets(context);
          },
          child: Container(
            padding: EdgeInsets.all(16.0),
            width: MediaQuery.of(context).size.width,
            color: CustomColors.blueBold,
            child: Consumer<TicketDetailsProvider>(builder:
                (BuildContext context, TicketDetailsProvider provider,Widget? widget) {
              if (provider.isVisible) {
                return _loadShimmer(provider);
              } else if (provider.list.isEmpty) {
                return const TicketEmtyShimmer();
              } else {
                return Column(
                  children: [
                    TicketDetailItemCard(event: provider.list[0]),
                    Text(provider.list[0].eventInfo.address,
                        style: ThemeText.w16b, textAlign: TextAlign.center),
                    SizedBox(height: 22.0),
                    TicketDetailsWidget(list: provider.list),
                  ],
                );
              }
            }),
          )),
    );
  }

  Widget _loadShimmer(TicketDetailsProvider provider) {
    return GlobalShimmer(
        child: Column(
      children: [
        const TicketsShimmer(),
        Text("", style: ThemeText.w18b, textAlign: TextAlign.center),
        SizedBox(height: 22.0),
        TicketDetailsWidget(list: provider.list),
      ],
    ));
  }
}
