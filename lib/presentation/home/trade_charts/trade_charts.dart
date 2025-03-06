import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:roqqu_assessment/domain/constants/app_constants.dart';
import 'package:roqqu_assessment/domain/constants/app_strings.dart';
import 'package:roqqu_assessment/domain/constants/app_textstyles.dart';
import 'package:roqqu_assessment/domain/extensions/widget_extensions.dart';
import 'package:roqqu_assessment/domain/network/apis/responses/candlesticks_api_response.dart';
import 'package:roqqu_assessment/domain/theme/app_colors.dart';
import 'package:roqqu_assessment/presentation/home/notifiers/trade_charts_notifier.dart';
import 'package:roqqu_assessment/presentation/home/trade_charts/widgets/trade_chart_filter.dart';
import 'package:roqqu_assessment/presentation/home/trade_charts/widgets/trade_chart_info_tile.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TradeCharts extends ConsumerStatefulWidget {
  const TradeCharts({super.key});

  @override
  ConsumerState<TradeCharts> createState() => _TradeChartsState();
}

class _TradeChartsState extends ConsumerState<TradeCharts> with AutomaticKeepAliveClientMixin{
  var formatter = NumberFormat('#,##,000');

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(tradeChartsNotifier.notifier).initCandleSticksSockets(context);
    });
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TradeChartFilter(),
          10.sbH,
          if(ref.watch(tradeChartsNotifier).candleSticksData.isNotEmpty)...[
            TradeChartInfoTile(
              symbol: ref
                  .watch(tradeChartsNotifier)
                  .candleSticksData
                  .last
                  .data
                  ?.symbol ??
                  '',
              open: ref
                  .watch(tradeChartsNotifier)
                  .candleSticksData
                  .last
                  .data
                  ?.k
                  ?.openPrice ??
                  '',
              high: ref
                  .watch(tradeChartsNotifier)
                  .candleSticksData
                  .last
                  .data
                  ?.k
                  ?.highPrice ??
                  '',
              low: ref
                  .watch(tradeChartsNotifier)
                  .candleSticksData
                  .last
                  .data
                  ?.k
                  ?.lowPrice ??
                  '',
              close: ref
                  .watch(tradeChartsNotifier)
                  .candleSticksData
                  .last
                  .data
                  ?.k
                  ?.closePrice ??
                  '',
            ),
          ],
          SizedBox(
            height: AppConstants.deviceWidth * 0.45,
            child: SfCartesianChart(
              primaryXAxis: CategoryAxis(
                labelStyle: AppTextStyles.body3Regular(context).copyWith(
                  color: Theme.of(context).hintColor,
                ),
              ),
              primaryYAxis: NumericAxis(
                interval: 300,
                opposedPosition: true,
                labelStyle: AppTextStyles.body3Regular(context).copyWith(
                  color: Theme.of(context).hintColor,
                ),
              ),
              tooltipBehavior: TooltipBehavior(enable: true),
              zoomPanBehavior: ZoomPanBehavior(
                enableDoubleTapZooming: true,
                enablePinching: true,
                enablePanning: true,
                enableSelectionZooming: true,
              ),
              series: <CartesianSeries<TradeChartData, String>>[
                CandleSeries(
                  width: 0.7,
                  spacing: 1,
                  onPointTap: (details) => print(details.dataPoints?.first),
                  onRendererCreated: (controller) => ref
                      .watch(tradeChartsNotifier.notifier)
                      .assignRenderControllerCandleSticks(controller),
                  dataSource: ref.watch(tradeChartsNotifier).candleSticksData,
                  xValueMapper: (TradeChartData trade, _) =>
                      '0${DateTime.fromMillisecondsSinceEpoch(trade.data!.eventCloseTimeStamp!).month.toString()}/${DateTime.fromMillisecondsSinceEpoch(trade.data!.eventCloseTimeStamp!).day.toString()}{${DateTime.fromMillisecondsSinceEpoch(trade.data!.eventCloseTimeStamp!).hour.toString()}:${DateTime.fromMillisecondsSinceEpoch(trade.data!.eventCloseTimeStamp!).minute.toString()}}',
                  lowValueMapper: (TradeChartData trade, _) =>
                      (trade.data!.u != null
                          ? trade.data!.u! / 100
                          : double.parse(trade.data!.k!.lowPrice!)),
                  highValueMapper: (TradeChartData trade, _) =>
                      (trade.data!.dataU != null
                          ? trade.data!.dataU! / 100
                          : double.parse(trade.data!.k!.highPrice!)),
                  openValueMapper: (TradeChartData trade, _) =>
                      (trade.data!.pu != null
                          ? trade.data!.pu! / 100
                          : double.parse(trade.data!.k!.openPrice!)),
                  closeValueMapper: (TradeChartData trade, _) =>
                      (trade.data!.pu != null
                          ? trade.data!.pu! / 100
                          : double.parse(trade.data!.k!.closePrice!)),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 2.ah,
            color: Theme.of(context).canvasColor,
          ),
          10.sbH,
    if(ref.watch(tradeChartsNotifier).candleSticksData.isNotEmpty)...[
      Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                AppStrings.volSymbol(symbol: ref
                    .watch(tradeChartsNotifier)
                    .candleSticksData
                    .last
                    .data
                    ?.symbol ??
                    '',),
                style: AppTextStyles.body3Regular(context).copyWith(
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).hintColor,
                ),
              ),
              5.sbW,
              Text(
              ref
                  .watch(tradeChartsNotifier)
                  .candleSticksData
                  .last
                  .data
                  ?.k?.quoteVolume ??
              '',
                style: AppTextStyles.body3Regular(context).copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.dustyOrange,
                ),
              ),
            ],
          ),
          ],
          5.sbH,
          SizedBox(
            height: AppConstants.deviceWidth * 0.45,
            child: SfCartesianChart(
              primaryXAxis: CategoryAxis(
                labelStyle: AppTextStyles.body3Regular(context).copyWith(
                  color: Theme.of(context).hintColor,
                ),
              ),
              primaryYAxis: NumericAxis(
                interval: 300,
                opposedPosition: true,
                labelStyle: AppTextStyles.body3Regular(context).copyWith(
                  color: Theme.of(context).hintColor,
                ),
              ),
              tooltipBehavior: TooltipBehavior(enable: true),
              zoomPanBehavior: ZoomPanBehavior(
                enableDoubleTapZooming: true,
                enablePinching: true,
                enablePanning: true,
                enableSelectionZooming: true,
              ),
              series: <CartesianSeries<TradeChartData, String>>[
                ColumnSeries(
                  spacing: 1,
                  isTrackVisible: true,
                  onRendererCreated: (controller) => ref
                      .watch(tradeChartsNotifier.notifier)
                      .assignRenderControllerCandleSticks(controller),
                  dataSource: ref.watch(tradeChartsNotifier).candleSticksData,
                  xValueMapper: (TradeChartData trade, _) =>
                      '0${DateTime.fromMillisecondsSinceEpoch(trade.data!.eventCloseTimeStamp!).month.toString()}/${DateTime.fromMillisecondsSinceEpoch(trade.data!.eventCloseTimeStamp!).day.toString()}{${DateTime.fromMillisecondsSinceEpoch(trade.data!.eventCloseTimeStamp!).hour.toString()}:${DateTime.fromMillisecondsSinceEpoch(trade.data!.eventCloseTimeStamp!).minute.toString()}}',
                  yValueMapper: (TradeChartData trade, _) =>
                      (trade.data!.u != null
                          ? trade.data!.u! / 100
                          : double.parse(trade.data!.k!.assetVolume!)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
