// ignore_for_file: prefer_const_declarations

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:suprapp/app/core/constants/app_images.dart';
import 'package:suprapp/app/features/all_services/all_services.dart';
import 'package:suprapp/app/features/all_services/coming_soon_page.dart';
import 'package:suprapp/app/features/home/widgets/animated_service_tile.dart';
import 'package:suprapp/app/features/home/widgets/item_gridtile.dart';
import 'package:suprapp/app/features/super_quick_electronics/quickelec_main_screen.dart';
import 'package:suprapp/app/routes/go_router.dart';

class CategoriesGridview extends StatelessWidget {
  const CategoriesGridview({super.key, required this.items});

  final List<Map<String, String>> items;
  void _handleNavigation(BuildContext context, String categoryName) {
    switch (categoryName) {
      case 'Rides':
        context.pushNamed(AppRoute.rideHome);
        break;
      case 'Electronics':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => QuickElectronicsScreen()));
        break;
      case 'Food':
        context.pushNamed(AppRoute.foodPage);
        break;
      case 'DineOut':
        context.pushNamed(AppRoute.dineOutPage);
        break;
      case 'Groceries':
        context.pushNamed(AppRoute.groceryHomeScreen);
        break;
      case 'Shops':
        context.pushNamed(AppRoute.shopScreen);
        break;
      case 'Send Money':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ComingSoonPage()));
        break;
      case 'All Services':
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AllServicesPage(),
            ));
        break;
      default:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('No screen defined for $categoryName')),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double horizontalPadding = 32;
    final double spacing = 10 * 3;
    final double tileWidth = (screenWidth - horizontalPadding - spacing) / 4;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        padding: const EdgeInsets.all(8),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 25,
          childAspectRatio: 0.8,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];

          // 3rd (index 2), 7th (index 6), 8th (index 7)
          final specialIndexes = [2, 6, 7];
          final scaleFactor = specialIndexes.contains(index) ? 1.7 : 1.0;

          final name = item['name']!;
          if (name == 'All Services') {
            return AnimatedGridTile(
              imageList: [
                AppImages.rides,
                AppImages.food,
                AppImages.dineout,
                AppImages.groceries,
                AppImages.shops,
                AppImages.sendmoney,
                AppImages.electronics,
                AppImages.allservices,
              ],
              title: name,
              tileWidth: tileWidth,
              onTap: () => _handleNavigation(context, name),
            );
          }

          return ItemGridTile(
            imagePath: item['pictureUrl']!,
            title: item['name']!,
            tileWidth: tileWidth,
            imageScaleFactor: scaleFactor,
            onTap: () => _handleNavigation(context, item['name']!),
          );
        },
      ),
    );
  }
}
