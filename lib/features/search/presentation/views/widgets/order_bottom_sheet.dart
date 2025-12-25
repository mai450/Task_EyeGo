import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/utils/app_colors.dart';
import 'package:news/core/utils/app_styles.dart';
import 'package:news/core/utils/widgets/custom_button.dart';
import 'package:news/features/search/presentation/manger/cubits/search/search_cubit.dart';

orderBottomSheet({
  required BuildContext context,
  required String query,
}) {
  String sortBy = 'relevancy';
  final parentContext = context;

  return showModalBottomSheet(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.51,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('Filter', style: TextStyles.bold20),
                      const Spacer(),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Sort By:',
                    style: TextStyles.bold13,
                  ),
                  RadioListTile(
                    title: const Text('Relevancy'),
                    value: 'relevancy',
                    groupValue: sortBy,
                    activeColor: AppColors.primaryColor,
                    onChanged: (value) {
                      setState(() {
                        sortBy = value!;
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text('Popularity'),
                    value: 'popularity',
                    groupValue: sortBy,
                    activeColor: AppColors.primaryColor,
                    onChanged: (value) {
                      setState(() {
                        sortBy = value!;
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text('PublishedAt'),
                    value: 'publishedAt',
                    groupValue: sortBy,
                    activeColor: AppColors.primaryColor,
                    onChanged: (value) {
                      setState(() {
                        sortBy = value!;
                      });
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 25),
                      child: CustomButton(
                        text: 'SAVE',
                        onPressed: () {
                          parentContext.read<SearchCubit>().getFilteredArticles(
                              query: query, sortBy: sortBy);
                          Navigator.pop(context);
                        },
                      )),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
