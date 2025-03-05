import 'package:flutter/material.dart';
import 'package:roqqu_assessment/domain/constants/app_textstyles.dart';
import 'package:roqqu_assessment/domain/extensions/widget_extensions.dart';

class BuyValueDetailTile extends StatelessWidget {
  final String title;
  final String titleInfo;
  final String? subtitle;
  final Widget? subtitleWidget;
  const BuyValueDetailTile({
    super.key,
    required this.title,
    required this.titleInfo,
    this.subtitle,
    this.subtitleWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: AppTextStyles.body1Regular(context).copyWith(
                fontWeight: FontWeight.w500,
                color: Theme.of(context).primaryColorDark,
              ),
            ),
            subtitleWidget ?? Text(
              subtitle ?? '',
              style: AppTextStyles.body1Regular(context).copyWith(
                fontWeight: FontWeight.w500,
                color: Theme.of(context).primaryColorDark,
              ),
            ),
          ],
        ),
        8.sbH,
        Text(
          titleInfo,
          style: AppTextStyles.body2Regular(context).copyWith(
            fontWeight: FontWeight.w700,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }
}
