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

final orderBookNotifier = NotifierProvider<OrderBookNotifier, HomeModel>(() {
  return OrderBookNotifier();
});

class OrderBookNotifier extends Notifier<HomeModel> {
  @override
  HomeModel build() => HomeModel();

  void setFilterLength (String value)=> state = state.copyWith(orderBookFilterLength: value);

  void setFilterOption (String value)=> state = state.copyWith(orderBookFilter: value);

  Future<void> initOrderBookSockets(BuildContext context) async {
    state = state.copyWith(
      candleSticksData: [],
    );
    try {
      final klineStreamDepth = '${state.candleStickSymbol}@depth20';
      state = state.copyWith(
        orderBookChannel: WebSocketChannel.connect(
            Uri.parse('${Endpoints.candleSticksBaseUrl}$klineStreamDepth')),
      );
      print(
          '${Endpoints.candleSticksBaseUrl}$klineStreamDepth/$klineStreamDepth');
      await state.orderBookChannel!.ready;
      state.orderBookChannel!.stream.listen(
          (data) {
          //  print(data);
            state = state.copyWith(
              orderBookData: state.orderBookData.toList()
                ..add(
                  TradeChartData.fromJson(
                    jsonDecode(data),
                  ),
                ),
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

  void stopWebSocketConnection() => state.orderBookChannel!.sink.close();
}
