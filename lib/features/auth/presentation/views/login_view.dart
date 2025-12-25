import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/services/get_it.dart';
import 'package:news/features/auth/presentation/manger/cubits/login_cubit/login_cubit.dart';
import 'package:news/features/auth/presentation/views/widgets/login_view_body_bloc_consumer.dart';

import '../../domain/repos/auth_repo.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const routeName = 'login';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(getIt.get<AuthRepo>()),
      child: Scaffold(
        body: SafeArea(child: LoginViewBodyBlocConsumer()),
      ),
    );
  }
}
