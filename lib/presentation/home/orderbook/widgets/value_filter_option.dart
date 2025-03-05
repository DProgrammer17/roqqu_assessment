import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roqqu_assessment/domain/constants/app_constants.dart';

class ValueFilterOption extends StatelessWidget {
  final VoidCallback onPressed;
  final String value;
  final String icon;
  final bool selected;
  const ValueFilterOption({
    super.key,
    required this.onPressed,
    required this.value,
    required this.icon,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 11.ah, horizontal: 10.aw),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.ar),
          color: selected ? Theme.of(context).focusColor : Colors.transparent,
        ),
        child: SvgPicture.asset(
          icon,
          height: 11.ah,
        ),
      ),
    );
  }
}
