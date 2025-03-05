import 'package:flutter/material.dart';
import 'package:roqqu_assessment/domain/extensions/widget_extensions.dart';
import 'package:roqqu_assessment/presentation/home/orders/trade_orders.dart';
import 'package:roqqu_assessment/presentation/home/widgets/app_bar_widget.dart';
import 'package:roqqu_assessment/presentation/home/widgets/home_stats_card.dart';
import 'package:roqqu_assessment/presentation/home/widgets/order_button_tile.dart';
import 'package:roqqu_assessment/presentation/home/widgets/trade_charts_card.dart';
import 'package:roqqu_assessment/widgets/page_widgets/app_scaffold.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const AppBarWidget(),
      padding: EdgeInsets.zero,
      body: ListView(
        shrinkWrap: true,
        children: [
          8.sbH,
          const HomeStatsCard(),
          8.sbH,
          const TradeChartsCard(),
          8.sbH,
          const TradeOrders(),
          62.sbH,
          const OrderButtonTile(),
          30.sbH,
        ],
      ),
    );
  }
}
