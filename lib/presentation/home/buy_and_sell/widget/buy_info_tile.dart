import 'package:flutter/material.dart';
import 'package:roqqu_assessment/domain/constants/app_constants.dart';
import 'package:roqqu_assessment/domain/constants/app_textstyles.dart';
import 'package:roqqu_assessment/domain/extensions/widget_extensions.dart';

class BuyInfoTile extends StatelessWidget {
  final String title;
  final String? info;
  final Widget? infoWidget;
  const BuyInfoTile({
    super.key,
    required this.title,
    this.info,
    this.infoWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 28.ah, horizontal: 16.aw),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.ar),
        border: Border.all(
          width: 1.aw,
          color: Theme.of(context).canvasColor,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: AppTextStyles.body1Regular(context).copyWith(
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).primaryColorDark,
                ),
              ),
              4.sbW,
              Icon(
                Icons.info_outlined,
                size: 16.ar,
                color: Theme.of(context).primaryColorDark,
              ),
            ],
          ),
          infoWidget ?? Text(
            info ?? '',
            style: AppTextStyles.body1Regular(context).copyWith(
              fontWeight: FontWeight.w500,
              color: Theme.of(context).primaryColorDark,
            ),
          ),
        ],
      ),
    );
  }
}
