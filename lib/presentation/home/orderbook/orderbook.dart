import 'package:flutter/material.dart';
import 'package:roqqu_assessment/presentation/home/orderbook/widgets/orderbook_filter.dart';

class OrderBook extends StatelessWidget{
  const OrderBook({super.key});

  @override
  Widget build(BuildContext context) {
   return const Column(
     children: [
       OrderBookFilter(),
     ],
   );
  }

}