import 'package:flutter/material.dart';
import 'product_card.dart';

class ProductSection extends StatelessWidget {
  final String title;
  final List<Map<String, String>> products;
  final bool isHerbal;
  final VoidCallback? onSectionTap;

  const ProductSection({
    super.key,
    required this.title,
    required this.products,
    this.isHerbal = false,
    this.onSectionTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: onSectionTap,
              child: const Icon(Icons.arrow_forward),
            ),
          ],
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, index) {
              final item = products[index];
              return ProductCard(
                id: item['id']?? "",
                title: item['title']!,
                price: item['price']!,
                discount: item['discount']!,
                oldPrice: item['old'],
                showOldPrice: isHerbal,
                imageUrl: item['image'] ?? 'https://via.placeholder.com/150',
                onTap: () {
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
