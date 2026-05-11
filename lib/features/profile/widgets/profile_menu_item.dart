import 'package:flutter/material.dart';
import 'package:library_app/models/profile_menu_model.dart';

class ProfileMenuItem extends StatelessWidget {
  final ProfileMenuModel item;

  const ProfileMenuItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        if (item.title == "History") {
          Navigator.pushNamed(context, '/history');
        }
      },

      leading: Icon(item.icon, color: item.color),

      title: Text(
        item.title,

        style: const TextStyle(
          color: Color(0xff0F172A),
          fontWeight: FontWeight.w500,
        ),
      ),

      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 18,
        color: Color(0xff64748B),
      ),
    );
  }
}
