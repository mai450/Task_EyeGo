import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/helper_function/get_user.dart';
import 'package:news/core/utils/app_imgs.dart';
import 'package:news/features/auth/presentation/manger/cubits/sign_out_cubit/sign_out_cubit.dart';
import 'package:news/features/auth/presentation/views/login_view.dart';

class ProfileSideSheet extends StatelessWidget {
  const ProfileSideSheet({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.sizeOf(context).width * 0.7,
      height: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Profile',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24)),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: 18,
                  child: Image.asset(Assets.imagesProfileImg),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(getUser().userName, style: TextStyle(fontSize: 18)),
              ],
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                context.read<SignOutCubit>().signOut();
                Navigator.pushNamedAndRemoveUntil(
                    context, LoginView.routeName, (_) => false);
              },
              child: Row(
                children: [
                  Icon(Icons.logout),
                  SizedBox(
                    width: 8,
                  ),
                  Text('Sign out'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
