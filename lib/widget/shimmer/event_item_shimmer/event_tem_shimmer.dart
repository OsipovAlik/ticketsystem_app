import 'package:flutter/material.dart';
import 'package:ticketsystem/theme/box_decoration.dart';
import '../global_shimmer/global_shimmer.dart';


class EventTemShimmer extends StatelessWidget {
const EventTemShimmer({ super.key });

  @override
  Widget build(BuildContext context){
  return GlobalShimmer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 14),
          Wrap(
            runSpacing: 7.0,
            children: List.generate(8, (index) {
              return FractionallySizedBox(
                alignment: Alignment.center,
                widthFactor: 0.5,
                child: Container(
                  width: (MediaQuery.of(context).size.width / 2) - 16,
                  margin: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        decoration: MyBoxDecoration.loadCard,
                        height: 260,
                        width: MediaQuery.of(context).size.width,
                        child: SizedBox.shrink(),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        width: MediaQuery.of(context).size.width,
                          decoration: MyBoxDecoration.loadCard, height: 22),
                      const SizedBox(height: 12),
                      Container(
                           width: MediaQuery.of(context).size.width ,
                          decoration: MyBoxDecoration.loadCard, height: 22),
                      const SizedBox(height: 12),
                      Container(
                          decoration: MyBoxDecoration.loadCard, height: 22),
                    ],
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}



