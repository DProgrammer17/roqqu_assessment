import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roqqu_assessment/domain/constants/app_assets.dart';
import 'package:roqqu_assessment/domain/constants/app_constants.dart';
import 'package:roqqu_assessment/domain/constants/app_strings.dart';
import 'package:roqqu_assessment/domain/constants/app_textstyles.dart';
import 'package:roqqu_assessment/domain/extensions/widget_extensions.dart';
import 'package:roqqu_assessment/presentation/home/notifiers/home_model.dart';
import 'package:roqqu_assessment/presentation/home/notifiers/trade_charts_notifier.dart';
import 'package:roqqu_assessment/presentation/home/trade_charts/widgets/trade_filter_option_pill.dart';
import 'package:roqqu_assessment/widgets/utility_widget/vertical_divider.dart';

class TradeChartFilter extends ConsumerWidget {
  const TradeChartFilter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 70.ah,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              AppStrings.time,
              style: AppTextStyles.body2Regular(context).copyWith(
                color: Theme.of(context).hintColor,
              ),
            ),
            4.sbW,
            Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                ref.watch(tradeChartsNotifier).tradeFilterOptions.length,
                (index) => TradeFilterOptionPill(
                  option: ref
                      .watch(tradeChartsNotifier)
                      .tradeFilterOptions
                      .elementAt(index),
                  value: ref.watch(tradeChartsNotifier).candleStickInterval ==
                      ref
                          .watch(tradeChartsNotifier)
                          .tradeFilterOptions
                          .elementAt(index),
                  onTap: () => ref
                      .watch(tradeChartsNotifier.notifier)
                      .setTradeChartsFilter(
                        context: context,
                        interval: ref
                            .watch(tradeChartsNotifier)
                            .tradeFilterOptions
                            .elementAt(index),
                      ),
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.keyboard_arrow_down_sharp,
                color: Theme.of(context).hintColor,
                size: 28.ar,
              ),
            ),
            AppVerticalDivider(
              horizontalPadding: 4.aw,
              color: Theme.of(context).canvasColor,
            ),
            7.sbW,
            SvgPicture.asset(
              SvgAssets.filterIcon,
              color: Theme.of(context).hintColor,
              height: 30.ah,
            ),
            7.sbW,
            AppVerticalDivider(
              horizontalPadding: 4.aw,
              color: Theme.of(context).canvasColor,
            ),
            Text(
              AppStrings.fxIndicators,
              style: AppTextStyles.body2Regular(context).copyWith(
                color: Theme.of(context).hintColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
