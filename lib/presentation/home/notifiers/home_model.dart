import 'package:roqqu_assessment/domain/constants/app_strings.dart';
import 'package:roqqu_assessment/domain/network/apis/responses/candlesticks_api_response.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class HomeModel{
  final List<String> tradeTabOptions;
  final List<String> tradeFilterOptions;
  final List<String> tradeOrderOptions;
  final List<String> buySellOptions;
  final List<String> buyOptions;
  final List<String> orderBookFilterOptions;
  final List<TradeChartData> candleSticksData;
  final List<TradeChartData> orderBookData;
  final String orderBookFilterLength;
  final String orderBookFilter;
  final String candleStickInterval;
  final String candleStickSymbol;
  final ChartSeriesController? chartSeriesController;
  final ChartSeriesController? orderBookChartController;
  final WebSocketChannel? channel;
  final WebSocketChannel? orderBookChannel;

  HomeModel({
    this.tradeTabOptions = const ['Charts', 'Orderbook', 'Recent Trades'],
    this.tradeFilterOptions = const ['1H', '2H', '4H', '1D', '1W', '1M'],
    this.tradeOrderOptions = const ['Open Orders', 'Positions', 'Order History'],
    this.buySellOptions = const ['Buy', 'Sell'],
    this.buyOptions = const ['Limit', 'Market', 'Stop-Limit'],
    this.orderBookFilterOptions = const ['3', '5', '10', '15', '20'],
    this.candleStickInterval = '1H',
    this.orderBookFilterLength = '',
    this.orderBookFilter = AppStrings.highLow,
    this.candleStickSymbol = 'btcusdt',
    this.candleSticksData = const[],
    this.orderBookData = const[],
    this.chartSeriesController,
    this.orderBookChartController,
    this.channel,
    this.orderBookChannel,
});

  HomeModel copyWith({
    List<String>? tradeTabOptions,
    List<String>? tradeFilterOptions,
    List<String>? tradeOrderOptions,
    List<String>? buySellOptions,
    List<String>? buyOptions,
    List<String>? orderBookFilterOptions,
    List<TradeChartData>? candleSticksData,
    List<TradeChartData>? orderBookData,
    String? orderBookFilterLength,
    String? orderBookFilter,
    String? candleStickInterval,
    String? candleStickSymbol,
    ChartSeriesController? chartSeriesController,
    ChartSeriesController? orderBookChartController,
    WebSocketChannel? channel,
    WebSocketChannel? orderBookChannel,
  }){
    return HomeModel(
      tradeTabOptions: tradeTabOptions ?? this.tradeTabOptions,
      tradeFilterOptions: tradeFilterOptions ?? this.tradeFilterOptions,
      tradeOrderOptions: tradeOrderOptions ?? this.tradeOrderOptions,
      buySellOptions: buySellOptions ?? this.buySellOptions,
      buyOptions: buyOptions ?? this.buyOptions,
      orderBookFilterOptions: orderBookFilterOptions ?? this.orderBookFilterOptions,
      orderBookFilterLength: orderBookFilterLength ?? this.orderBookFilterLength,
      orderBookFilter: orderBookFilter ?? this.orderBookFilter,
      candleStickInterval: candleStickInterval ?? this.candleStickInterval,
      candleStickSymbol: candleStickSymbol ?? this.candleStickSymbol,
      candleSticksData: candleSticksData ?? this.candleSticksData,
      orderBookData: orderBookData ?? this.orderBookData,
      chartSeriesController: chartSeriesController ?? this.chartSeriesController,
      orderBookChartController: orderBookChartController ?? this.orderBookChartController,
      channel: channel ?? this.channel,
      orderBookChannel: orderBookChannel ?? this.orderBookChannel,
    );
  }
}