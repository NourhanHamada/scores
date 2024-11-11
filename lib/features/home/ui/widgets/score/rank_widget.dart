import 'package:flutter/material.dart';

import '../../../../../core/theming/assets_manager.dart';
import '../../../../../core/theming/colors_manager.dart';
import '../../../../../core/widgets/text_custom.dart';

class RankWidget extends StatelessWidget {
  const RankWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 20,
      right: 40,
      child: Stack(
        children: [
          Image.asset(
            AssetsManager.rank,
          ),
          const Positioned(
            top: 6,
            left: 0,
            right: 0,
            child: Column(
              children: [
                TextCustom(
                  text: 'Rank',
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: ColorsManager.whiteColor,
                ),
                TextCustom(
                  text: 'A',
                  fontWeight: FontWeight.w600,
                  color: ColorsManager.whiteColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
