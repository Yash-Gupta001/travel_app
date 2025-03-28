import 'package:flutter/material.dart';
import 'package:travel_app/widgets/app_text.dart';

class AppButtons extends StatelessWidget {
  final Color color;
  String? text;
  IconData? icon;
  final Color backgroundColor;  // Use this property
  double size;
  final Color borderColor;
  bool? isIcon;

  AppButtons({
    Key? key,
    this.isIcon = false,
    this.text,
    this.icon,
    required this.size,
    required this.color,
    required this.backgroundColor,  // Use this property
    required this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(15),
        color: backgroundColor,  // Use the passed backgroundColor
      ),
      child: isIcon == false
          ? Center(
              child: AppText(
              text: text!,
              color: color,
            ))
          : Center(child: Icon(icon, color: color)),
    );
  }
}

          // borderRadius: BorderRadius.circular(15),
          // color: AppColors.buttonBackground),
      