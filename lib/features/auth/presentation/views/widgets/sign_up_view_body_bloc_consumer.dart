import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/utils/widgets/custom_progress_hud.dart';

import '../../../../../core/helper_function/build_bar.dart';
import '../../manger/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'sign_up_view_body.dart';

class SignUpViewBodyBlocConsumer extends StatelessWidget {
  const SignUpViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          Navigator.pop(context);
        } else if (state is SignupFailure) {
          showSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
            isLoading: state is SignupLoading ? true : false,
            child: SignUpViewBody());
      },
    );
  }
}
