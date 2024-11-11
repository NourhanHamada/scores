import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scores/core/di/dependency_injection.dart';
import 'package:scores/core/routing/routes.dart';
import 'package:scores/core/widgets/text_custom.dart';
import 'package:scores/features/home/data/user_model.dart';
import 'package:scores/features/home/logic/home_cubit.dart';
import 'package:scores/features/home/ui/screens/score_screen.dart';
import 'package:scores/features/layout/logic/layout_cubit.dart';
import '../../features/home/ui/screens/home_screen.dart';
import '../../features/layout/ui/screens/layout.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    // This arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments as Map<String, dynamic>?;

    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: getIt<HomeCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<LayoutCubit>(),
              ),
            ],
            child: const HomeScreen(),
          ),
        );
      case Routes.scoreScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: getIt<HomeCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<LayoutCubit>(),
              ),
            ],
            child: ScoreScreen(
              score: arguments?['score'] as num,
              user: arguments?['user'] as UserModel,
            ),
          ),
        );
      case Routes.layoutScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) {
            return MultiBlocProvider(
              providers: [
                BlocProvider.value(
                  value: getIt<HomeCubit>(),
                ),
                BlocProvider(
                  create: (context) => getIt<LayoutCubit>(),
                ),
              ],
              child: const Layout(),
            );
          },
        );
      default:
        return null;
    }
  }

  Route? unknownRoute(RouteSettings setting) {
    return MaterialPageRoute(
      builder: (_) => const Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextCustom(
                text: 'No Route',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
