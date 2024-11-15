import 'package:flutter/material.dart';
import 'package:scores/core/theming/colors_manager.dart';
import 'package:scores/core/widgets/text_custom.dart';
import '../widgets/home/form_and_start_button.dart';
import '../widgets/home/home_user_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              HomeUserData(),
              SizedBox(
                height: 32,
              ),
              Align(
                alignment: Alignment.center,
                child: TextCustom(
                  text: 'Enter your score',
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: ColorsManager.mainColor,
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: FormAndStartButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
