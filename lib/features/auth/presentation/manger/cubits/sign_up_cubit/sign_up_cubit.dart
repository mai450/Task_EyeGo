import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../domain/entites/user_entity.dart';
import '../../../../domain/repos/auth_repo.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.authRepo) : super(SignUpInitial());
  final AuthRepo authRepo;

  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    emit(SignupLoading());
    final result = await authRepo.signUpWithEmailAndPassword(
      email: email,
      password: password,
      name: name,
    );
    result.fold(
      (failure) => emit(SignupFailure(errMessage: failure.message)),
      (user) => emit(SignupSuccess(userEntity: user)),
    );
  }
}
