import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scores/core/functions/show_toast.dart';
import 'package:scores/features/home/logic/home_cubit.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/colors_manager.dart';
import '../../../../../core/widgets/main_button.dart';
import '../../../../../core/widgets/text_form_field_custom.dart';

class FormAndStartButton extends StatefulWidget {
  const FormAndStartButton({super.key});

  @override
  State<FormAndStartButton> createState() => _FormAndStartButtonState();
}

class _FormAndStartButtonState extends State<FormAndStartButton> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Column(
          children: [
            Form(
              key: context.read<HomeCubit>().formKey,
              child: TextFormFieldCustom(
                controller: context.read<HomeCubit>().scoreController,
                onChanged: (value) {
                  context.read<HomeCubit>().updateScoreField(value);
                },
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                inputFormatter: [
                  // Add only numbers
                  // FilteringTextInputFormatter.digitsOnly,
                  // to add decimal numbers
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
                  // Estimate that score from 0 to 99
                  LengthLimitingTextInputFormatter(2),
                ],
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Score shouldn\'t be empty';
                  }
                  if (value.length > 2) {
                    return 'Score should be only 3 numbers';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            MainButton(
              onTap: () {
                if (!context.read<HomeCubit>().isScoreEmpty()) {
                  if (context
                      .read<HomeCubit>()
                      .formKey
                      .currentState!
                      .validate()) {
                    Navigator.pushNamed(
                      context,
                      Routes.scoreScreen,
                      arguments: {
                        'score': double.parse(
                            context.read<HomeCubit>().scoreController.text),
                        'user': context.read<HomeCubit>().user,
                      },
                    );
                  }
                } else {
                  showToast(message: 'You should fill the score field');
                }
              },
              title: 'Start',
              backgroundColor: context.read<HomeCubit>().isScoreEmpty()
                  ? ColorsManager.greyColor
                  : ColorsManager.yellowColor,
            )
          ],
        );
      },
    );
  }
}
