import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roqqu_assessment/domain/constants/app_assets.dart';
import 'package:roqqu_assessment/domain/constants/app_constants.dart';
import 'package:roqqu_assessment/domain/constants/app_strings.dart';
import 'package:roqqu_assessment/domain/extensions/widget_extensions.dart';
import 'package:roqqu_assessment/presentation/home/notifiers/orderbook_notifier.dart';
import 'package:roqqu_assessment/presentation/home/orderbook/widgets/value_filter_option.dart';
import 'package:roqqu_assessment/widgets/utility_widget/app_dropdown.dart';

class OrderBookFilter extends ConsumerWidget {
  const OrderBookFilter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ValueFilterOption(
              onPressed: () => ref.watch(orderBookNotifier.notifier).setFilterOption(AppStrings.highLow),
              value: AppStrings.highLow,
              icon: SvgAssets.highLowValIcon,
              selected: ref.watch(orderBookNotifier).orderBookFilter == AppStrings.highLow,
            ),
            6.sbW,
            ValueFilterOption(
              onPressed: () => ref.watch(orderBookNotifier.notifier).setFilterOption(AppStrings.highVal),
              value: AppStrings.highVal,
              icon: SvgAssets.lowValIcon,
              selected: ref.watch(orderBookNotifier).orderBookFilter == AppStrings.highVal,
            ),
            6.sbW,
            ValueFilterOption(
              onPressed: () => ref.watch(orderBookNotifier.notifier).setFilterOption(AppStrings.lowVal),
              value: AppStrings.lowVal,
              icon: SvgAssets.highValIcon,
              selected: ref.watch(orderBookNotifier).orderBookFilter == AppStrings.lowVal,
            ),
          ],
        ),
        AppDropDownField(
          list: ref.watch(orderBookNotifier).orderBookFilterOptions,
          labelText: '',
          width: 63.aw,
          onChanged: (val) => ref.watch(orderBookNotifier.notifier).setFilterLength(val),
        ),
      ],
    );
  }
}
