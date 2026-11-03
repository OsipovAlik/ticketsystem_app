import 'package:flutter/material.dart';
import 'package:ticketsystem/theme/custom_colors.dart';


class GlobalRefreshIndicator extends StatelessWidget {
  final Future<void> Function() onRefresh;
  final ScrollController? scrollController;
  final Widget child;

  const GlobalRefreshIndicator({super.key, required this.onRefresh, required this.child, this.scrollController});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        color: CustomColors.cyan,
        backgroundColor: Colors.white,
        onRefresh: onRefresh,
        triggerMode: RefreshIndicatorTriggerMode.onEdge,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
                  controller: scrollController,
                  child: child,
                ));
  }
}
