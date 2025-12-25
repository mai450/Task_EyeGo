import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/utils/app_colors.dart';
import 'package:news/core/utils/app_styles.dart';
import 'package:news/features/search/presentation/manger/cubits/search/search_cubit.dart';
import 'package:news/features/search/presentation/views/widgets/order_bottom_sheet.dart';
import 'package:news/features/search/presentation/views/widgets/search_text_field.dart';
import 'package:news/features/search/presentation/views/widgets/search_view_bloc_builder.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  String searchQuery = '';
  Timer? timer;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                    flex: 5,
                    child: SearchTextField(
                      onChanged: (value) {
                        if (timer?.isActive ?? false) timer!.cancel();
                        if (value.trim().isEmpty) {
                          context.read<SearchCubit>().clearResults();
                          return;
                        }
                        timer =
                            Timer(const Duration(milliseconds: 500), () async {
                          searchQuery = value;
                          context
                              .read<SearchCubit>()
                              .getSearchResults(query: searchQuery);
                        });
                      },
                      onSubmitted: (value) {
                        searchQuery = value;
                        if (value.trim().isEmpty) {
                          context.read<SearchCubit>().clearResults();
                          return;
                        }
                        context
                            .read<SearchCubit>()
                            .getSearchResults(query: searchQuery);
                      },
                    )),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      orderBottomSheet(context: context, query: searchQuery);
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 15),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(8)),
                      child: Icon(
                        Icons.filter_list,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Search Results',
              style: TextStyles.bold18,
            ),
            SizedBox(
              height: 20,
            ),
            SearchViewBlocBuilder(),
          ],
        ),
      ),
    );
  }
}
