import 'package:flutter/material.dart';
import 'package:roqqu_assessment/domain/constants/app_constants.dart';
import 'package:roqqu_assessment/domain/constants/app_textstyles.dart';
import 'package:roqqu_assessment/domain/extensions/widget_extensions.dart';
import 'package:roqqu_assessment/domain/theme/app_colors.dart';

class OrderBookDataTile extends StatelessWidget {
  final String price;
  final String amount;
  final bool up;
  const OrderBookDataTile({
    super.key,
    required this.price,
    required this.amount,
    required this.up,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.ah, horizontal: 16.aw),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            price,
            style: AppTextStyles.body1Regular(context).copyWith(
              fontWeight: FontWeight.w500,
              color: up ? AppColors.dustyOrange: AppColors.successGreen,
            ),
          ),
          2.sbW,
          Text(
            amount,
            textAlign: TextAlign.right,
            style: AppTextStyles.body1Regular(context).copyWith(
              fontWeight: FontWeight.w500,
              color: Theme.of(context).primaryColor,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 6.ah, horizontal: 16.aw),
            color: up ? AppColors.dustyOrange: AppColors.successGreen,
            child: Text(
              (double.parse(price) * double.parse(amount)).toStringAsFixed(2),
              textAlign: TextAlign.right,
              style: AppTextStyles.body1Regular(context).copyWith(
                fontWeight: FontWeight.w500,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
