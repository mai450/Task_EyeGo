import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:news/core/services/shared_preference_singleton.dart';
import 'package:news/core/utils/app_colors.dart';
import 'package:news/core/utils/widgets/custom_button.dart';
import 'package:news/features/auth/presentation/views/login_view.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/utils/backend_endpoints.dart';

class StartViewBody extends StatefulWidget {
  const StartViewBody({super.key});

  @override
  State<StartViewBody> createState() => _StartViewBodyState();
}

class _StartViewBodyState extends State<StartViewBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 251, 143, 149),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 100, bottom: 60, left: 25, right: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/lottie/mobile marketing Lottie animation.json',
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height * 0.5,
            ),
            SizedBox(
              height: 30,
            ),
            RichText(
              text: TextSpan(
                  text: 'Still',
                  style: TextStyles.bold20.copyWith(
                    color: Colors.white,
                  ),
                  children: [
                    TextSpan(
                      text: ' up to date ',
                      style: TextStyles.bold20
                          .copyWith(color: AppColors.primaryColor),
                    ),
                    TextSpan(
                      text: 'news',
                      style: TextStyles.bold20.copyWith(color: Colors.white),
                    ),
                  ]),
            ),
            Text('from around the world',
                style: TextStyles.bold20.copyWith(color: Colors.white)),
            Spacer(),
            CustomButton(
              text: 'Get Started',
              onPressed: () {
                Pref.setBool(kIsStartSeen, true);
                Navigator.of(context).pushReplacementNamed(LoginView.routeName);
              },
            )
          ],
        ),
      ),
    );
  }
}
