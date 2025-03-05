class HomeModel{
  final List<String> tradeTabOptions;
  final List<String> tradeFilterOptions;
  final List<String> tradeOrderOptions;
  final List<String> buySellOptions;
  final List<String> buyOptions;

  HomeModel({
    this.tradeTabOptions = const ['Charts', 'Orderbook', 'Recent Trades'],
    this.tradeFilterOptions = const ['1H', '2H', '4H', '1D', '1W', '1M'],
    this.tradeOrderOptions = const ['Open Orders', 'Positions', 'Order History'],
    this.buySellOptions = const ['Buy', 'Sell'],
    this.buyOptions = const ['Limit', 'Market', 'Stop-Limit'],
});

  HomeModel copyWith({
    List<String>? tradeTabOptions,
    List<String>? tradeFilterOptions,
    List<String>? tradeOrderOptions,
    List<String>? buySellOptions,
    List<String>? buyOptions,
}){
    return HomeModel(
      tradeTabOptions: tradeTabOptions ?? this.tradeTabOptions,
      tradeFilterOptions: tradeFilterOptions ?? this.tradeFilterOptions,
      tradeOrderOptions: tradeOrderOptions ?? this.tradeOrderOptions,
      buySellOptions: buySellOptions ?? this.buySellOptions,
      buyOptions: buyOptions ?? this.buyOptions,
    );
  }
}