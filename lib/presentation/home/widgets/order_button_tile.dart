import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:roqqu_assessment/domain/constants/app_constants.dart';
import 'package:roqqu_assessment/domain/constants/app_strings.dart';
import 'package:roqqu_assessment/domain/extensions/widget_extensions.dart';
import 'package:roqqu_assessment/domain/theme/app_colors.dart';
import 'package:roqqu_assessment/presentation/home/buy_and_sell/buy_and_sell_modal.dart';
import 'package:roqqu_assessment/widgets/utility_widget/app_button.dart';

class OrderButtonTile extends StatelessWidget {
  const OrderButtonTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.ar),
      color: Theme.of(context).primaryColorLight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 1,
            child: AppButton(
              title: AppStrings.buy,
              buttonColor: AppColors.successGreen,
              textColor: AppColors.darkPrimaryText,
              onTap: () async => await showMaterialModalBottomSheet(
                backgroundColor: Colors.transparent,
                context: context,
                builder: (context) => const BuyAndSellModal(),
              ),
            ),
          ),
          16.sbW,
          const Flexible(
            flex: 1,
            child: AppButton(
              title: AppStrings.sell,
              buttonColor: AppColors.failRed,
              textColor: AppColors.darkPrimaryText,
            ),
          ),
        ],
      ),
    );
  }
}
