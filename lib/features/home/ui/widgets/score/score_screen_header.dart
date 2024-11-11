import 'package:flutter/material.dart';
import '../../../../../core/theming/assets_manager.dart';
import '../../../../../core/theming/colors_manager.dart';
import '../../../../../core/widgets/text_custom.dart';

class ScoreScreenHeader extends StatelessWidget {
  const ScoreScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Navigate to the last route .. it's not in design.
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextCustom(
              text: 'GREEN.',
              color: ColorsManager.mainColor,
              fontWeight: FontWeight.w800,
            ),
            TextCustom(
              text: 'MIND',
              color: ColorsManager.yellowColor,
              fontWeight: FontWeight.w800,
            ),
          ],
        ),
        Image.asset(
          AssetsManager.notifications,
        ),
      ],
    );
  }
}
