import 'package:flutter/material.dart';
import 'package:bookia_app/core/Utils/app_color.dart';
class socialCards extends StatelessWidget {
  const socialCards({
    super.key,

    this.image,
  });

  final Widget? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 105,
      height: 56,
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: appColors.borderColor)
      ),
      child: image
    );
  }
}