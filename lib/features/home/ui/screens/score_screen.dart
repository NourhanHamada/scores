import 'package:flutter/material.dart';
import 'package:scores/core/widgets/text_custom.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({
    super.key,
    required this.score,
  });

  final num score;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextCustom(text: score.toString()),
          ],
        ),
      ),
    );
  }
}
