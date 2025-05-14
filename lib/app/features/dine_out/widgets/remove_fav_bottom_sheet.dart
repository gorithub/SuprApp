// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:suprapp/app/core/constants/app_colors.dart';
import 'package:suprapp/app/core/constants/app_images.dart';
import 'package:suprapp/app/routes/go_router.dart';
import 'package:suprapp/app/shared/widgets/custom_elevated_button.dart';

class RemoveFavBottomSheet extends StatelessWidget {
  const RemoveFavBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return DraggableScrollableSheet(
      initialChildSize: 0.44,
      minChildSize: 0.44,
      maxChildSize: 0.9,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                'Remove from favourites ?',
                style: textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'Are you sure you wnat to remove this\nfrom your favourite',
                style: textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 30),
              CustomElevatedButton(
                buttonColor: colorScheme.error,
                text: 'Remove',
                onPressed: () {
                  context.pushNamed(AppRoute.phoneAuthPage);
                },
              ),
              const SizedBox(height: 30),
              CustomElevatedButton(
                buttonColor: colorScheme.error,
                text: 'Cancel',
                onPressed: () {
                  context.pushNamed(AppRoute.phoneAuthPage);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
