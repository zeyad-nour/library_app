import 'package:flutter/material.dart';

class AuthFooter extends StatelessWidget {
  final String text;

  final String actionText;

  final VoidCallback onTap;

  const AuthFooter({
    super.key,
    required this.text,
    required this.actionText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        Text(text, style: const TextStyle(color: Color(0xff64748B))),

        GestureDetector(
          onTap: onTap,

          child: Text(
            actionText,

            style: const TextStyle(
              color: Color(0xff2563EB),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
