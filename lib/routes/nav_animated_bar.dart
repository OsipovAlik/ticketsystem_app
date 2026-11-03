import 'package:flutter/material.dart';
import 'package:ticketsystem/theme/custom_colors.dart';


class NavAnimatedBar extends StatelessWidget {
  final bool isActive;

  const NavAnimatedBar({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration:const Duration(milliseconds: 300),
      height: isActive ? 2.5 : 0,
      width: 35,
      color: isActive ? CustomColors.cyan  : Colors.transparent,
    );
  }
}
