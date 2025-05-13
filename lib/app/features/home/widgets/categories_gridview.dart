// ignore_for_file: prefer_const_declarations

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:suprapp/app/features/home/widgets/item_gridtile.dart';
import 'package:suprapp/app/routes/go_router.dart';

class CategoriesGridview extends StatelessWidget {
  const CategoriesGridview({super.key, required this.items});

  final List<Map<String, String>> items;
  void _handleNavigation(BuildContext context, String categoryName) {
    switch (categoryName) {
      case 'Rides':
        // Navigator.pushNamed(context, AppRoutes.selectAddressScreen);
        break;
      case 'Electronics':
        //  Navigator.push(context,
        //       MaterialPageRoute(builder: (context) => QuickElectronicsScreen()));
        break;
      case 'Food':
        // Navigator.pushNamed(context, AppRoutes.foodScreen);
        break;
      case 'DineOut':
        context.pushNamed(AppRoute.dineOutPage);
        break;
      case 'Groceries':
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => GroceryScreen()));
        break;
      case 'Shops':
        // Navigator.pushNamed(context, AppRoutes.shopsScreen);
        break;
      case 'Send Money':
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => ComingSoonPage()));
        break;
      case 'All Services':
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => AllServicesPage(),
        //     ));
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
