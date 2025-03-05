import 'package:flutter/material.dart';
import 'package:roqqu_assessment/domain/constants/app_constants.dart';
import 'package:roqqu_assessment/domain/theme/app_colors.dart';

class AppCheckBox extends StatelessWidget{
  final bool value;
  const AppCheckBox({super.key, required this.value,});

  @override
  Widget build(BuildContext context) {
    return Icon(
      value ? Icons.check_box_sharp : Icons.check_box_outline_blank ,
      size: 28.ar,
      color: value ? AppColors.successGreen : Theme.of(context).canvasColor,
    );
  }

}