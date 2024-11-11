import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/theming/colors_manager.dart';
import '../../../../../core/widgets/text_custom.dart';
import '../../../data/user_model.dart';
import '../../../logic/home_cubit.dart';

class YellowCard extends StatelessWidget {
  const YellowCard({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 12,
      ),
      decoration: const BoxDecoration(
        color: ColorsManager.yellowColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 18,
            backgroundImage: AssetImage(
              user.image,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TextCustom(
                text: 'Hi, ',
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
              TextCustom(
                text: user.name,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          const TextCustom(
            text: 'Total score',
            fontSize: 10,
            height: .5,
          ),
          AnimatedBuilder(
            animation: context.read<HomeCubit>().scoreAnimation,
            builder: (context, child) {
              return TextCustom(
                text: context.read<HomeCubit>().scoreAnimation.value.toString(),
                fontSize: 32,
                color: ColorsManager.greenColor,
                fontWeight: FontWeight.w600,
              );
            },
          ),
        ],
      ),
    );
  }
}
