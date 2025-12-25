import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/utils/app_colors.dart';
import 'package:news/core/utils/app_styles.dart';
import 'package:news/core/utils/widgets/custom_button.dart';
import 'package:news/core/utils/widgets/custom_text_field.dart';
import 'package:news/features/auth/presentation/manger/cubits/login_cubit/login_cubit.dart';
import 'package:news/features/auth/presentation/views/sign_up_view.dart';

import '../../../../../core/utils/app_imgs.dart';
import '../../../../../core/utils/widgets/password_text_field.dart';
import 'login_with_google.dart';
import 'or_divider.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, password;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome Back 👋',
                style: TextStyles.bold24,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Login to your account',
                style: TextStyles.regular14.copyWith(color: Color(0xff949D9E)),
              ),
              SizedBox(
                height: 40,
              ),
              CustomTextField(
                text: 'Email',
                keyboardType: TextInputType.emailAddress,
                onSaved: (value) {
                  email = value!;
                },
              ),
              SizedBox(
                height: 10,
              ),
              PasswordField(
                  text: 'Password',
                  onSaved: (value) {
                    password = value!;
                  }),
              SizedBox(
                height: 5,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Text(
                  'Forgot Password?',
                  style: TextStyles.regular11
                      .copyWith(color: AppColors.primaryColor),
                ),
              ]),
              SizedBox(
                height: 50,
              ),
              CustomButton(
                  text: 'Login',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      context.read<LoginCubit>().signInWithEmailAndPassword(
                          email: email, password: password);
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  }),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account? ',
                    style: TextStyles.regular14,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, SignUpView.routeName);
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyles.bold13
                          .copyWith(color: AppColors.primaryColor),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25),
              const OrDivider(),
              SizedBox(height: 18),
              LoginWithGoogle(
                onTap: () {
                  context.read<LoginCubit>().signInWithGoogle();
                },
                img: Assets.imagesGoogleLogo,
                text: 'Sign in with Google',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
