import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scores/core/routing/routes.dart';
import 'package:scores/features/home/logic/home_cubit.dart';

import '../../features/home/ui/screens/home_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    // This arguments to be passed in any screen like this ( arguments as ClassName )
    // final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => HomeCubit(),
            child: const HomeScreen(),
          ),
        );
      case Routes.scoreScreen:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(),
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
                    Text(
                      'No Route',
                    ),
                  ],
                ),
              ),
            ));
  }
}
