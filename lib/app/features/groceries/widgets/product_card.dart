import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:suprapp/app/features/groceries/controllers/product_quantity_provider.dart';

class ProductCard extends StatelessWidget {
  final String id;
  final String title;
  final String price;
  final String discount;
  final String imageUrl;
  final String? oldPrice;
  final bool showOldPrice;
  final VoidCallback? onTap;

  const ProductCard({
    super.key,
    required this.id,
    required this.title,
    required this.price,
    required this.discount,
    required this.imageUrl,
    this.oldPrice,
    this.showOldPrice = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final quantity = context.watch<QuantityProvider>().getQuantity(id);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 140,
        margin: const EdgeInsets.only(right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                // Product Image with placeholder shimmer
                Container(
                  width: 170,
                  height: 110,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFAF6EF),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Container(color: Colors.grey.shade300),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                // Discount badge
                Positioned(
                  top: 6,
                  left: 6,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.red.shade400,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      discount,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                // Quantity controls or Add button
                Positioned(
                  bottom: 6,
                  right: 6,
                  child: quantity > 0
                      ? Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.black12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12.withOpacity(0.05),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              InkWell(
                                borderRadius: BorderRadius.circular(20),
                                onTap: () {
                                  if (quantity == 1) {
                                    context.read<QuantityProvider>().remove(id);
                                  } else {
                                    context.read<QuantityProvider>().decrease(id);
                                  }
                                },
                                child: Icon(
                                  quantity == 1 ? Icons.delete : Icons.remove,
                                  size: 20,
                                  color:
                                      quantity == 1 ? Colors.red : Colors.black,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Text(
                                quantity.toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(width: 12),
                              InkWell(
                                borderRadius: BorderRadius.circular(20),
                                onTap: () {
                                  context.read<QuantityProvider>().increase(id);
                                },
                                child: const Icon(Icons.add, size: 20),
                              ),
                            ],
                          ),
                        )
                      : InkWell(
                          borderRadius: BorderRadius.circular(8),
                          onTap: () {
                            context.read<QuantityProvider>().increase(id);
                          },
                          child: Container(
                            height: 32,
                            width: 32,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.black12),
                            ),
                            child: const Icon(Icons.add, size: 20),
                          ),
                        ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                height: 1.3,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              price,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xFF179C52),
              ),
            ),
            if (showOldPrice && oldPrice != null)
              Text(
                oldPrice!,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black38,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
