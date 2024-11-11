import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:scores/features/home/ui/screens/home_screen.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());

  int currentIndex = 0;
  List<Widget> screens = [
    const HomeScreen(),
    // Add the rest of screens.
    Container(),
    Container(),
    Container(),
  ];
}
