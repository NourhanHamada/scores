import 'package:flutter/material.dart';
import 'package:scores/features/home/ui/widgets/score/poplar_challenges_list.dart';
import 'package:scores/features/home/ui/widgets/score/score_title.dart';

class PopularChallengesSection extends StatelessWidget {
  const PopularChallengesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 32,
        ),
        ScoreTitle(
          title: 'POPULAR CHALLENGES',
        ),
        SizedBox(
          height: 16,
        ),
        PopularChallengesList(),
      ],
    );
  }
}
