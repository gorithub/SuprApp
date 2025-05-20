import 'package:flutter/material.dart';
import 'package:suprapp/app/core/constants/global_variables.dart';
import 'package:suprapp/app/features/food/widgets/food_card.dart';
import 'package:suprapp/app/features/food/widgets/lists.dart';

class ProductScreen extends StatelessWidget {
  final String category;

  const ProductScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final products = categoryProducts[category] ?? [];

    return Scaffold(
        appBar: AppBar(
          title: Text(
            '$category Products',
            style: textTheme(context).titleMedium?.copyWith(
                color: colorScheme(context).onSurface,
                fontWeight: FontWeight.w700),
          ),
        ),
        body: products.isEmpty
            ? const Center(child: Text("No products found"))
            : Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Expanded(
                      child: GridView.builder(
                        itemCount: products.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio:
                              0.68, // Adjust based on your FoodCard height
                        ),
                        itemBuilder: (context, index) {
                          final p = products[index];
                          return FoodCard(
                            image: p['image'],
                            title: p['title'],
                            oldPrice: p['oldPrice'],
                            newPrice: p['newPrice'],
                            offerText: p['offerText'],
                            portion: p['portion'],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ));
  }
}
