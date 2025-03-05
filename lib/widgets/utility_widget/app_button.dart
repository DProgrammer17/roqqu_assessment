import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:roqqu_assessment/domain/constants/app_constants.dart';
import 'package:roqqu_assessment/domain/constants/app_textstyles.dart';
import 'package:roqqu_assessment/domain/theme/app_colors.dart';

class AppButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Color? buttonColor;
  final Color? textColor;
  final Color? borderColor;
  final Widget? buttonIcon;
  final String title;
  final double? height;
  final double? verticalPadding;
  final double? borderWidth;
  final double? width;
  final LinearGradient? gradient;
  final ValueNotifier<bool>? isLoading;
  final ValueNotifier<bool>? isDisabled;

  const AppButton({
    super.key,
    required this.title,
    this.onTap,
    this.buttonColor,
    this.buttonIcon,
    this.textColor,
    this.borderColor,
    this.borderWidth,
    this.height,
    this.verticalPadding,
    this.isLoading,
    this.width,
    this.isDisabled,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isDisabled ?? ValueNotifier(false),
      builder: (context, bool value, _) {
        return ValueListenableBuilder(
          valueListenable: isLoading ?? ValueNotifier(false),
          builder: (context, bool loading, _) {
            return AbsorbPointer(
              absorbing: (value || loading) ? true : false,
              child: Opacity(
                opacity: loading ? 0.05 : 1.0,
                child: InkWell(
                  onTap: onTap,
                  child: Container(
                    width: width ?? AppConstants.deviceWidth,
                    padding: EdgeInsets.symmetric(vertical: verticalPadding ?? 10.ah),
                    decoration: BoxDecoration(
                      gradient: gradient,
                      color: buttonColor?.withOpacity(value ? 0.5 : 1) ??
                          AppColors.failRed.withOpacity(value ? 0.5 : 1),
                      borderRadius: BorderRadius.all(Radius.circular(16.ar)),
                      border: Border.all(
                        color: borderColor ?? Colors.transparent,
                        width: borderWidth ?? 0,
                      ),
                    ),
                    child: Center(
                      child: loading
                          ? Theme(
                              data: ThemeData(
                                cupertinoOverrideTheme:
                                    const CupertinoThemeData(
                                  brightness: Brightness.dark,
                                ),
                              ),
                              child: SizedBox(
                                width: 20.aw,
                                height: 20.ah,
                                child: const CupertinoActivityIndicator(),
                              ),
                            )
                          : Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if(buttonIcon != null)...[
                                  buttonIcon!,
                                  SizedBox(width: 8.aw),
                                ],
                                Text(
                                  title,
                                  textAlign: TextAlign.center,
                                  style: AppTextStyles.h3(context).copyWith(
                                    color: textColor ??
                                        Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
