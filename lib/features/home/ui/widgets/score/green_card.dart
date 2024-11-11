import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/theming/colors_manager.dart';
import '../../../../../core/widgets/text_custom.dart';
import '../../../logic/home_cubit.dart';

class GreenCard extends StatelessWidget {
  const GreenCard({
    super.key,
    required this.score,
  });

  final num score;

  @override
  Widget build(BuildContext context) {
    double progressbarWidth = MediaQuery.sizeOf(context).width - 80;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
      decoration: const BoxDecoration(
        color: ColorsManager.mainColor,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
        ),
      ),
      child: AnimatedBuilder(
        animation: context.read<HomeCubit>().progressAnimation,
        builder: (context, child) {
          // minus 0.1 cux the list starts from index +1 .
          var animationValue =
              (context.read<HomeCubit>().progressAnimation.value.toDouble() -
                  .1);
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ...List.generate(min(score.toInt(), 10), (index) {
                    return TextCustom(
                      text: (index + 1).toString(),
                      color: (index + 1) <=
                              ((context
                                      .read<HomeCubit>()
                                      .progressAnimation
                                      .value) *
                                  10)
                          ? ColorsManager.yellowColor
                          : ColorsManager.blackColor.withOpacity(.2),
                      fontWeight: FontWeight.w800,
                    );
                  })
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 20,
                width: progressbarWidth,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: progressbarWidth,
                      child: LinearProgressIndicator(
                        value: animationValue,
                        minHeight: 12,
                        color: ColorsManager.yellowColor,
                        backgroundColor:
                            ColorsManager.blackColor.withOpacity(.2),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    Positioned(
                      left: (progressbarWidth - 60) * animationValue,
                      child: Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          color: ColorsManager.yellowColor,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: ColorsManager.whiteColor,
                            width: 1.5,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
