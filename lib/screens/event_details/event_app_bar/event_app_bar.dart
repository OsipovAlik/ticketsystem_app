import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ticketsystem/providers/event_details_provider/model/event_details_model.dart';
import 'package:ticketsystem/theme/box_decoration.dart';
// import 'package:ticketsystem/theme/box_decoration.dart';
import 'package:ticketsystem/theme/custom_colors.dart';
import 'package:ticketsystem/widget/global_cash_img/global_cash_img.dart';

class EventAppBar extends StatelessWidget {
  final EventDetailsModel data;
  final Function addFavorite;
  const EventAppBar({super.key, required this.data, required this.addFavorite});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: CustomColors.blueBold,
      surfaceTintColor: CustomColors.blueBold,
      forceElevated: false,
      pinned: true,
      floating: false,
      snap: false,
      expandedHeight: MediaQuery.sizeOf(context).height / 1.9,
      flexibleSpace: FlexibleSpaceBar(
        background: GlobalCashImg(
          photo: data.posterImageEvent,
          fit: BoxFit.cover,
        ),
      ),
      leadingWidth: 100,
      leading: Row(
        children: [
          const SizedBox(width: 8),
          InkWell(
            splashColor: Colors.transparent,
            onTap: () {
                Navigator.of(context).pop();
              },
            child: Container(
              padding: EdgeInsets.all(12.0),
              decoration: MyBoxDecoration.link,
              child: SizedBox(
                  child: SvgPicture.asset(
                "lib/assets/svg/back.svg",
                width: 22,
                height: 22,
                colorFilter: const ColorFilter.mode(
                  Colors.white, // Inactive color
                  BlendMode.srcIn,
                ),
              )),
            ),
          ),
        ],
      ),
      actions: [
        // GestureDetector(
        //   onTap: () {
        //     Share.share(
        //       'Check out this awesome content!',
        //       subject: 'Amazing Content',
        //     );
        //   },
        //   child: SizedBox(
        //       // padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        //       // alignment: Alignment.center,
        //       // decoration: MyBoxDecoration.link,
        //       child: SvgPicture.asset(
        //         "lib/assets/svg/share.svg",
        //         width: 25,
        //         height: 25,
        //         colorFilter: const ColorFilter.mode(
        //           Colors.white, // Inactive color
        //           BlendMode.srcIn,
        //         ),
        //       )),
        // ),
        const SizedBox(
          width: 4,
        ),
        InkWell(
           onTap: () {
              addFavorite(context, data);
            },
           splashColor: Colors.transparent,
          child: Container(
            margin: EdgeInsets.only(right: 8.0),
            padding: EdgeInsets.all(8.0),
            decoration: MyBoxDecoration.link,
            child: Icon(
              data.isFavorite ? Icons.favorite : Icons.favorite_border,
              color: data.isFavorite ? CustomColors.cyan : Colors.white,
              size: 28,
            ),
          ),
        )
      ],
    );
  }
}
