import 'package:flutter/material.dart';
import 'package:roqqu_assessment/domain/constants/app_constants.dart';
import 'package:roqqu_assessment/domain/constants/app_strings.dart';
import 'package:roqqu_assessment/domain/constants/app_textstyles.dart';
import 'package:roqqu_assessment/presentation/home/notifiers/home_model.dart';
import 'package:roqqu_assessment/widgets/utility_widget/empty_state.dart';

class TradeOrders extends StatelessWidget {
  const TradeOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppConstants.deviceHeight * 0.4,
      child: DefaultTabController(
        length: 3,
        child: Container(
          padding: EdgeInsets.all(16.ar),
          color: Theme.of(context).primaryColorLight,
          child: Column(
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
                    HomeModel().tradeOrderOptions.length,
                    (index) => Tab(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5.ah, horizontal: 5.aw),
                        child: Text(
                          HomeModel().tradeOrderOptions.elementAt(index),
                          style: AppTextStyles.body1Regular(context).copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    Center(
                      child: EmptyState(
                        title: AppStrings.noOpenOrders,
                        subtitle: AppStrings.loremIpsum,
                      ),
                    ),
                    Center(
                      child: EmptyState(
                        title: AppStrings.noOpenPositions,
                        subtitle: AppStrings.loremIpsum,
                      ),
                    ),
                    Center(
                      child: EmptyState(
                        title: AppStrings.noOrderHistory,
                        subtitle: AppStrings.loremIpsum,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
