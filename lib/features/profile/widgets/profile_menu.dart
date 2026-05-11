import 'package:flutter/material.dart';

import 'dark_mode_tile.dart';
import 'profile_menu_item.dart';

class ProfileMenu extends StatelessWidget {
  final List items;

  final bool darkMode;

  final VoidCallback onToggle;

  const ProfileMenu({
    super.key,
    required this.items,
    required this.darkMode,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(26),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),

      child: Column(
        children: [
          ...List.generate(items.length, (index) {
            return ProfileMenuItem(item: items[index]);
          }),

          DarkModeTile(value: darkMode, onChanged: onToggle),
        ],
      ),
    );
  }
}
