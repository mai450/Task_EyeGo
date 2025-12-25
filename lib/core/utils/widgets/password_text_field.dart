import 'package:flutter/material.dart';
import 'package:news/core/utils/widgets/custom_text_field.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({super.key, this.onSaved, required this.text});

  final void Function(String?)? onSaved;
  final String text;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
        text: widget.text,
        keyboardType: TextInputType.visiblePassword,
        obscureText: isObscure,
        suffixIcon: Padding(
          padding: EdgeInsets.only(left: 22),
          child: IconButton(
            onPressed: () {
              isObscure = !isObscure;
              setState(() {});
            },
            icon: isObscure
                ? Icon(
                    Icons.visibility_off,
                    color: Color(0xffC9CECF),
                  )
                : Icon(
                    Icons.visibility,
                    color: Color(0xffC9CECF),
                  ),
          ),
        ),
        onSaved: widget.onSaved);
  }
}
