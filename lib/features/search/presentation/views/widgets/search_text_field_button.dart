import 'package:flutter/material.dart';
import 'package:news/core/utils/app_colors.dart';
import 'package:news/core/utils/app_styles.dart';

import '../search_view.dart';

class SearchTextFieldButton extends StatelessWidget {
  const SearchTextFieldButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, SearchView.routeName);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white),
            boxShadow: [
              BoxShadow(
                  color: Color(0x0A000000),
                  blurRadius: 7,
                  offset: Offset(0, 2),
                  spreadRadius: 0),
            ]),
        child: Row(
          children: [
            SizedBox(
                width: 20,
                child: Center(
                    child: Icon(
                  Icons.search,
                  color: AppColors.primaryColor,
                ))),
            SizedBox(width: 10),
            Text('Search...',
                style: TextStyles.regular14.copyWith(color: Color(0xff979899))),
            Spacer(),
            SizedBox(
              width: 20,
              child: Center(
                child: Icon(
                  Icons.filter_list,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
