import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:ticketsystem/generated/l10n.dart';
import 'package:ticketsystem/global/global.dart';
import 'package:ticketsystem/presentation/event_past/event_past.dart';
import 'package:ticketsystem/providers/profile_provider/profile_provider.dart';
import 'package:ticketsystem/providers/tickets_provider/tickets_provider.dart';
import 'package:ticketsystem/theme/box_decoration.dart';
import 'package:ticketsystem/theme/custom_colors.dart';
import 'package:ticketsystem/theme/styles_text.dart';
import 'package:ticketsystem/widget/global_refresh_indecator.dart/my_refresh_indicator.dart';
import 'package:ticketsystem/widget/shimmer/ticket_emty_shimmer/ticket_emty_shimmer.dart';
import 'package:ticketsystem/widget/shimmer/tickets_shimmer/tickets_shimmer.dart';

class Tickets extends StatefulWidget {
  const Tickets({super.key});

  @override
  TicketsState createState() => TicketsState();
}

class TicketsState extends State<Tickets> {
  int? groupValue = 0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<TicketsProvider>(context, listen: false).getAllData(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return guest ? SafeArea(
      child: Scaffold(
         appBar: AppBar(
        backgroundColor: CustomColors.blueBold,
        centerTitle: true,
        title: Text(S.current.tickets, style: ThemeText.w16b),
      ),
          body: SizedBox(
            width: MediaQuery.sizeOf(context).width,
             height: MediaQuery.sizeOf(context).height / 1.6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
            // SizedBox(height: 120),
            Lottie.asset('lib/assets/lottie/empty.json',
            width: 180,
            height: 180,
            fit: BoxFit.fill,  frameRate: FrameRate.max),
            SizedBox(height: 50),
            Text(S.current.empty_ticket, style: ThemeText.t16b),
                  ],
                ),
          ),
          bottomNavigationBar:  Container(
            margin: EdgeInsets.only(left: 32.0, right: 32, bottom: 50),
            height: 50,
            decoration: MyBoxDecoration.ticketButton,
            child: ElevatedButton(
              onPressed: () {
                Provider.of<ProfileProvider>(context, listen: false).signIn(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
              ),
              child: Text(S.current.sign_in, style: ThemeText.w16b),
            )
          ),
      ),
    ):  CupertinoPageScaffold(
        backgroundColor: CustomColors.blueBold,
        child: MyRefreshIndicator(
          onRefresh: () async {
            Provider.of<TicketsProvider>(context, listen: false).onRefresh(context);
          },
          child: SafeArea(
            child: Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(top: 10.0),
              padding: EdgeInsets.all(10.0),
              child: Column(
                spacing: 32.0,
                children: [
                  // Text("Tickets",style: ThemeText.w16b,),
                  CupertinoSlidingSegmentedControl(
                      backgroundColor: CustomColors.blueTab,
                      thumbColor: CustomColors.blueLight,
                      proportionalWidth: true,
                      padding: EdgeInsets.all(2.0),
                      groupValue: groupValue,
                      children: {
                        0: _tabAppBar(S.current.upcoming_events, 0),
                        1: _tabAppBar(S.current.past_events, 1),
                      },
                      onValueChanged: (value) {
                        setState(() {
                          groupValue = value;
                        });
                      }),
                  groupValue == 0 ?  _tabBodyUpcoming() : _tabBodyPast()
                ],
              ),
            ),
          ),
        )
        );
   
  }

  Widget _tabAppBar(String title, index) {
    return Container(
        padding: EdgeInsets.all(4.0),
        child: Text(title,textAlign: TextAlign.center,
            style: groupValue == index ? ThemeText.c16b : ThemeText.w16b));
  }



  Widget _tabBodyUpcoming() {
    return Consumer<TicketsProvider>(builder:
        (BuildContext context, TicketsProvider provider, Widget? child) {
      if (provider.isVisible) {
        return const TicketsShimmer();
      } else if (provider.upcomingList.isEmpty) {
        return const TicketEmtyShimmer();
      } else {
        return SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: EventPast(pastList: provider.upcomingList),
        );
      }
    });
  }

  Widget _tabBodyPast() {
    return Consumer<TicketsProvider>(builder:(BuildContext context, TicketsProvider provider, Widget? child) {
      if (provider.isVisible) {
        return const TicketsShimmer();
      } else if (provider.pastList.isEmpty) {
        return const TicketEmtyShimmer();
      } else {
        return SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: EventPast(pastList: provider.pastList),
        );
      }
    });
  }

}
