import 'package:flutter/material.dart';
import 'package:ticketsystem/widget/shimmer/global_shimmer/global_shimmer.dart';

class DetailShimmer extends StatelessWidget {
  const DetailShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalShimmer(
        child: Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Text("data"),
    ));
  }
}
