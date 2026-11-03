import 'package:flutter/material.dart';
import 'package:ticketsystem/theme/custom_colors.dart';

class MyRefreshIndicator extends StatelessWidget {
  final Future<void> Function() onRefresh;
  final ScrollController? scrollController;
  final Widget child;

  const MyRefreshIndicator(
      {super.key,
      required this.onRefresh,
      required this.child,
      this.scrollController});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => RefreshIndicator(
        color: CustomColors.cyan,
        backgroundColor: Colors.white,
        onRefresh: onRefresh,
        triggerMode: RefreshIndicatorTriggerMode.onEdge,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: constraints.maxWidth,
              minHeight: constraints.maxHeight,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
