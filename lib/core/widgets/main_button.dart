import 'package:flutter/material.dart';
import 'package:scores/core/widgets/text_custom.dart';

import '../theming/colors_manager.dart';

class MainButton extends StatelessWidget {
  const MainButton(
      {super.key,
      required this.onTap,
      this.backgroundColor,
      this.width,
      this.height,
      this.borderColor,
      this.radius,
      required this.title});

  final Function() onTap;
  final Color? backgroundColor;
  final double? width;
  final double? height;
  final Color? borderColor;
  final double? radius;
  final String title;

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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Use this icon cuz the image in file doesn't exist
              Transform.rotate(
                angle: -4,
                child: const Icon(
                  Icons.sports_baseball,
                  size: 14,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              TextCustom(
                text: title,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
