import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_styles.dart';

class LoginWithGoogle extends StatelessWidget {
  const LoginWithGoogle(
      {super.key, required this.img, required this.text, required this.onTap});

  final String img;
  final String text;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Color(0xffDDDFDF)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(img),
            SizedBox(
              width: 20,
            ),
            Text(
              text,
              style: TextStyles.semiBold13,
            )
          ],
        ),
      ),
    );
  }
}
