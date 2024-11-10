import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:scores/features/home/data/user_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  UserModel user = UserModel('Ali', 'assets/images/profile_picture.png');
}
