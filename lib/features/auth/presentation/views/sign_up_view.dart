import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/services/get_it.dart';

import '../../domain/repos/auth_repo.dart';
import '../manger/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'widgets/sign_up_view_body_bloc_consumer.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  static const routeName = 'sign-up';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(getIt.get<AuthRepo>()),
      child: Scaffold(
        body: SafeArea(child: SignUpViewBodyBlocConsumer()),
      ),
    );
  }
}
