import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roqqu_assessment/domain/constants/app_assets.dart';
import 'package:roqqu_assessment/domain/constants/app_constants.dart';
import 'package:roqqu_assessment/domain/constants/app_strings.dart';
import 'package:roqqu_assessment/domain/constants/app_textstyles.dart';
import 'package:roqqu_assessment/domain/extensions/widget_extensions.dart';
import 'package:roqqu_assessment/domain/theme/app_colors.dart';
import 'package:roqqu_assessment/presentation/home/buy_and_sell/widget/buy_info_tile.dart';
import 'package:roqqu_assessment/presentation/home/buy_and_sell/widget/buy_value_detail_tile.dart';
import 'package:roqqu_assessment/presentation/home/notifiers/home_model.dart';
import 'package:roqqu_assessment/presentation/home/trade_charts/widgets/trade_filter_option_pill.dart';
import 'package:roqqu_assessment/widgets/utility_widget/app_button.dart';
import 'package:roqqu_assessment/widgets/utility_widget/app_checkbox.dart';
import 'package:roqqu_assessment/widgets/utility_widget/sisyphus_text_field.dart';

class BuyDetails extends StatelessWidget {
  const BuyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          4.sbH,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              HomeModel().buyOptions.length,
              (index) => TradeFilterOptionPill(
                option: HomeModel().buyOptions.elementAt(index),
                value: index == 0,
              ),
            ),
          ),
          20.sbH,
          BuyInfoTile(
            title: AppStrings.limitPrice,
            info: AppStrings.amountValue(
              amount: '0.00',
              currency: 'USD',
            ),
          ),
          20.sbH,
          BuyInfoTile(
            title: AppStrings.amount,
            info: AppStrings.amountValue(
              amount: '0.00',
              currency: 'USD',
            ),
          ),
          20.sbH,
          BuyInfoTile(
            title: AppStrings.type,
            info: AppStrings.amountValue(
              amount: '0.00',
              currency: 'USD',
            ),
          ),
          25.sbH,
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const AppCheckBox(
                value: false,
              ),
              8.sbW,
              Text(
                AppStrings.postOnly,
                style: AppTextStyles.body1Regular(context).copyWith(
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).primaryColorDark,
                ),
              ),
              4.sbW,
              Icon(
                Icons.info_outlined,
                size: 16.ar,
                color: Theme.of(context).primaryColorDark,
              ),
            ],
          ),
          25.sbH,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.total,
                style: AppTextStyles.body1Regular(context).copyWith(
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).primaryColorDark,
                ),
              ),
              Text(
                '0.00',
                style: AppTextStyles.body1Regular(context).copyWith(
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).primaryColorDark,
                ),
              ),
            ],
          ),
          25.sbH,
          AppButton(
            verticalPadding: 16.ah,
            title: AppStrings.buyBTC,
            gradient: AppColors.cryptoLinearGradient,
            textColor: AppColors.darkPrimaryText,
          ),
          20.sbH,
          Divider(
            thickness: 1.ah,
            color: Theme.of(context).canvasColor,
          ),
          20.sbH,
          BuyValueDetailTile(
            title: AppStrings.totalAccountValue,
            titleInfo: '0.00',
            subtitleWidget: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppStrings.ngn,
                  style: AppTextStyles.body1Regular(context).copyWith(
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).primaryColorDark,
                  ),
                ),
                3.sbW,
                SvgPicture.asset(
                  SvgAssets.chevronIcon,
                  height: 12.ah,
                  color: Theme.of(context).primaryColorDark,
                ),
              ],
            ),
          ),
          20.sbH,
          const BuyValueDetailTile(
            title: AppStrings.openOrders,
            titleInfo: '0.00',
            subtitle: AppStrings.available,
          ),
          20.sbH,
          AppButton(
            title: AppStrings.deposit,
            buttonColor: AppColors.classicBlue,
            width: 80.aw,
            textColor: AppColors.darkPrimaryText,
          )
        ],
      ),
    );
  }
}
