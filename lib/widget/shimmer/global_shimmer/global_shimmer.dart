import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../../theme/custom_colors.dart';

class GlobalShimmer extends StatelessWidget {
  final Widget child;
  final Color? baseColor;
  final Color? highlightColor;

  const GlobalShimmer({
    super.key,
    required this.child,
    this.baseColor,
    this.highlightColor,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? CustomColors.blueBold,
      highlightColor: highlightColor ?? const Color.fromARGB(255, 236, 236, 236),
      child: child,
    );
  }
}
