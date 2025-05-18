import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:suprapp/app/core/constants/app_colors.dart';
import 'package:suprapp/app/core/constants/global_variables.dart';
import 'package:suprapp/app/routes/go_router.dart';
import 'package:suprapp/app/shared/widgets/custom_elevated_button.dart';

class EnterPickUpLocationPage extends StatefulWidget {
  const EnterPickUpLocationPage({super.key});

  @override
  State<EnterPickUpLocationPage> createState() =>
      _EnterPickUpLocationPageState();
}

class _EnterPickUpLocationPageState extends State<EnterPickUpLocationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
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
                Icons.close,
                color: AppColors.darkGrey,
                size: 20,
              ),
            ),
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {},
              child: Container(
                height: 50,
                width: 40,
                decoration: BoxDecoration(
                    color: colorScheme(context).surface,
                    border: Border.all(color: AppColors.appGrey),
                    borderRadius: BorderRadius.circular(7)),
                child: Icon(
                  Icons.menu,
                  color: AppColors.darkGrey,
                  size: 15,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Pickup location",
              style: textTheme(context)
                  .headlineLarge
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 40,
            ),
            Material(
              child: InkWell(
                onTap: () {
                  context.pushNamed(AppRoute.searchLocationPage);
                },
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: double.infinity,
                  child: Card(
                    elevation: 6,
                    shadowColor: AppColors.appGrey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 2, left: 10),
                          child: Container(
                            height: 13,
                            width: 20,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: colorScheme(context).primary,
                                    width: 2),
                                shape: BoxShape.circle),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Enter your pickup location',
                          style: textTheme(context).titleSmall?.copyWith(
                              color: colorScheme(context)
                                  .onSurface
                                  .withOpacity(0.2),
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              width: double.infinity,
              child: Card(
                elevation: 6,
                shadowColor: AppColors.darkGrey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Supr requires access to\nyour location',
                        style: textTheme(context)
                            .titleLarge
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Enable location services for a more accurate pickup experiences',
                        style: textTheme(context).bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.darkGrey),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomElevatedButton(
                        text: 'Turn on location services',
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
