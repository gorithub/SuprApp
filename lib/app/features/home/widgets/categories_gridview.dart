import 'package:flutter/material.dart';
import 'package:suprapp/app/features/home/widgets/item_gridtile.dart';

class CategoriesGridview extends StatelessWidget {
  const CategoriesGridview({super.key, required this.items});

  final List<Map<String, String>> items;

  // void _handleNavigation(BuildContext context, String categoryName) {
  //   switch (categoryName) {
  //     case 'Rides':
  //       Navigator.pushNamed(context, AppRoutes.selectAddressScreen);
  //       break;
  //     case 'Electronics':
  //       Navigator.push(context,
  //           MaterialPageRoute(builder: (context) => QuickElectronicsScreen()));
  //       break;
  //     case 'Food':
  //       Navigator.pushNamed(context, AppRoutes.foodScreen);
  //       break;
  //     case 'DineOut':
  //       Navigator.push(
  //           context, MaterialPageRoute(builder: (context) => DineOutPage()));
  //       break;
  //     case 'Groceries':
  //       Navigator.push(
  //           context, MaterialPageRoute(builder: (context) => GroceryScreen()));
  //       break;
  //     case 'Shops':
  //       Navigator.pushNamed(context, AppRoutes.shopsScreen);
  //       break;
  //     case 'Send Money':
  //       Navigator.push(
  //           context, MaterialPageRoute(builder: (context) => ComingSoonPage()));
  //       break;
  //     case 'All Services':
  //       Navigator.push(
  //           context,
  //           MaterialPageRoute(
  //             builder: (context) => AllServicesPage(),
  //           ));
  //       break;
  //     default:
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text('No screen defined for $categoryName')),
  //       );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
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
            // final isThirdItem = index == 2;
            // final isSixthItem = index == 5;
            final imageHeight = 63;
            //  isThirdItem
            //     ? 67.0
            //     : isSixthItem
            //         ? 48.0
            //         : 55.0;

            final imageWidth = 63;
            //  isThirdItem
            //     ? 106.0
            //     : isSixthItem
            //         ? 58.0
            //         : 60.0;

            return ItemGridTile(
              imagePath: item['pictureUrl']!,
              title: item['name']!,
              height: imageHeight.toDouble(),
              width: imageWidth.toDouble(),
              onTap: () {},
              // onTap: () => _handleNavigation(context, item['name']!),
            );
          },
        ),
      ),
    );
  }
}
