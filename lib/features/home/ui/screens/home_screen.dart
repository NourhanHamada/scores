import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scores/core/theming/colors_manager.dart';

import '../widgets/home_user_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const HomeUserData(),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Enter your score',
                    style: GoogleFonts.balooBhai2(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: ColorsManager.mainColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
