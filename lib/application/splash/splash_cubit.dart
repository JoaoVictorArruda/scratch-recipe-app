import 'package:flutter_bloc/flutter_bloc.dart';

enum SplashState {
  none,
  new_user,
}

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState.none);

  void init() async {
    await Future.delayed(const Duration(seconds: 1), () => "1");
    emit(SplashState.new_user);
  }
}
