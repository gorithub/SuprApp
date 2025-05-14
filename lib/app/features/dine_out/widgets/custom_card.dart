import 'package:flutter/material.dart';
import 'package:suprapp/app/core/constants/app_colors.dart';
import 'package:suprapp/app/core/constants/global_variables.dart';
import 'package:suprapp/app/features/dine_out/widgets/customTabController.dart';

class CustomContainer extends StatelessWidget {
  final List<String> images;
  final String text;
  final String title;
  final String rating;
  final String location;
  final String food;
  final String discount;
  const CustomContainer(
      {super.key,
      required this.images,
      required this.text,
      required this.title,
      required this.rating,
      required this.location,
      required this.food,
      required this.discount});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.42,
      width: MediaQuery.of(context).size.width * 0.3,
      child: DefaultTabController(
        length: images.length,
        child: Builder(
          builder: (context) {
            final TabController tabController =
                DefaultTabController.of(context);

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 159,
                  child: Stack(
                    children: [
                      TabBarView(
                        controller: tabController,
                        children: images.map((imgPath) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              imgPath,
                              cacheHeight: 150,
                              cacheWidth: 500,
                              fit: BoxFit.cover,
                            ),
                          );
                        }).toList(),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomTabPageSelector(
                            controller: tabController,
                            selectedColor: Colors.white,
                            unselectedColor: Colors.grey,
                            width: 10,
                            height: 5,
                            borderRadius: 6,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          const SizedBox(width: 10),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 6),
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 98, 229, 11),
                                borderRadius: BorderRadius.circular(4)),
                            child: Text(text,
                                style: textTheme(context).labelMedium),
                          ),
                          const Spacer(),
                          Container(
                            margin: const EdgeInsets.only(right: 8, top: 10),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(Icons.favorite_outline, size: 16),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Text(
                  title,
                  style: textTheme(context)
                      .bodyLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    const Icon(Icons.star,
                        color: AppColors.chromeYellow, size: 16),
                    Text(
                      rating,
                      style: textTheme(context)
                          .labelLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      height: 5,
                      width: 5,
                      decoration: BoxDecoration(
                          color: colorScheme(context).onSurface,
                          shape: BoxShape.circle),
                    ),
                    Text(
                      location,
                      style: textTheme(context)
                          .labelLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Text(
                  food,
                  style: textTheme(context).labelLarge,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 14),
                  decoration: BoxDecoration(
                      color: colorScheme(context).primary,
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    "😏+ | $discount",
                    style: textTheme(context)
                        .labelLarge
                        ?.copyWith(color: AppColors.brightGreen),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
