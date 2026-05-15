import 'package:flutter/material.dart';
import 'package:library_app/features/home/presentation/view/widgets/main_screen.dart';

class SearchAppBar extends StatelessWidget {
  final TextEditingController controller;

  final Function(String) onChanged;

  const SearchAppBar({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      color: Colors.white,

      child: Row(
        children: [
          Container(
            width: 45,
            height: 45,

            decoration: BoxDecoration(
              color: const Color(0xffF8FAFC),
              borderRadius: BorderRadius.circular(14),
            ),

            child: IconButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => MainScreen()),
                  (route) => false,
                );
              },

              icon: const Icon(
                Icons.arrow_back_ios_new,
                size: 20,
                color: Color(0xff0F172A),
              ),
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: TextField(
              controller: controller,
              onChanged: onChanged,

              decoration: InputDecoration(
                hintText: "Search books, authors...",

                prefixIcon: const Icon(Icons.search, color: Color(0xff64748B)),

                filled: true,
                fillColor: const Color(0xffF8FAFC),

                contentPadding: const EdgeInsets.symmetric(vertical: 16),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: Color(0xffE2E8F0)),
                ),

                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: Color(0xffE2E8F0)),
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: Color(0xff2563EB),
                    width: 2,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
