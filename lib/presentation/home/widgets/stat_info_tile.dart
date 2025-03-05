import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roqqu_assessment/domain/constants/app_constants.dart';
import 'package:roqqu_assessment/domain/constants/app_textstyles.dart';
import 'package:roqqu_assessment/domain/extensions/widget_extensions.dart';

class StatInfoTile extends StatelessWidget {
  final String icon;
  final String header;
  final String info;
  final Color infoColor;
  final EdgeInsets? padding;
  const StatInfoTile({
    super.key,
    required this.icon,
    required this.header,
    required this.info,
    required this.infoColor,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.aw),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                icon,
                height: 16.ah,
              ),
              4.sbW,
              Text(
                header,
                style: AppTextStyles.body1Regular(context).copyWith(
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).primaryColorDark,
                ),
              ),
            ],
          ),
          4.sbH,
          Text(
            info,
            style: AppTextStyles.body2Regular(context).copyWith(
                fontWeight: FontWeight.w500,
                color: infoColor,
            ),
          ),
        ],
      ),
    );
  }
}
