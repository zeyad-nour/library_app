import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:library_app/models/profile_menu_model.dart';

import '../data/profile_data.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  final user = profileData;

  final List<ProfileMenuModel> menuItems = [
    ProfileMenuModel(
      title: "Edit Profile",
      icon: Icons.person_outline,
      color: Colors.blue,
    ),

    ProfileMenuModel(
      title: "Notifications",
      icon: Icons.notifications_none,
      color: Colors.orange,
    ),

    ProfileMenuModel(
      title: "Privacy",
      icon: Icons.lock_outline,
      color: Colors.green,
    ),

    ProfileMenuModel(
      title: "History",
      icon: Icons.history,
      color: Colors.purple,
    ),

    ProfileMenuModel(
      title: "Borrowed Books",
      icon: Icons.menu_book_rounded,
      color: Colors.teal,
    ),
  ];

  bool darkMode = false;

  void toggleDarkMode() {
    darkMode = !darkMode;

    emit(ProfileInitial());
  }
}
