import 'package:flutter/material.dart';
import 'package:news/core/utils/app_styles.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: Divider(
          color: Color(0xffDDDFDF),
        )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Text(
            'or',
            style: TextStyles.semiBold16,
          ),
        ),
        Expanded(
            child: Divider(
          color: Color(0xffDDDFDF),
        )),
      ],
    );
  }
}
