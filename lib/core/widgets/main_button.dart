import 'package:flutter/material.dart';

import '../theming/colors_manager.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.onTap,
    this.backgroundColor,
    this.width,
    this.height,
    this.borderColor,
    this.radius,
    required this.widget,
  });

  final Function() onTap;
  final Color? backgroundColor;
  final double? width;
  final double? height;
  final Color? borderColor;
  final double? radius;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height ?? 51,
        decoration: BoxDecoration(
            color: backgroundColor ?? ColorsManager.yellowColor,
            borderRadius: BorderRadius.circular(radius ?? 30),
            border: Border.all(
              color: borderColor ?? ColorsManager.transparentColor,
              width: 1.3,
            )),
        child: Center(
          child: widget,
        ),
      ),
    );
  }
}
