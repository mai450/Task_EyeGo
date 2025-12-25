import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news/features/auth/domain/repos/auth_repo.dart';

part 'sign_out_state.dart';

class SignOutCubit extends Cubit<SignOutState> {
  SignOutCubit(this.authRepo) : super(SignOutInitial());

  final AuthRepo authRepo;
  Future<void> signOut() async {
    await authRepo.signOut();
    emit(SignOutSuccess());
  }
}
