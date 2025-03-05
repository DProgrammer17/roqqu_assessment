import 'package:flutter/material.dart';
import 'package:roqqu_assessment/domain/constants/app_constants.dart';
import 'package:roqqu_assessment/domain/constants/app_textstyles.dart';
import 'package:roqqu_assessment/domain/extensions/widget_extensions.dart';

class EmptyState extends StatelessWidget {
  final String title;
  final String subtitle;
  const EmptyState({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: AppTextStyles.h2(context).copyWith(
            fontSize: 17.asp,
            fontWeight: FontWeight.w700,
          ),
        ),
        8.sbH,
        Text(
          subtitle,
          style: AppTextStyles.body2Regular(context).copyWith(
            fontWeight: FontWeight.w500,
            color: Theme.of(context).primaryColorDark,
          ),
        ),
      ],
    );
  }
}
