import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/widgets/main_button.dart';
import '../../../../core/widgets/text_custom.dart';
import '../../../../core/widgets/text_form_field_custom.dart';

class FormAndStartButton extends StatefulWidget {
  const FormAndStartButton({super.key});

  @override
  State<FormAndStartButton> createState() => _FormAndStartButtonState();
}

class _FormAndStartButtonState extends State<FormAndStartButton> {
  final TextEditingController scoreController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool isScoreEmpty = scoreController.text.isEmpty;
    return Column(
      children: [
        TextFormFieldCustom(
          controller: scoreController,
          onChanged: (value) {
            setState(() {
              scoreController.text = value!;
            });
          },
          inputFormatter: [
            FilteringTextInputFormatter.digitsOnly,
          ],
        ),
        const SizedBox(
          height: 32,
        ),
        MainButton(
          onTap: () {
            if (!isScoreEmpty) {
              Navigator.pushNamed(context, Routes.scoreScreen,
                  arguments: int.parse(scoreController.text));
            } else {}
          },
          widget: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.sports_baseball,
                size: 14,
              ),
              SizedBox(
                width: 8,
              ),
              TextCustom(
                text: 'Start',
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
          backgroundColor: isScoreEmpty
              ? ColorsManager.greyColor
              : ColorsManager.yellowColor,
        )
      ],
    );
  }
}
