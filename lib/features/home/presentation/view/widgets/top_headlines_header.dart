import 'package:flutter/material.dart';
import 'package:news/core/utils/app_styles.dart';

class TopHeadlinesHeader extends StatelessWidget {
  const TopHeadlinesHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Top Headlines',
          style: TextStyles.bold18,
        ),
        Spacer(),
        Text(
          'See all',
          style: TextStyles.regular14,
        ),
      ],
    );
  }
}
