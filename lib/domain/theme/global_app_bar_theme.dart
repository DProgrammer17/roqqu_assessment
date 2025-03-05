import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:roqqu_assessment/domain/theme/app_colors.dart';

const globalAppBarLightTheme = AppBarTheme(
  elevation: 0.0,
  foregroundColor: AppColors.lightBackground,
  backgroundColor: AppColors.lightBackground,
  systemOverlayStyle: SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ),
);

const globalAppBarDarkTheme = AppBarTheme(
  elevation: 0.0,
  foregroundColor: AppColors.darkBackground,
  backgroundColor: AppColors.darkBackground,
  systemOverlayStyle: SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ),
);
