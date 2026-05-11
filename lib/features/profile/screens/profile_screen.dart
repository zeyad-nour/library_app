import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/profile_cubit.dart';
import '../cubit/profile_state.dart';

import '../widgets/logout_button.dart';
import '../widgets/profile_header.dart';
import '../widgets/profile_menu.dart';
import '../widgets/profile_stats.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),

      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          final cubit = context.read<ProfileCubit>();

          return Scaffold(
            backgroundColor: const Color(0xffF8FAFC),

            body: SingleChildScrollView(
              child: Column(
                children: [
                  ProfileHeader(user: cubit.user),

                  Transform.translate(
                    offset: const Offset(0, -40),

                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),

                      child: Column(
                        children: [
                          ProfileStats(stats: cubit.user["stats"] as List),

                          const SizedBox(height: 24),

                          ProfileMenu(
                            items: cubit.menuItems,
                            darkMode: cubit.darkMode,
                            onToggle: cubit.toggleDarkMode,
                          ),

                          const SizedBox(height: 24),

                          const LogoutButton(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
