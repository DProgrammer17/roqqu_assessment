class TradeChartData {
  final String? stream;
  final TradeData? data;

  TradeChartData({
    this.stream,
    this.data,
  });

  factory TradeChartData.fromJson(Map<String, dynamic> json) => TradeChartData(
    stream: json["stream"],
    data: json["data"] == null ? null : TradeData.fromJson(json["data"]),
  );
}

class TradeData {
  final String? eventType;
  final int? eventCloseTimeStamp;
  final int? eventStartTimestamp;
  final String? symbol;
  final int? u;
  final int? dataU;
  final int? pu;
  final List<List<String>>? b;
  final List<List<String>>? a;
  final KlineData? k;


  TradeData({
    this.eventType,
    this.eventCloseTimeStamp,
    this.eventStartTimestamp,
    this.symbol,
    this.u,
    this.dataU,
    this.pu,
    this.b,
    this.a,
    this.k
  });

  factory TradeData.fromJson(Map<String, dynamic> json) => TradeData(
    eventType: json["e"],
    eventCloseTimeStamp: json["E"],
    eventStartTimestamp: json["T"],
    symbol: json["s"],
    u: json["U"],
    dataU: json["u"],
    pu: json["pu"],
    k: json["k"] == null ? null : KlineData.fromJson(json["k"]),
    b: json["b"] == null ? [] : List<List<String>>.from(json["b"]!.map((x) => List<String>.from(x.map((x) => x)))),
    a: json["a"] == null ? [] : List<List<String>>.from(json["a"]!.map((x) => List<String>.from(x.map((x) => x)))),
  );
}

class KlineData {
  final int? klineStartTime;
  final int? klineCloseTime;
  final String? symbol;
  final String? interval;
  final int? firstTradeID;
  final int? lastTradeID;
  final String? openPrice;
  final String? closePrice;
  final String? highPrice;
  final String? lowPrice;
  final String? assetVolume;
  final int? numberOfTrades;
  final bool? closed;
  final String? quoteVolume;
  final String? takerBuyerBaseAssetVol;
  final String? takerBuyerQuoteVol;
  final String? b;

  KlineData({
    this.klineStartTime,
    this.klineCloseTime,
    this.symbol,
    this.interval,
    this.firstTradeID,
    this.lastTradeID,
    this.openPrice,
    this.closePrice,
    this.highPrice,
    this.lowPrice,
    this.assetVolume,
    this.numberOfTrades,
    this.closed,
    this.quoteVolume,
    this.takerBuyerBaseAssetVol,
    this.takerBuyerQuoteVol,
    this.b,
  });

  factory KlineData.fromJson(Map<String, dynamic> json) =>
      KlineData(
        klineStartTime: json["t"],
        klineCloseTime: json["T"],
        symbol: json["s"],
        interval: json["i"],
        firstTradeID: json["f"],
        lastTradeID: json["L"],
        openPrice: json["o"],
        closePrice: json["c"],
        highPrice: json["h"],
        lowPrice: json["l"],
        assetVolume: json["v"],
        numberOfTrades: json["n"],
        closed: json["x"],
        quoteVolume: json["q"],
        takerBuyerBaseAssetVol: json["V"],
        takerBuyerQuoteVol: json["Q"],
        b: json["B"],
      );
}