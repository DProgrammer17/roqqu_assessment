abstract class AppStrings {
  static const appTitle = 'Roqqu App';
  static const fontFamily = 'Satoshi';
  static const cryptoBaseOptions = 'BTC/USDT';
  static const cryptoBaseCost = '\$20,634';
  static const dollarSymbol = '\$';
  static const change24 = '24h change';
  static const high24 = '24h high';
  static const low24 = '24h low';
  static const changeBaseText = '520.80 +1.25%';
  static const time = 'Time';
  static const fxIndicators = 'Fx Indicators';
  static const highLow = 'High Low';
  static const highVal = 'High Val';
  static const lowVal = 'Low Val';
  static const buy = 'Buy';
  static const sell = 'Sell';
  static const limitPrice = 'Limit price';
  static const amount = 'Amount';
  static const type = 'Type';
  static const postOnly = 'Post Only';
  static const total = 'Total';
  static const buyBTC = 'Buy BTC';
  static const ngn = 'NGN';
  static const available = 'Available';
  static const deposit = 'Deposit';
  static const totalAccountValue = 'Total account value';
  static const openOrders = 'Open Orders';
  static const noOpenOrders = 'No Open Orders';
  static const noOpenPositions = 'No Open Positions';
  static const noOrderHistory = 'No Order History';
  static const loremIpsum =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id pulvinar nullam sit imperdiet pulvinar.';
  static String amountValue(
          {required String amount, required String currency}) =>
      '$amount $currency';
}
