import 'package:flutter/material.dart';
import 'package:scores/features/home/ui/widgets/score/score_title.dart';

import 'latest_badges_list.dart';

class LatestBadgesSection extends StatelessWidget {
  const LatestBadgesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ScoreTitle(
          title: 'LATEST BADGES',
        ),
        SizedBox(
          height: 16,
        ),
        LatestBadgesList(),
      ],
    );
  }
}
