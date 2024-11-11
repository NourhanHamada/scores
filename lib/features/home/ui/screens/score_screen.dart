import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scores/core/theming/assets_manager.dart';
import 'package:scores/core/theming/colors_manager.dart';
import 'package:scores/core/widgets/main_button.dart';
import 'package:scores/features/home/data/user_model.dart';
import 'package:scores/features/home/logic/home_cubit.dart';
import '../widgets/score/green_card.dart';
import '../widgets/score/latest_badges_section.dart';
import '../widgets/score/popular_challenges_section.dart';
import '../widgets/score/rank_widget.dart';
import '../widgets/score/score_screen_header.dart';
import '../widgets/score/yellow_card.dart';

class ScoreScreen extends StatefulWidget {
  const ScoreScreen({
    super.key,
    required this.score,
    required this.user,
  });

  final num score;
  final UserModel user;

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().initAnimationController(this);
    context.read<HomeCubit>().animateTextAndProgressbar(widget.score);
  }

  @override
  Widget build(BuildContext context) {
    double horizontalPadding = 24;
    return Scaffold(
      backgroundColor: ColorsManager.backgroundColor,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: ScoreScreenHeader(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: horizontalPadding, vertical: 16),
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: Column(
                        children: [
                          YellowCard(
                            user: widget.user,
                          ),
                          GreenCard(
                            score: widget.score,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      left: 20,
                      child: Image.asset(
                        AssetsManager.boy,
                      ),
                    ),
                    const RankWidget(),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: MainButton(
                  onTap: () {},
                  title: 'Continue challenge',
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              const LatestBadgesSection(),
              const PopularChallengesSection(),
            ],
          ),
        ),
      ),
    );
  }
}
