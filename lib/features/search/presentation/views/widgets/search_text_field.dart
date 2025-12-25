import 'package:flutter/material.dart';
import 'package:news/core/utils/app_colors.dart';
import 'package:news/core/utils/app_styles.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField(
      {super.key, this.onChanged, this.onSubmitted, this.controller});
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 7,
            offset: Offset(0, 2),
            spreadRadius: 0)
      ]),
      child: TextField(
          keyboardType: TextInputType.text,
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          controller: controller,
          autofocus: true,
          cursorColor: AppColors.primaryColor,
          decoration: InputDecoration(
            hintText: 'Search...',
            hintStyle: TextStyles.regular14.copyWith(color: Color(0xff949D9E)),
            contentPadding: const EdgeInsets.symmetric(vertical: 10),
            filled: true,
            fillColor: Colors.white,
            border: outlineInputBorder(),
            focusedBorder: outlineInputBorder(),
            enabledBorder: outlineInputBorder(),
            prefixIcon: SizedBox(
                width: 20,
                child: Center(
                    child: Icon(
                  Icons.search,
                  color: AppColors.primaryColor,
                ))),
          )),
    );
  }

  OutlineInputBorder outlineInputBorder() => OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: Colors.white,
        ),
      );
}
