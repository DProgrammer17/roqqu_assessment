import 'package:flutter/material.dart';
import 'package:roqqu_assessment/domain/constants/app_constants.dart';
import 'package:roqqu_assessment/domain/constants/app_textstyles.dart';
import 'package:roqqu_assessment/domain/extensions/widget_extensions.dart';
import 'package:roqqu_assessment/presentation/home/buy_and_sell/buy_details.dart';
import 'package:roqqu_assessment/presentation/home/notifiers/home_model.dart';

class BuyAndSellModal extends StatelessWidget {
  const BuyAndSellModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConstants.deviceHeight * 0.6,
      padding: EdgeInsets.symmetric(vertical: 28.ah, horizontal: 32.aw),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorLight,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16.ar),
        ),
      ),
      child: DefaultTabController(
        length: 2,
        child: Column(
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
                  HomeModel().buySellOptions.length,
                      (index) => Tab(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 5.ah, horizontal: 5.aw),
                      child: Text(
                        HomeModel().buySellOptions.elementAt(index),
                        style: AppTextStyles.body1Regular(context).copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            16.sbH,
            const Expanded(
              child: TabBarView(
                children: [
                  BuyDetails(),
                  SizedBox.shrink(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
