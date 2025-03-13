import 'package:advanced_ecommerse/lib/core/extensions/extensions.dart';
import 'package:flutter/material.dart';
import '../resources/manager_colors.dart';
import '../resources/manager_font_sizes.dart';
import '../resources/manager_font_weight.dart';
import '../resources/manager_height.dart';
import '../resources/manager_raduis.dart';
import '../resources/manager_strings.dart';
import '../resources/manager_width.dart';

class BaseButton extends StatelessWidget {
  String? title = ManagerStrings.start;
  final bool isVisibleIcon;
  final double elevation;
  final double width;
  final double height;
  final Color bgColor;
  void Function() onPressed;

  TextStyle? textStyle = TextStyle(
    fontSize: ManagerFontSizes.s16,
    fontWeight: ManagerFontWeight.regular,
    color: ManagerColors.white,
  );

  BaseButton({
    super.key,
    this.elevation = 0,
    this.title,
    this.isVisibleIcon = false,
    double?width,
    double?height ,
    this.bgColor = ManagerColors.primaryColor,
    this.textStyle,
    required this.onPressed,
  }): width = width ?? ManagerWidth.w355, // Assign default value inside the constructor
        height = height ?? ManagerHeight.h60;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: bgColor,
          minimumSize: Size(
            width,
            height,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
            title.onNull(),
            style: TextStyle(
              color: ManagerColors.black,
              fontWeight: ManagerFontWeight.regular,
              fontSize: ManagerFontSizes.s16,
            ),
           ),
        );
  }
}