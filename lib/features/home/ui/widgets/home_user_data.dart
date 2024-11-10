import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../logic/home_cubit.dart';

class HomeUserData extends StatelessWidget {
  const HomeUserData({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Hello, ${context.read<HomeCubit>().user.name}',
          style:
              GoogleFonts.balooBhai2(fontSize: 18, fontWeight: FontWeight.w500),
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
