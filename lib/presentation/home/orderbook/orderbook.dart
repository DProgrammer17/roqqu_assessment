import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roqqu_assessment/domain/constants/app_strings.dart';
import 'package:roqqu_assessment/domain/extensions/widget_extensions.dart';
import 'package:roqqu_assessment/presentation/home/notifiers/orderbook_notifier.dart';
import 'package:roqqu_assessment/presentation/home/orderbook/widgets/order_book_comparision_tile.dart';
import 'package:roqqu_assessment/presentation/home/orderbook/widgets/order_book_data_tile.dart';
import 'package:roqqu_assessment/presentation/home/orderbook/widgets/order_book_header.dart';
import 'package:roqqu_assessment/presentation/home/orderbook/widgets/orderbook_filter.dart';

class OrderBook extends ConsumerStatefulWidget {
  const OrderBook({super.key});

  @override
  ConsumerState<OrderBook> createState() => _OrderBookState();
}

class _OrderBookState extends ConsumerState<OrderBook>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(orderBookNotifier.notifier).initOrderBookSockets(context);
    });
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          const OrderBookFilter(),
          8.sbH,
          const OrderBookHeader(),
          if (ref.watch(orderBookNotifier).orderBookData.isNotEmpty) ...[
            if (ref.watch(orderBookNotifier).orderBookFilter ==
                    AppStrings.highLow ||
                ref.watch(orderBookNotifier).orderBookFilter ==
                    AppStrings.highVal) ...[
              Column(
                children: List.generate(
                  ref.watch(orderBookNotifier).orderBookFilterLength.isNotEmpty
                      ? int.parse(
                          ref.watch(orderBookNotifier).orderBookFilterLength)
                      : int.parse(ref
                          .watch(orderBookNotifier)
                          .orderBookFilterOptions
                          .first),
                  (index) => OrderBookDataTile(
                    price: ref
                        .watch(orderBookNotifier)
                        .orderBookData
                        .last
                        .data!
                        .b!
                        .elementAt(index)[0],
                    amount: ref
                        .watch(orderBookNotifier)
                        .orderBookData
                        .last
                        .data!
                        .b!
                        .elementAt(index)[1],
                    up: true,
                  ),
                ),
              ),
              20.sbH,
            ],
            if (ref.watch(orderBookNotifier).orderBookFilter ==
                AppStrings.highLow) ...[
              OrderBookComparisonTile(
                bPrice: ref
                    .watch(orderBookNotifier)
                    .orderBookData
                    .last
                    .data!
                    .b!
                    .last[0],
                aPrice: ref
                    .watch(orderBookNotifier)
                    .orderBookData
                    .last
                    .data!
                    .a!
                    .last[0],
              ),
            ],
            if (ref.watch(orderBookNotifier).orderBookFilter ==
                    AppStrings.highLow ||
                ref.watch(orderBookNotifier).orderBookFilter ==
                    AppStrings.lowVal) ...[
              20.sbH,
              Column(
                children: List.generate(
                  ref.watch(orderBookNotifier).orderBookFilterLength.isNotEmpty
                      ? int.parse(
                          ref.watch(orderBookNotifier).orderBookFilterLength)
                      : int.parse(ref
                          .watch(orderBookNotifier)
                          .orderBookFilterOptions
                          .first),
                  (index) => OrderBookDataTile(
                    price: ref
                        .watch(orderBookNotifier)
                        .orderBookData
                        .last
                        .data!
                        .a!
                        .elementAt(index)[0],
                    amount: ref
                        .watch(orderBookNotifier)
                        .orderBookData
                        .last
                        .data!
                        .a!
                        .elementAt(index)[1],
                    up: false,
                  ),
                ),
              ),
            ],
          ],
        ],
      ),
    );
  }
}
