import 'package:flutter/material.dart';
import '../../../../../core/theming/colors_manager.dart';
import '../../../../../core/widgets/text_custom.dart';

class ScoreTitle extends StatelessWidget {
  final String title;

  const ScoreTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: TextCustom(
        text: title,
        color: ColorsManager.mainColor,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}