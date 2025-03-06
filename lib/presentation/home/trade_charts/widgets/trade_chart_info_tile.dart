import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roqqu_assessment/domain/constants/app_assets.dart';
import 'package:roqqu_assessment/domain/constants/app_constants.dart';
import 'package:roqqu_assessment/domain/constants/app_strings.dart';
import 'package:roqqu_assessment/domain/constants/app_textstyles.dart';
import 'package:roqqu_assessment/domain/extensions/widget_extensions.dart';
import 'package:roqqu_assessment/domain/theme/app_colors.dart';

class TradeChartInfoTile extends StatelessWidget {
  final String symbol;
  final String open;
  final String high;
  final String low;
  final String close;
  const TradeChartInfoTile({
    super.key,
    required this.symbol,
    required this.open,
    required this.high,
    required this.low,
    required this.close,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SvgPicture.asset(
            SvgAssets.caseArrowDownIcon,
            height: 30.ah,
          ),
          16.sbW,
          Text(
            symbol,
            style: AppTextStyles.body3Regular(context).copyWith(
              fontWeight: FontWeight.w500,
              color: Theme.of(context).hintColor,
            ),
          ),
          16.sbW,
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                AppStrings.o,
                style: AppTextStyles.body3Regular(context).copyWith(
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).hintColor,
                ),
              ),
              5.sbW,
              Text(
                open,
                style: AppTextStyles.body3Regular(context).copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.successGreen,
                ),
              ),
            ],
          ),
          16.sbW,
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                AppStrings.h,
                style: AppTextStyles.body3Regular(context).copyWith(
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).hintColor,
                ),
              ),
              5.sbW,
              Text(
                high,
                style: AppTextStyles.body3Regular(context).copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.successGreen,
                ),
              ),
            ],
          ),
          16.sbW,
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                AppStrings.l,
                style: AppTextStyles.body3Regular(context).copyWith(
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).hintColor,
                ),
              ),
              5.sbW,
              Text(
                low,
                style: AppTextStyles.body3Regular(context).copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.successGreen,
                ),
              ),
            ],
          ),
          16.sbW,
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                AppStrings.c,
                style: AppTextStyles.body3Regular(context).copyWith(
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).hintColor,
                ),
              ),
              5.sbW,
              Text(
                close,
                style: AppTextStyles.body3Regular(context).copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.successGreen,
                ),
              ),
            ],
          ),
          16.sbW,
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                AppStrings.charge,
                style: AppTextStyles.body3Regular(context).copyWith(
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).hintColor,
                ),
              ),
              5.sbW,
              Text(
                AppStrings.chargeAmount,
                style: AppTextStyles.body3Regular(context).copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.successGreen,
                ),
              ),
            ],
          ),
          16.sbW,
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                AppStrings.amplitude,
                style: AppTextStyles.body3Regular(context).copyWith(
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).hintColor,
                ),
              ),
              5.sbW,
              Text(
                AppStrings.amplitudeAmount,
                style: AppTextStyles.body3Regular(context).copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.successGreen,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
