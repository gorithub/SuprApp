import 'package:flutter/material.dart';
import 'package:suprapp/app/core/constants/global_variables.dart';

class ItemGridTile extends StatelessWidget {
  final String imagePath;
  final String title;
  final double? height;
  final double? width;
  final double? verticalMargin;
  final double? horizontalMargin;
  final VoidCallback? onTap;

  const ItemGridTile({
    super.key,
    required this.imagePath,
    required this.title,
    this.height,
    this.width,
    this.verticalMargin,
    this.horizontalMargin,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final double imageHeight = height ?? 65;
    final double imageWidth = width ?? 70;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: verticalMargin ?? 0,
          horizontal: horizontalMargin ?? 0,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFFF8F2E5),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: imageHeight,
              width: imageWidth,
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(imagePath, fit: BoxFit.cover),
            ),
            SizedBox(height: imageHeight > 65 ? 0.3 : 3),
            Flexible(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: textTheme(context).bodySmall?.copyWith(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff000000),
                    ),
              ),
            ),
            if (imageHeight > 65) SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
