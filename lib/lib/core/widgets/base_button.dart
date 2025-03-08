import 'package:flutter/material.dart';

import '../resources/manager_colors.dart';
import '../resources/manager_font_sizes.dart';
import '../resources/manager_font_weight.dart';
import '../resources/manager_fonts.dart';
import '../resources/manager_height.dart';
import '../resources/manager_strings.dart';
import '../resources/manager_width.dart';

class BaseButton extends StatelessWidget {
   String? title =ManagerStrings.start;

  final double width;
  final double height;
  final Color bgColor = ManagerColors.baseButtonColor;

  void Function() onPressed;



  BaseButton({
    super.key,
    this.title ,
    this.width = ManagerWidth.w355,
    this.height = ManagerHeight.h60,


    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(


        backgroundColor: bgColor,
        minimumSize: Size(
          width,
          height,
        ),
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16),
    ),
      ),child: Text(
        title ?? ManagerStrings.start,
        style:TextStyle(
    fontSize: ManagerFontSizes.s18,
    fontWeight: ManagerFontWeight.bold,
    fontFamily: ManagerFontFamily.appFont,
    color: ManagerColors.baseButtonColorText,
      ),
    ));
  }
}
