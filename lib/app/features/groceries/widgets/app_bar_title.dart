import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:suprapp/app/core/constants/app_colors.dart';
import 'package:suprapp/app/core/constants/global_variables.dart';
import 'package:suprapp/app/features/groceries/widgets/select_address_sheet.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  context.pop();
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.appGrey),
                      borderRadius: BorderRadius.circular(7)),
                  child: const Icon(
                    Icons.arrow_back,
                    color: AppColors.darkGrey,
                    size: 20,
                  ),
                ),
              ),
              Text(
                'GROCERIES',
                style: textTheme(context).headlineLarge?.copyWith(
                      color: colorScheme(context).primary,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: colorScheme(context).primary,
                      border: Border.all(color: AppColors.appGrey),
                      borderRadius: BorderRadius.circular(7)),
                  child: const Icon(
                    Icons.menu,
                    color: Color.fromARGB(255, 20, 188, 96),
                    size: 15,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                   showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const SelectAddressSheet(),
    );
                },
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Mona',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 4),
                        Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 20,
                          color: Colors.black54,
                        ),
                      ],
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Mona 63, Business Area',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Delivering in',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(height: 2),
                  Row(
                    children: [
                      Icon(Icons.flash_on_outlined,
                          color: Colors.black, size: 18),
                      SizedBox(width: 4),
                      Text(
                        '18 mins',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
