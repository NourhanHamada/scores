part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class UpdateScoreField extends HomeState {}

final class AnimateTextAndProgressbar extends HomeState {}