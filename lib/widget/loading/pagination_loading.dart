import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ticketsystem/theme/custom_colors.dart';
import 'package:ticketsystem/widget/shimmer/global_shimmer/global_shimmer.dart';

class PaginationLoading extends StatelessWidget {
  final bool visible;
  const PaginationLoading({super.key, required this.visible});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 28.0),
        child: GlobalShimmer(
            baseColor: CustomColors.inputBlue,
            child: SvgPicture.asset('lib/assets/svg/dots.svg',
                width: 40, height: 40)),
      ),
    );
  }
}
