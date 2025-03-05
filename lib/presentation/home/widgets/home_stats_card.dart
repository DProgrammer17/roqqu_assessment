import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roqqu_assessment/domain/constants/app_assets.dart';
import 'package:roqqu_assessment/domain/constants/app_constants.dart';
import 'package:roqqu_assessment/domain/constants/app_strings.dart';
import 'package:roqqu_assessment/domain/constants/app_textstyles.dart';
import 'package:roqqu_assessment/domain/extensions/widget_extensions.dart';
import 'package:roqqu_assessment/domain/theme/app_colors.dart';
import 'package:roqqu_assessment/presentation/home/widgets/stat_info_tile.dart';
import 'package:roqqu_assessment/widgets/utility_widget/vertical_divider.dart';

class HomeStatsCard extends StatelessWidget {
  const HomeStatsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColorLight,
      padding: EdgeInsets.all(26.ar),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                ImageAssets.cryptoIcons,
                height: 32.ah,
              ),
              8.sbW,
              Text(
                AppStrings.cryptoBaseOptions,
                style: AppTextStyles.h4(context).copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              16.sbW,
              SvgPicture.asset(
                SvgAssets.chevronIcon,
                height: 10.ah,
              ),
              23.sbW,
              Text(
                AppStrings.cryptoBaseCost,
                style: AppTextStyles.h4(context).copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.successGreen,
                ),
              )
            ],
          ),
          14.sbH,
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children:  [
                const StatInfoTile(
                  icon: SvgAssets.clockIcon,
                  header: AppStrings.change24,
                  info: AppStrings.changeBaseText,
                  infoColor: AppColors.successGreen,
                ),
                SizedBox(height: 48.ah, child: const AppVerticalDivider()),
                StatInfoTile(
                  icon: SvgAssets.arrowUpIcon,
                  header: AppStrings.high24,
                  info: AppStrings.changeBaseText,
                  infoColor: Theme.of(context).primaryColor,
                ),
                const AppVerticalDivider(),
                StatInfoTile(
                  icon: SvgAssets.arrowDownIcon,
                  header: AppStrings.low24,
                  info: AppStrings.changeBaseText,
                  infoColor: Theme.of(context).primaryColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
