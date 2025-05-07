import 'package:flutter/material.dart';
import 'package:suprapp/app/features/home/widgets/item_gridtile.dart';

class CategoriesGridview extends StatelessWidget {
  const CategoriesGridview({super.key, required this.items});

  final List<Map<String, String>> items;

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
            onTap: () {},
          );
        },
      ),
    );
  }
}
