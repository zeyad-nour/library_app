import 'package:flutter/material.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 58,

      child: ElevatedButton.icon(
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(
            context,
            '/login',
            (route) => false,
          );
        },

        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xffEF4444),

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),

        icon: const Icon(Icons.logout, color: Colors.white),

        label: const Text(
          "Logout",

          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
