import 'package:get_it/get_it.dart';
import 'package:scores/features/home/logic/home_cubit.dart';
import 'package:scores/features/layout/logic/layout_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  getIt.registerLazySingleton<HomeCubit>(() => HomeCubit());
  getIt.registerLazySingleton<LayoutCubit>(() => LayoutCubit());
}
