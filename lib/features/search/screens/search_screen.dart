import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/search_cubit.dart';
import '../cubit/search_state.dart';

import '../widgets/recent_searches.dart';
import '../widgets/search_app_bar.dart';
import '../widgets/search_results_list.dart';
import '../widgets/trending_searches.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),

      child: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          final cubit = context.read<SearchCubit>();

          return Scaffold(
            backgroundColor: const Color(0xffF8FAFC),

            body: Column(
              children: [
                SearchAppBar(
                  controller: cubit.searchController,
                  onChanged: cubit.handleSearch,
                ),

                Expanded(
                  child: cubit.isSearching
                      ? SearchResultsList(books: cubit.results)
                      : SingleChildScrollView(
                          padding: const EdgeInsets.all(24),

                          child: Column(
                            children: [
                              TrendingSearches(
                                items: cubit.trending,
                                onTap: cubit.handleSearch,
                              ),

                              const SizedBox(height: 40),

                              RecentSearches(
                                items: cubit.recent,
                                onTap: cubit.handleSearch,
                              ),
                            ],
                          ),
                        ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
