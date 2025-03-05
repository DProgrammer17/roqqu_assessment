import 'package:flutter/material.dart';
import 'package:roqqu_assessment/domain/constants/app_constants.dart';

class AppVerticalDivider extends StatelessWidget {
  final bool usePadding;
  final double? horizontalPadding;
  final Color? color;
  const AppVerticalDivider({
    super.key,
    this.usePadding = true,
    this.horizontalPadding,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: usePadding
          ? EdgeInsets.symmetric(horizontal: horizontalPadding ?? 8.aw)
          : EdgeInsets.zero,
      child: Container(
        height: 48.ah,
        width: 1.aw,
        decoration: BoxDecoration(
          color: color ?? Theme.of(context).primaryColorDark,
          borderRadius: BorderRadius.circular(1.ar),
        ),
      ),
    );
  }
}
