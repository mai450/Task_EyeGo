import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/utils/app_colors.dart';
import 'package:news/core/utils/app_styles.dart';
import 'package:news/core/utils/widgets/custom_button.dart';
import 'package:news/core/utils/widgets/custom_text_field.dart';

import '../../../../../core/utils/widgets/password_text_field.dart';
import '../../manger/cubits/sign_up_cubit/sign_up_cubit.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, password, name;
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
                'Sign Up',
                style: TextStyles.bold24,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Create an account',
                style: TextStyles.regular14.copyWith(color: Color(0xff949D9E)),
              ),
              SizedBox(
                height: 40,
              ),
              CustomTextField(
                text: 'Name',
                keyboardType: TextInputType.emailAddress,
                onSaved: (value) {
                  name = value!;
                },
              ),
              SizedBox(
                height: 10,
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
                height: 60,
              ),
              CustomButton(
                  text: 'Sign Up',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      context.read<SignUpCubit>().signUpWithEmailAndPassword(
                            email: email,
                            password: password,
                            name: name,
                          );
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
                    'Already have an account? ',
                    style: TextStyles.regular14,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Login',
                      style: TextStyles.bold13
                          .copyWith(color: AppColors.primaryColor),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
