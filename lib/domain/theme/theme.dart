import 'package:flutter/material.dart';
import 'package:roqqu_assessment/domain/theme/app_colors.dart';
import 'package:roqqu_assessment/domain/theme/global_app_bar_theme.dart';

String theme = 'light';

RoqquTheme currentTheme = RoqquTheme();

class RoqquTheme with ChangeNotifier{
  static bool isLightTheme = true;
  ThemeMode get currentTheme => isLightTheme ? ThemeMode.light : ThemeMode.dark;

  void toggleTheme(){
    isLightTheme = !isLightTheme;
    notifyListeners();
  }


  static ThemeData get lightTheme{
    return ThemeData(
      appBarTheme: globalAppBarLightTheme,
      useMaterial3: false,
      primaryColor: AppColors.primaryText,
      scaffoldBackgroundColor: AppColors.lightBackground,
      brightness: Brightness.light,
      primaryColorLight: AppColors.cardLightBackground,
      primaryColorDark: AppColors.secondaryTextGrey,
      canvasColor: AppColors.secondaryBackgroundGrey,
      hintColor: AppColors.secondaryTextGrey,
      focusColor: AppColors.selectedLightGrey
    );
  }

  static ThemeData get darkTheme{
    return ThemeData(
      appBarTheme: globalAppBarDarkTheme,
      useMaterial3: false,
      primaryColor: AppColors.darkPrimaryText,
      scaffoldBackgroundColor: AppColors.darkBackground,
      brightness: Brightness.dark,
      primaryColorLight: AppColors.cardDarkBackground,
      primaryColorDark: AppColors.secondaryDarkTextGrey,
      canvasColor: AppColors.darkBackground,
      hintColor: AppColors.darkPrimaryText,
        focusColor: AppColors.selectedDarkGrey
    );
  }

}