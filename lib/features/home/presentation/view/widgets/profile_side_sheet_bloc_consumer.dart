import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/features/auth/presentation/manger/cubits/sign_out_cubit/sign_out_cubit.dart';
import 'package:news/features/auth/presentation/views/login_view.dart';
import 'package:news/features/home/presentation/view/widgets/profile_side_sheet.dart';

class SettingsWidgetBlocConsumer extends StatelessWidget {
  const SettingsWidgetBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignOutCubit, SignOutState>(
      listener: (context, state) {
        if (state is SignOutSuccess) {
          Navigator.pushNamed(context, LoginView.routeName);
        }
      },
      builder: (context, state) {
        return const ProfileSideSheet();
      },
    );
  }
}
