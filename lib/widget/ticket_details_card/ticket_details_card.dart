import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ticketsystem/theme/custom_colors.dart';
import 'package:ticketsystem/theme/styles_text.dart';
import 'package:ticketsystem/widget/global_cash_img/global_cash_img.dart';
import 'package:ticketsystem/widget/price_pattern/price_pattern.dart';
import '../../providers/ticket_details_provider/model/ticket_details_model.dart';

class TicketDetailsCard extends StatelessWidget {
  final TicketDetailsModel event;
  const TicketDetailsCard({
    super.key,
    required this.event,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 16.0),
        child: Stack(
          children: [
            SvgPicture.asset("lib/assets/svg/tickets.svg",
                colorFilter: ColorFilter.mode(
                  CustomColors.blueLight, // Inactive color
                  BlendMode.srcATop,
                ),
                height: 110,
                width: MediaQuery.sizeOf(context).width,
                fit: BoxFit.fill),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 90,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 4.0,top: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(event.ticketSeatInfo, style: ThemeText.w16b),
                          Container(
                            margin:EdgeInsets.only(bottom: 4.0),
                            child: PricePattern(price: event.price, style: ThemeText.w14b))
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTapDown: (details) => details,
                    onTap: () {
                      showDialog<void>(
                          useRootNavigator: false,
                          barrierDismissible: true,
                          context: context,
                          builder: (context) {
                            return Dismissible(
                              key: Key('unique-key'),
                              direction: DismissDirection.none,
                              child: Container(
                                color: CustomColors.blueLight,
                                child: Stack(
                                  children: [
                                    Center(
                                      child: InteractiveViewer(
                                          clipBehavior: Clip.none,
                                          child: GlobalCashImg(
                                              photo: event.qrImage,
                                              fit: BoxFit.cover)),
                                    ),
                                    Positioned(
                                        top: 120,
                                        child: SizedBox(
                                          width:
                                              MediaQuery.sizeOf(context).width,
                                          child: Text(event.ticketSeatInfo,
                                              textAlign: TextAlign.center,
                                              style: ThemeText.w22b),
                                        )),
                                    Positioned(
                                      top: 0,
                                      right: 0,
                                      child: IconButton(
                                        onPressed: () => Navigator.pop(context, false),
                                        icon: Icon(
                                          Icons.close,
                                          size: 30,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                    child: SizedBox(
                      width: 88,
                      height: 82,
                      child: GlobalCashImg(photo: event.qrImage, fit: BoxFit.contain),
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
