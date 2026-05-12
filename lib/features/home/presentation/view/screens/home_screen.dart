import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/core/services/api_services/api_service.dart';
import 'package:library_app/features/home/data/repos/recomended_repo/recomended_repo_imp.dart';
import 'package:library_app/features/home/presentation/state_mangement/cubit/home_state.dart';

import '../../state_mangement/cubit/home_cubit.dart';
import '../widgets/category_grid.dart';
import '../widgets/home_header.dart';
import '../widgets/recommended_section.dart';
import '../widgets/trending_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    final userName = user?.displayName ?? "User";
    final cubit = HomeCubit(RecomendedRepoImp(ApiService(Dio())));
    return BlocProvider(
      create: (context) => HomeCubit(RecomendedRepoImp(ApiService(Dio()))),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: const Color(0xffF8FAFC),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  HomeHeader(userName: userName),
                  const HomeBody(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(24),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          CategoryGrid(),

          SizedBox(height: 35),

          RecommendedSection(),

          SizedBox(height: 35),

          TrendingSection(),
        ],
      ),
    );
  }
}
