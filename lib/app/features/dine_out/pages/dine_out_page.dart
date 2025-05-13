import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:suprapp/app/core/constants/app_colors.dart';
import 'package:suprapp/app/core/constants/global_variables.dart';

class DineOutPage extends StatefulWidget {
  const DineOutPage({super.key});

  @override
  State<DineOutPage> createState() => _DineOutPageState();
}

class _DineOutPageState extends State<DineOutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              context.pop();
            },
            child: Container(
              height: 30,
              width: 30,
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
        ),
        centerTitle: true,
        title: Text(
          'DineOut',
          style: textTheme(context).headlineLarge?.copyWith(
                color: colorScheme(context).primary,
                fontWeight: FontWeight.w600,
              ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {},
              child: Container(
                height: 50,
                width: 40,
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.appGrey),
                    borderRadius: BorderRadius.circular(7)),
                child: Icon(
                  Icons.favorite_outline,
                  color: AppColors.darkGrey,
                  size: 16,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {},
              child: Container(
                height: 50,
                width: 40,
                decoration: BoxDecoration(
                    color: colorScheme(context).primary,
                    border: Border.all(color: AppColors.appGrey),
                    borderRadius: BorderRadius.circular(7)),
                child: Icon(
                  Icons.menu,
                  color: const Color.fromARGB(255, 20, 188, 96),
                  size: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
