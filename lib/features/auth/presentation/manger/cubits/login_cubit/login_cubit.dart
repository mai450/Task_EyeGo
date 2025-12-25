import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../domain/entites/user_entity.dart';
import '../../../../domain/repos/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());
  final AuthRepo authRepo;

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    final result = await authRepo.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    result.fold(
      (failure) => emit(LoginFailure(errMessage: failure.message)),
      (user) => emit(LoginSuccess(userEntity: user)),
    );
  }

  Future<void> signInWithGoogle() async {
    emit(LoginLoading());
    final result = await authRepo.signInWithGoogle();
    result.fold(
      (failure) => emit(LoginFailure(errMessage: failure.message)),
      (user) => emit(LoginSuccess(userEntity: user)),
    );
  }
}
