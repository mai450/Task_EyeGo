import 'package:flutter/material.dart';
import 'package:news/core/utils/app_styles.dart';

class CategoriesHeader extends StatelessWidget {
  const CategoriesHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Categories',
          style: TextStyles.bold18,
        ),
      ],
    );
  }
}
