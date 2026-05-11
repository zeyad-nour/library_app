import 'package:flutter/material.dart';

import 'glass_icon_button.dart';

class DetailsHeader extends StatelessWidget {
  const DetailsHeader({
    super.key,
    required this.image,
    required this.isFavorite,
    required this.onFavoriteTap,
  });

  final String image;

  final bool isFavorite;

  final VoidCallback onFavoriteTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          image,

          width: double.infinity,
          height: 380,

          fit: BoxFit.cover,
        ),

        Container(
          width: double.infinity,
          height: 380,

          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,

              colors: [Colors.transparent, Color(0xffF8FAFC)],
            ),
          ),
        ),

        Positioned(
          top: 60,
          left: 20,
          right: 20,

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              GlassIconButton(
                icon: Icons.arrow_back_ios_new,

                onTap: () {
                  Navigator.pop(context);
                },
              ),

              Row(
                children: [
                  GlassIconButton(
                    icon: isFavorite ? Icons.favorite : Icons.favorite_border,

                    color: isFavorite ? Colors.red : Colors.white,

                    onTap: onFavoriteTap,
                  ),

                  const SizedBox(width: 10),

                  GlassIconButton(icon: Icons.share_outlined, onTap: () {}),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
