import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:suprapp/app/core/constants/app_colors.dart';
import 'package:suprapp/app/core/constants/app_images.dart';
import 'package:suprapp/app/core/constants/global_variables.dart';

class CustomRow extends StatelessWidget {
  final String discount;
  final VoidCallback onTap;
  const CustomRow({super.key, required this.discount, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border(
                  bottom: BorderSide(color: Colors.black.withOpacity(0.2)),
                  top: BorderSide(color: Colors.black.withOpacity(0.2)),
                  left: BorderSide(color: Colors.black.withOpacity(0.2)))),
          child: SvgPicture.asset(AppIcon.offer, height: 20, width: 20),
        ),
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.black.withOpacity(0.2))),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Offer",
                      style: textTheme(context).labelMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.carmineRed),
                    ),
                    Text(
                      "Crazy Deals: ${discount}",
                      style: textTheme(context).labelMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    )
                  ],
                ),
                const SizedBox(width: 30),
                const Icon(Icons.info_outline, size: 25)
              ],
            ),
          ),
        )
      ],
    );
  }
}
