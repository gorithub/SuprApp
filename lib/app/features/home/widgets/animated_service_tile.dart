import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suprapp/app/core/constants/global_variables.dart';
import 'package:suprapp/app/features/home/provider/image_carousel_provider.dart';

class AnimatedGridTile extends StatelessWidget {
  final List<String> imageList;
  final String title;
  final double tileWidth;
  final VoidCallback onTap;

  const AnimatedGridTile({
    super.key,
    required this.imageList,
    required this.title,
    required this.tileWidth,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final double fontSize = tileWidth * 0.11;
    return ChangeNotifierProvider(
      create: (_) => ImageCarouselProvider(imageList.length),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF8F2E5),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              SizedBox(
                height: 62,
                width: 62,
                child: Consumer<ImageCarouselProvider>(
                  builder: (context, provider, _) {
                    return PageView.builder(
                      controller: provider.controller,
                      itemCount: imageList.length,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          imageList[index],
                          fit: BoxFit.fitHeight,
                        );
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 6),
              Text(
                title,
                textAlign: TextAlign.center,
                style: textTheme(context).bodySmall?.copyWith(
                      fontSize: fontSize,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff000000),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
