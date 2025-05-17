import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

class CategoryItem {
  final String title;
  final String imageUrl;

  const CategoryItem({required this.title, required this.imageUrl});
}

class ShopByCategoryGrid extends StatelessWidget {
  const ShopByCategoryGrid({
    super.key,
    required this.categories,
  });

  final List<CategoryItem> categories;

  static const _tileBg = Color(0xFFFAF6EF);

  @override
  Widget build(BuildContext context) {
    const double tileHeight = 120;
    const double spacing = 16;

    return SizedBox(
      height: 5 * (tileHeight + spacing),
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(top: 4, bottom: 4),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          mainAxisSpacing: spacing,
          crossAxisSpacing: spacing,
          childAspectRatio: 1.3,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final item = categories[index];
          return Container(
            decoration: BoxDecoration(
              color: _tileBg,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                  child: CachedNetworkImage(
                    imageUrl: item.imageUrl,
                    fit: BoxFit.contain,
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Container(
                        width: double.infinity,
                        height: 60,
                        color: Colors.grey[300],
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  item.title,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
