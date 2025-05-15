import 'package:flutter/material.dart';
import 'package:suprapp/app/core/constants/app_colors.dart';
import 'package:suprapp/app/core/constants/global_variables.dart';

class FoodItemCard extends StatefulWidget {
  final String title;
  final String description;
  final String imageUrl;
  final double price;
  final double oldPrice;
  final int discount;

  const FoodItemCard({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.oldPrice,
    required this.discount,
  });

  @override
  State<FoodItemCard> createState() => _FoodItemCardState();
}

class _FoodItemCardState extends State<FoodItemCard> {
  int quantity = 0;

  void increaseQty() {
    setState(() {
      quantity++;
    });
  }

  void decreaseQty() {
    setState(() {
      if (quantity > 0) quantity--;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.title,
                      style: textTheme(context)
                          .bodySmall
                          ?.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(
                    widget.description,
                    style: textTheme(context).labelMedium,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Text("AED ${widget.price.toStringAsFixed(2)}",
                          style: textTheme(context)
                              .labelLarge
                              ?.copyWith(fontWeight: FontWeight.bold)),
                      const SizedBox(width: 8),
                      Text("AED ${widget.oldPrice.toStringAsFixed(0)}",
                          style: textTheme(context).labelMedium?.copyWith(
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey)),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: AppColors.carmineRed,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text("Save ${widget.discount}%",
                            style: textTheme(context).labelMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      )
                    ],
                  )
                ],
              ),
            ),
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    widget.imageUrl,
                    height: 80,
                    width: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                quantity == 0
                    ? GestureDetector(
                        onTap: increaseQty,
                        child: Container(
                          margin: EdgeInsets.only(top: 65, left: 8),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 6),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                              border: Border.all(
                                  color: Colors.black.withOpacity(0.2))),
                          child: Text(
                            "Add",
                            style: textTheme(context)
                                .labelLarge
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    : Container(
                        margin: EdgeInsets.only(top: 65, left: 5),
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.black.withOpacity(0.2)),
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: decreaseQty,
                                child: Icon(
                                  Icons.delete,
                                  size: 15,
                                ),
                              ),
                            ),
                            Text(quantity.toString(),
                                style: textTheme(context)
                                    .labelLarge
                                    ?.copyWith(fontWeight: FontWeight.bold)),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                  onTap: increaseQty,
                                  child: const Icon(Icons.add, size: 15)),
                            ),
                          ],
                        ),
                      )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
