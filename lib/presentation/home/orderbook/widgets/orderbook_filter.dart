import 'package:flutter/material.dart';
import 'package:roqqu_assessment/domain/constants/app_assets.dart';
import 'package:roqqu_assessment/domain/constants/app_strings.dart';
import 'package:roqqu_assessment/domain/extensions/widget_extensions.dart';
import 'package:roqqu_assessment/presentation/home/orderbook/widgets/value_filter_option.dart';

class OrderBookFilter extends StatelessWidget {
  const OrderBookFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ValueFilterOption(
              onPressed: () {},
              value: AppStrings.highLow,
              icon: SvgAssets.highLowValIcon,
            ),
            6.sbW,
            ValueFilterOption(
              onPressed: () {},
              value: AppStrings.highVal,
              icon: SvgAssets.highValIcon,
            ),
            6.sbW,
            ValueFilterOption(
              onPressed: () {},
              value: AppStrings.lowVal,
              icon: SvgAssets.lowValIcon,
            ),
          ],
        ),
      ],
    );
  }
}
