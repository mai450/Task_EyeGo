import 'package:flutter/material.dart';
import 'package:news/core/utils/app_styles.dart';

class NewContent extends StatelessWidget {
  const NewContent({
    super.key,
    required this.title,
    required this.des,
  });

  final String title;
  final String des;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyles.bold13.copyWith(color: Colors.white),
          ),
          const SizedBox(height: 4),
          Text(
            des,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyles.regular11.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
