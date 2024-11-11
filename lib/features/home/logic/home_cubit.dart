import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:scores/core/theming/assets_manager.dart';
import 'package:scores/features/home/data/user_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  // Create user data model to pass in screens.
  UserModel user = UserModel('Omar', AssetsManager.profilePicture);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController scoreController = TextEditingController();
  late AnimationController animationController;
  late Animation<int> scoreAnimation;
  late Animation<double> progressAnimation;
  final Duration duration = const Duration(seconds: 2);


  /// Initialize the AnimationController
  void initAnimationController(TickerProvider vsync) {
    animationController = AnimationController(
      duration: duration,
      vsync: vsync,
    );
  }

  /// Animate score in the score text and progressbar.
  animateTextAndProgressbar(score) {
    scoreAnimation = IntTween(
      begin: 0,
      end: score.toInt(),
    ).animate(animationController);
    progressAnimation = Tween<double>(
      begin: 0,
      end: score /100,
    ).animate(animationController);

    // Start animation
    animationController.forward();
    emit(AnimateTextAndProgressbar());
  }

  /// Check if scoreField is Empty.
  bool isScoreEmpty() {
    return scoreController.text.isEmpty;
  }

  /// Update score field to show the button state if available or unavailable.
  updateScoreField(value) {
    scoreController.text = value;
    emit(UpdateScoreField());
  }
}
