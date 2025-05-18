import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String discount;
  final String imageUrl;
  final String? oldPrice;
  final bool showOldPrice;
  final VoidCallback? onAddTap;

  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.discount,
    required this.imageUrl,
    this.oldPrice,
    this.showOldPrice = false,
    this.onAddTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: 170, 
                height: 110, 
                decoration: BoxDecoration(
                  color: const Color(0xFFFAF6EF),
                  borderRadius: BorderRadius.circular(16),
                ),
                clipBehavior: Clip.hardEdge,
                child: AspectRatio(
                  aspectRatio: 4 / 3, 
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Container(
                        color: Colors.grey[300],
                      ),
                    ),
                    errorWidget: (context, url, error) => const Icon(
                      Icons.error,
                      size: 40,
                      color: Colors.redAccent,
                    ),
                  ),
                ),
              ),
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
              Positioned(
                bottom: 6,
                right: 6,
                child: GestureDetector(
                  onTap: onAddTap,
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
    );
  }
}
