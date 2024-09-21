import 'package:bookia_app/core/Utils/app_color.dart';
import 'package:bookia_app/core/Utils/text_style.dart';
import 'package:flutter/material.dart';

class customButtonWidget extends StatelessWidget {
  final double width;
  final double height;
  final String text;
  final double radius;
  final Function() onPressed;
  final Color color;
  final TextStyle? textStyle;
  final bool isBorder;

  customButtonWidget({
    super.key,
    this.width = double.infinity,
    this.height = 56,
    required this.text,
    this.radius = 8,
    required this.onPressed,
    required this.color,
    this.textStyle,
    this.isBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: color,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius),
                  side: isBorder
                      ? (BorderSide(color: appColors.darkGrey))
                      : BorderSide.none)),
          onPressed: onPressed,
          child: Text(
            text,
            style: textStyle ?? getBodyTextStyle(),
          )),
    );
  }
}
