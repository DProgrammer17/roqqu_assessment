import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roqqu_assessment/domain/constants/app_strings.dart';
import 'package:roqqu_assessment/domain/network/apis/responses/candlesticks_api_response.dart';
import 'package:roqqu_assessment/domain/network/endpoints.dart';
import 'package:roqqu_assessment/presentation/home/notifiers/home_model.dart';
import 'package:roqqu_assessment/widgets/utility_widget/app_toast.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

final tradeChartsNotifier =
    NotifierProvider<TradeChartsNotifier, HomeModel>(() {
  return TradeChartsNotifier();
});

class TradeChartsNotifier extends Notifier<HomeModel> {
  @override
  HomeModel build() => HomeModel();

  void assignRenderControllerCandleSticks(ChartSeriesController controller) =>
      Future.delayed(
        const Duration(milliseconds: 300),
        () => state = state.copyWith(chartSeriesController: controller),
      );

  void setTradeChartsFilter(
      {required BuildContext context, required String interval}) {
    stopWebSocketConnection();
    state = state.copyWith(
      candleStickInterval: interval,
    );
    initCandleSticksSockets(context);
  }

  Future<void> initCandleSticksSockets(BuildContext context) async {
    state = state.copyWith(
      candleSticksData: [],
    );
    try {
      final klineStreamName =
          '${state.candleStickSymbol}@kline_${state.candleStickInterval.toLowerCase()}';
      final klineStreamDepth = '${state.candleStickSymbol}@depth20';
      state = state.copyWith(
        channel: WebSocketChannel.connect(Uri.parse(
            '${Endpoints.candleSticksBaseUrl}$klineStreamName')),
      );
      print('${Endpoints.candleSticksBaseUrl}$klineStreamName/$klineStreamDepth');
      await state.channel!.ready;
      state.channel!.stream.listen(
          (data) {
         //     print(data);
            state = state.copyWith(
              candleSticksData: state.candleSticksData.toList()
                ..add(
                  TradeChartData.fromJson(
                    jsonDecode(data),
                  ),
                ),
            );

            state.chartSeriesController?.updateDataSource(
              addedDataIndexes: [state.candleSticksData.length - 1],
            );
          },
          onDone: () => AppMessages.showInfoMessage(
                context: context,
                message: AppStrings.socketClosed,
              ),
          onError: (error) {
            if (error is WebSocketChannelException) {
              if (error.inner != null) {
                final err = error.inner as dynamic;
                print('Websocket inner error: ${err.message.toString()}');
              }
              print('Websocket error: ${error.message}');
            }
            AppMessages.showErrorMessage(
              context: context,
              message: error.toString(),
            );
          });
    } catch (e) {
      if (e is WebSocketChannelException) {
        if (e.inner != null) {
          final err = e.inner as dynamic;
          print('Websocket inner error: ${err.message.toString()}');
        }
        print('Websocket error: ${e.message}');
      }
      print(e.toString());
      if (context.mounted) {
        AppMessages.showErrorMessage(
          context: context,
          message: e.toString(),
        );
      }
    }
  }

  void stopWebSocketConnection()=> state.channel!.sink.close();
}
