import 'package:flutter/material.dart';
import 'package:roqqu_assessment/domain/constants/app_constants.dart';
import 'package:roqqu_assessment/domain/constants/app_strings.dart';
import 'package:roqqu_assessment/domain/constants/app_textstyles.dart';

class OrderBookHeader extends StatelessWidget{
  const OrderBookHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.aw),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppStrings.priceUSDT,
            style: AppTextStyles.body1Regular(context).copyWith(
              fontWeight: FontWeight.w500,
              color: Theme.of(context).hintColor,
            ),
          ),
          Text(
            AppStrings.amountsBTC,
            textAlign: TextAlign.right,
            style: AppTextStyles.body1Regular(context).copyWith(
              fontWeight: FontWeight.w500,
              color: Theme.of(context).hintColor,
            ),
          ),
          Text(
            AppStrings.total,
            textAlign: TextAlign.right,
            style: AppTextStyles.body1Regular(context).copyWith(
              fontWeight: FontWeight.w500,
              color: Theme.of(context).hintColor,
            ),
          ),
        ],
      ),
    );
  }

}