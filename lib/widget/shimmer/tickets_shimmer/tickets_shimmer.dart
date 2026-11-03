import 'package:flutter/material.dart';
import 'package:ticketsystem/theme/box_decoration.dart';
import 'package:ticketsystem/widget/global_cash_img/global_cash_img.dart';
import 'package:ticketsystem/widget/shimmer/global_shimmer/global_shimmer.dart';

class TicketsShimmer extends StatelessWidget {
  const TicketsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalShimmer(
      child: Container(
        width: (MediaQuery.of(context).size.width) - 16,
        margin: EdgeInsets.only(bottom: 8.0),
        height: 170,
        child: Row(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: MyBoxDecoration.pastBox,
              width: (MediaQuery.of(context).size.width / 3.2) - 16,
              child: AspectRatio(
                  aspectRatio: 0.78,
                  child: GlobalCashImg(photo: "", fit: BoxFit.cover)),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 24,
              children: [
                Container(
                  height: 4,
                  width: 100,
                  color: Colors.grey,
                ),
                Container(
                  height: 4,
                  width: 120,
                  color: Colors.grey,
                ),
                Container(
                  height: 4,
                  width: 150,
                  color: Colors.grey,
                ),
                 Container(
                  height: 4,
                  width: 200,
                  color: Colors.grey,
                ),
              ],
            ),
            
          ],
        ),
      ),
    );
  }
}
