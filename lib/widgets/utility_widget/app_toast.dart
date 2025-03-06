import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:roqqu_assessment/domain/constants/app_constants.dart';
import 'package:roqqu_assessment/domain/constants/app_strings.dart';
import 'package:roqqu_assessment/domain/theme/app_colors.dart';

abstract class AppMessages {
  static void showInfoMessage(
          {required BuildContext context, required String message}) =>
      Fluttertoast.showToast(
        msg: message,
      //  fontAsset: AppStrings.fontFamily,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: AppColors.classicBlue.withOpacity(0.4),
        textColor: AppColors.darkPrimaryText,
        fontSize: 14.asp,
      );

  static void showSuccessMessage(
          {required BuildContext context, required String message}) =>
      Fluttertoast.showToast(
        msg: message,
     //   fontAsset: AppStrings.fontFamily,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: AppColors.successGreen.withOpacity(0.8),
        textColor: AppColors.darkPrimaryText,
        fontSize: 14.asp,
      );

  static void showErrorMessage(
          {required BuildContext context,
          required String message}) =>
      Fluttertoast.showToast(
        msg: message,
      //  fontAsset: AppStrings.fontFamily,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: AppColors.failRed.withOpacity(0.8),
        textColor: AppColors.darkPrimaryText,
        fontSize: 14.asp,
      );
}
