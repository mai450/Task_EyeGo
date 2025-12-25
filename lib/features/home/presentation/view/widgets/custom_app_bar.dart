import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/helper_function/get_user.dart';
import 'package:news/core/services/get_it.dart';
import 'package:news/core/utils/app_colors.dart';
import 'package:news/core/utils/app_styles.dart';
import 'package:news/features/auth/domain/repos/auth_repo.dart';
import 'package:news/features/auth/presentation/manger/cubits/sign_out_cubit/sign_out_cubit.dart';
import 'package:news/features/home/presentation/view/widgets/profile_side_sheet_bloc_consumer.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Hello, ${getUser().userName}!',
          style: TextStyles.bold20,
        ),
        Spacer(),
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return Align(
                  alignment: Alignment.centerLeft,
                  child: BlocProvider(
                    create: (context) => SignOutCubit(getIt.get<AuthRepo>()),
                    child: SettingsWidgetBlocConsumer(),
                  ),
                );
              },
            );
          },
          child: CircleAvatar(
            radius: 18,
            backgroundColor: AppColors.primaryColor,
            child: Text(
              getUser().userName[0].toUpperCase(),
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
