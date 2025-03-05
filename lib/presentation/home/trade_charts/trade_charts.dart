import 'package:flutter/material.dart';
import 'package:roqqu_assessment/presentation/home/trade_charts/widgets/trade_chart_filter.dart';

class TradeCharts extends StatelessWidget{
  const TradeCharts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TradeChartFilter(),
      ],
    );
  }

}