import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roqqu_assessment/domain/constants/app_assets.dart';
import 'package:roqqu_assessment/domain/constants/app_constants.dart';
import 'package:roqqu_assessment/domain/constants/app_textstyles.dart';
import 'package:roqqu_assessment/domain/extensions/widget_extensions.dart';
import 'package:roqqu_assessment/domain/theme/app_colors.dart';

class OrderBookComparisonTile extends StatelessWidget{
  final String bPrice;
  final String aPrice;
  const OrderBookComparisonTile({super.key, required this.bPrice, required this.aPrice,});

  @override
  Widget build(BuildContext context) {
    bool higher = double.parse(bPrice) > double.parse(aPrice);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.ah),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            bPrice,
            style: AppTextStyles.h3(context).copyWith(
              fontWeight: FontWeight.w500,
              color: !higher ? AppColors.dustyOrange: AppColors.successGreen,
            ),
          ),
          8.sbW,
          SvgPicture.asset(
            higher ? SvgAssets.arrowUpIcon : SvgAssets.arrowDownIcon,
            height: 30.ah,
            color: !higher ? AppColors.dustyOrange: AppColors.successGreen,
          ),
          8.sbW,
          Text(
            aPrice,
            style: AppTextStyles.h3(context).copyWith(
              fontWeight: FontWeight.w500,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }

}