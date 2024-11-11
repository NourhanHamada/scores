import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scores/core/widgets/text_custom.dart';
import '../../../logic/home_cubit.dart';

class HomeUserData extends StatelessWidget {
  const HomeUserData({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextCustom(
          text: 'Hello, ${context.read<HomeCubit>().user.name}',
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        CircleAvatar(
          radius: 27,
          backgroundImage: AssetImage(
            context.read<HomeCubit>().user.image,
          ),
        )
      ],
    );
  }
}
