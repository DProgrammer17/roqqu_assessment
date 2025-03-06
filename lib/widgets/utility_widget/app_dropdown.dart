
import 'package:flutter/material.dart';
import 'package:roqqu_assessment/domain/constants/app_constants.dart';
import 'package:roqqu_assessment/domain/constants/app_textstyles.dart';

class AppDropDownField extends StatefulWidget {
  final List<String> list;
  final String labelText;
  final double? width;
  final Function(String) onChanged;
  final TextEditingController? controller;
  const AppDropDownField({
    super.key,
    this.controller,
    required this.list,
    required this.labelText,
    required this.onChanged,
    this.width,
  });

  @override
  State<AppDropDownField> createState() =>
      _AppDropDownFieldState();
}

class _AppDropDownFieldState extends State<AppDropDownField> {
  @override
  void initState() {
    super.initState();
    selectedValue = widget.controller?.text ?? widget.list[0];
  }

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          borderRadius: BorderRadius.circular(5.ar),
          border: Border.all(
            width: 0.5.aw,
            color: Theme.of(context).canvasColor,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: DropdownButtonFormField(
                  icon: const SizedBox.shrink(),
                  value: selectedValue,
                  decoration: InputDecoration(
                    labelText:
                    selectedValue == widget.list[0] ? "" : widget.labelText,
                    floatingLabelStyle: AppTextStyles.body1Regular(context).copyWith(
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).primaryColor,
                    ),
                    labelStyle:  AppTextStyles.body1Regular(context).copyWith(
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).primaryColor,
                    ),
                    contentPadding: EdgeInsets.only(
                      top:  -20.ah,
                      left: 15.aw,
                    ),
                    border: InputBorder.none,
                  ),
                  style: AppTextStyles.body1Regular(context).copyWith(
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).primaryColor,
                  ),
                  items: widget.list.map((e) {
                    return DropdownMenuItem(
                      value: e,
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        e,
                        softWrap: true,
                        style: AppTextStyles.body1Regular(context).copyWith(
                          fontWeight: FontWeight.w500,
                          color: selectedValue == widget.list[0]
                              ? Theme.of(context).hintColor
                              : Theme.of(context).primaryColor,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? val) {
                    widget.onChanged.call(val ?? widget.list.first);
                    setState(() {
                      selectedValue = val;
                      widget.controller?.text = selectedValue ?? "";
                    });
                  }),
            ),
            Padding(
              padding: EdgeInsets.only(right: 5.aw),
              child: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: Theme.of(context).primaryColorDark,
              ),
            ),
          ],
        ),
      ),
    );
  }
}