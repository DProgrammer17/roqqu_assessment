import 'package:flutter/material.dart';
import 'package:roqqu_assessment/domain/constants/app_constants.dart';
import 'package:roqqu_assessment/domain/constants/app_textstyles.dart';
import 'package:roqqu_assessment/domain/extensions/widget_extensions.dart';
import 'package:roqqu_assessment/presentation/home/notifiers/home_model.dart';
import 'package:roqqu_assessment/presentation/home/orderbook/orderbook.dart';
import 'package:roqqu_assessment/presentation/home/trade_charts/trade_charts.dart';

class TradeChartsCard extends StatelessWidget {
  const TradeChartsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConstants.deviceHeight * 0.6,
      padding: EdgeInsets.all(16.ar),
      color: Theme.of(context).primaryColorLight,
      child: DefaultTabController(
        length: 3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(3.ar),
              decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                borderRadius: BorderRadius.circular(8.ar),
              ),
              child: TabBar(
                unselectedLabelColor: Theme.of(context).hintColor,
                labelColor: Theme.of(context).primaryColor,
                indicatorColor: Theme.of(context).primaryColorLight,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.ar),
                  color: Theme.of(context).primaryColorLight,
                ),
                tabs: List.generate(
                  HomeModel().tradeTabOptions.length,
                  (index) => Tab(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 5.ah, horizontal: 5.aw),
                      child: Text(
                        HomeModel().tradeTabOptions.elementAt(index),
                        style: AppTextStyles.body1Regular(context).copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            16.sbH,
            const Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  TradeCharts(),
                  OrderBook(),
                  SizedBox.shrink(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
