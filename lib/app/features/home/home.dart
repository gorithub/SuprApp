import 'package:flutter/material.dart';
import 'package:suprapp/app/core/constants/app_images.dart';
import 'package:suprapp/app/features/home/widgets/categories_gridview.dart';
import 'package:suprapp/app/features/home/widgets/congratulations_container.dart';
import 'package:suprapp/app/features/home/widgets/home_header.dart';
import 'package:suprapp/app/features/home/widgets/home_product_categories.dart';
import 'package:suprapp/app/features/home/widgets/star_plus_promo_section.dart';
import 'package:suprapp/app/features/home/widgets/suggestions_tiles.dart';
import 'package:suprapp/app/features/home/widgets/top_offers_section.dart';
import 'package:suprapp/app/features/home/widgets/top_picks_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> items = [
      {'name': 'Rides', 'pictureUrl': AppImages.rides},
      {'name': 'Food', 'pictureUrl': AppImages.food},
      {'name': 'DineOut', 'pictureUrl': AppImages.dineout},
      {'name': 'Groceries', 'pictureUrl': AppImages.groceries},
      {'name': 'Shops', 'pictureUrl': AppImages.shops},
      {'name': 'Send Money', 'pictureUrl': AppImages.sendmoney},
      {'name': 'Electronics', 'pictureUrl': AppImages.electronics},
      {'name': 'All Services', 'pictureUrl': AppImages.allservices},
    ];
    final List<Map<String, String>> suggestionsItems = [
      {'imagePath': AppImages.dailyProdcuts, 'title': 'Daily Products'},
      {
        'imagePath': "assets/images/fresh_vegetables.png",
        'title': 'Fresh vegetables'
      },
      {'imagePath': AppImages.fruits, 'title': 'Fresh Fruits'},
      // Add more items as needed
      {'imagePath': AppImages.dailyProdcuts, 'title': 'Daily Products'},
      {
        'imagePath': "assets/images/fresh_vegetables.png",
        'title': 'Fresh vegetables'
      },
      {'imagePath': AppImages.fruits, 'title': 'Fresh Fruits'},
      // Add more items as needed
    ];
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              HomeHeader(),
              CategoriesGridview(items: items),
              HomeProductCategories(),
              const SizedBox(height: 10),
              // Align(
              //   alignment: Alignment.centerLeft,
              //   child: Padding(
              //     padding: const EdgeInsets.only(left: 16),
              //     child: Text(
              //       'Suggestions',
              //       style: textTheme(
              //         context,
              //       ).headlineSmall?.copyWith(
              //           fontWeight: FontWeight.bold,
              //           color: const Color(0xff0A0C0B)),
              //     ),
              //   ),
              // ),

              SuggestionTile(
                suggestionsItems: suggestionsItems,
              ),
              const SizedBox(height: 20),
              Stack(
                children: [
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/taj_mehal.PNG',
                        width: double.infinity,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                      const CongratulationsContainer(),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 80),
                    child: Container(
                        height: 80,
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 35),
                        child: Image.asset(
                          'assets/images/car_background.png',
                          fit: BoxFit.fill,
                        )),
                  ),
                ],
              ),
              const SizedBox(height: 19),
              TopPicksSection(),
              const TopOffersSection(),
              const SuprPlusPromoSection(),
            ],
          ),
        ),
      ),
    );
  }
}

//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               HomeHeader(),
//               CategoriesGridview(items: items),
//               HomeProductCategories(),
//               const SizedBox(height: 10),
//               // Align(
//               //   alignment: Alignment.centerLeft,
//               //   child: Padding(
//               //     padding: const EdgeInsets.only(left: 16),
//               //     child: Text(
//               //       'Suggestions',
//               //       style: textTheme(
//               //         context,
//               //       ).headlineSmall?.copyWith(
//               //           fontWeight: FontWeight.bold,
//               //           color: const Color(0xff0A0C0B)),
//               //     ),
//               //   ),
//               // ),

//               SuggestionTile(
//                 suggestionsItems: suggestionsItems,
//               ),
//               const SizedBox(height: 20),
//               Stack(
//                 children: [
//                   Column(
//                     children: [
//                       Image.asset(
//                         'assets/images/taj_mehal.PNG',
//                         width: double.infinity,
//                         height: 100,
//                         fit: BoxFit.cover,
//                       ),
//                       const CongratulationsContainer(),
//                     ],
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 80),
//                     child: Container(
//                         height: 80,
//                         width: double.infinity,
//                         padding: const EdgeInsets.symmetric(horizontal: 35),
//                         child: Image.asset(
//                           'assets/images/car_background.png',
//                           fit: BoxFit.fill,
//                         )),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 19),
//               TopPicksSection(),
//               const TopOffersSection(),
//               const SuprPlusPromoSection(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
