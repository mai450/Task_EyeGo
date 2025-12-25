import 'package:flutter/material.dart';
import 'package:news/core/utils/app_colors.dart';

import '../app_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.text,
      this.suffixIcon,
      required this.keyboardType,
      this.onSaved,
      this.obscureText = false,
      this.onChanged,
      this.controller,
      this.contentPadding});

  final String text;
  final Widget? suffixIcon;
  final bool? obscureText;
  final TextInputType keyboardType;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final TextEditingController? controller;
  final EdgeInsetsGeometry? contentPadding;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field is required';
        }
        return null;
      },
      controller: controller,
      onSaved: onSaved,
      onChanged: onChanged,
      keyboardType: keyboardType,
      obscureText: obscureText!,
      cursorColor: AppColors.primaryColor,
      decoration: InputDecoration(
        contentPadding: contentPadding,
        hintText: text,
        hintStyle: TextStyles.bold13.copyWith(color: Color(0xff949D9E)),
        filled: true,
        fillColor: Color(0xffF9FAFA),
        border: outlineInputBorder(),
        focusedBorder: outlineInputBorder(),
        enabledBorder: outlineInputBorder(),
        suffixIcon: suffixIcon,
      ),
    );
  }

  OutlineInputBorder outlineInputBorder() => OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(
          color: Color(0xffE6E9EA),
        ),
      );
}
