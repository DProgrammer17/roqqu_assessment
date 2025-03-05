import 'package:flutter/material.dart';
import 'package:roqqu_assessment/domain/constants/app_constants.dart';
import 'package:roqqu_assessment/domain/constants/app_strings.dart';

abstract class AppTextStyles {
  static TextStyle h1(BuildContext context) => TextStyle(
        fontFamily: AppStrings.fontFamily,
        fontWeight: FontWeight.w700,
        color: Theme.of(context).primaryColor,
        fontSize: 25.asp,
      );

  static TextStyle h2(BuildContext context) => TextStyle(
        fontFamily: AppStrings.fontFamily,
        fontWeight: FontWeight.w500,
        color: Theme.of(context).primaryColor,
        fontSize: 14.asp,
      );

  static TextStyle h3(BuildContext context) => TextStyle(
        fontFamily: AppStrings.fontFamily,
        fontWeight: FontWeight.w600,
        color: Theme.of(context).primaryColor,
        fontSize: 16.asp,
      );

  static TextStyle h4(BuildContext context) => TextStyle(
        fontFamily: AppStrings.fontFamily,
        fontWeight: FontWeight.w600,
        color: Theme.of(context).primaryColor,
        fontSize: 20.asp,
      );

  static TextStyle h5(BuildContext context) => TextStyle(
        fontFamily: AppStrings.fontFamily,
        fontWeight: FontWeight.w600,
        color: Theme.of(context).primaryColor,
        fontSize: 18.asp,
      );

  static TextStyle body1Regular(BuildContext context) => TextStyle(
        fontFamily: AppStrings.fontFamily,
        fontWeight: FontWeight.w400,
        color: Theme.of(context).primaryColor,
        fontSize: 12.asp,
      );

  static TextStyle body2Regular(BuildContext context) => TextStyle(
        fontFamily: AppStrings.fontFamily,
        fontWeight: FontWeight.w400,
        color: Theme.of(context).primaryColor,
        fontSize: 14.asp,
      );

  static TextStyle body3Regular(BuildContext context) => TextStyle(
        fontFamily: AppStrings.fontFamily,
        fontWeight: FontWeight.w400,
        color: Theme.of(context).primaryColor,
        fontSize: 10.asp,
      );
}
