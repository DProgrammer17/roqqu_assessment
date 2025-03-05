import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roqqu_assessment/domain/constants/app_assets.dart';
import 'package:roqqu_assessment/domain/constants/app_constants.dart';
import 'package:roqqu_assessment/domain/extensions/widget_extensions.dart';
import 'package:roqqu_assessment/domain/theme/theme.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget{
  const AppBarWidget({super.key});

  @override
  Size get preferredSize => Size.fromHeight(120.ah);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 62.ah),
      child: Container(
        color: Theme.of(context).primaryColorLight,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.ah, horizontal: 16.aw),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                RoqquTheme.isLightTheme ? ImageAssets.fullLogo: ImageAssets.fullLogoDarkMode,
                height: 34.ah,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    SvgAssets.profileIcon,
                    height: 32.ah,
                  ),
                  16.sbW,
                  InkWell(
                    onTap: () {
                      currentTheme.toggleTheme();
                    },
                    child: SvgPicture.asset(
                      SvgAssets.globeIcon,
                      height: 24.ah,
                    ),
                  ),
                  16.sbW,
                  SvgPicture.asset(
                    SvgAssets.drawerIcon,
                    height: 32.ah,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
