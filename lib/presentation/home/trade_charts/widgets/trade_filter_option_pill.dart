import 'package:flutter/material.dart';
import 'package:roqqu_assessment/domain/constants/app_constants.dart';
import 'package:roqqu_assessment/domain/constants/app_textstyles.dart';

class TradeFilterOptionPill extends StatelessWidget {
  final bool value;
  final String option;
  const TradeFilterOptionPill(
      {super.key, required this.option, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6.ah, horizontal: 12.aw),
      margin: EdgeInsets.symmetric(horizontal: 4.aw),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.ar),
        color: value ? Theme.of(context).focusColor : Colors.transparent,
      ),
      child: Text(
        option,
        style: AppTextStyles.body2Regular(context).copyWith(
          color:value ? Theme.of(context).primaryColor : Theme.of(context).hintColor,
        ),
      ),
    );
  }
}
