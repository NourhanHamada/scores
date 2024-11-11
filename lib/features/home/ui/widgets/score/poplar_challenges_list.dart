import 'package:flutter/material.dart';
import '../../../../../core/theming/assets_manager.dart';
import '../../../../../core/theming/colors_manager.dart';
import '../../../../../core/widgets/text_custom.dart';
import '../../../data/popular_challenge_model.dart';

class PopularChallengesList extends StatelessWidget {
  const PopularChallengesList({super.key});

  @override
  Widget build(BuildContext context) {
    List<PopularChallengeModel> popularChallenges = [
      PopularChallengeModel(
          AssetsManager.coinTree,
          AssetsManager.tree,
          ColorsManager.mainColor,
          ColorsManager.orangeColor,
          ColorsManager.blackColor),
      PopularChallengeModel(
          AssetsManager.happyFarm,
          AssetsManager.golf,
          ColorsManager.yellowColor,
          ColorsManager.blackColor,
          ColorsManager.yellowColor),
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...List.generate(
            popularChallenges.length,
            (index) {
              return Container(
                height: 130,
                width: MediaQuery.sizeOf(context).width / 1.6,
                margin: EdgeInsets.only(right: 16, left: index == 0 ? 24 : 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: popularChallenges[index].backgroundColor,
                ),
                padding: const EdgeInsets.only(
                  left: 15,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          popularChallenges[index].titleImage,
                          width: 100,
                          height: 78,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: popularChallenges[index].buttonColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 2),
                          child: Row(
                            children: [
                              TextCustom(
                                text: 'Start',
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                color: popularChallenges[index].textColor,
                              ),
                              Transform.rotate(
                                angle: -1,
                                child: Icon(
                                  Icons.arrow_forward,
                                  size: 14,
                                  color: popularChallenges[index].textColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Image.asset(
                      popularChallenges[index].image,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
