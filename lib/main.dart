import 'package:flutter/material.dart';
import 'package:scores/core/routing/routes.dart';
import 'core/di/dependency_injection.dart';
import 'core/routing/app_router.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize getIt for DependencyInjection.
  await setupGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: Routes.layoutScreen,
      onGenerateRoute: AppRouter().generateRoute,
      onUnknownRoute: AppRouter().unknownRoute,
    );
  }
}
