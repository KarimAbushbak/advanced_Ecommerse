import 'package:flutter/material.dart';
import '../resources/manager_colors.dart';
import '../resources/manager_height.dart';
import '../resources/manager_raduis.dart';
import '../resources/manager_width.dart';

Container progressIndicator({
  Color color = ManagerColors.primaryColor,
  double? width,
Color borderColor = Colors.black,
}) {
  return Container(
    width: width ?? ManagerWidth.w10,
    height: ManagerHeight.h10,
    margin: EdgeInsetsDirectional.only(
      end: ManagerWidth.w12,
    ),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(
        ManagerRadius.r8,
      ),
      border: Border.all(
        color: borderColor, // Border color applied here
        width: 1, // You can adjust the thickness
      ),
    ),
  );
}
