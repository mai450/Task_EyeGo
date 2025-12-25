import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/features/auth/presentation/views/widgets/login_view_body.dart';
import '../../../../../core/helper_function/build_bar.dart';
import '../../../../../core/utils/widgets/custom_progress_hud.dart';
import '../../../../home/presentation/view/Home_view.dart';
import '../../manger/cubits/login_cubit/login_cubit.dart';

class LoginViewBodyBlocConsumer extends StatelessWidget {
  const LoginViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          Navigator.of(context).pushReplacementNamed(HomeView.routeName);
        } else if (state is LoginFailure) {
          showSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
            isLoading: state is LoginLoading ? true : false,
            child: LoginViewBody());
      },
    );
  }
}
