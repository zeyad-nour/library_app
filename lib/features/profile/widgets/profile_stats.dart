import 'package:flutter/material.dart';

class ProfileStats extends StatelessWidget {
  final List stats;

  const ProfileStats({super.key, required this.stats});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(stats.length, (index) {
        final item = stats[index];

        return Expanded(
          child: Container(
            margin: EdgeInsets.only(right: index == stats.length - 1 ? 0 : 14),

            padding: const EdgeInsets.symmetric(vertical: 20),

            decoration: BoxDecoration(
              color: Colors.white,

              borderRadius: BorderRadius.circular(24),

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
                Text(
                  item["value"],

                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff2563EB),
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  item["title"],

                  textAlign: TextAlign.center,

                  style: const TextStyle(
                    color: Color(0xff64748B),

                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
