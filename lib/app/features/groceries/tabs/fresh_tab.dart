import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';
import 'package:suprapp/app/features/groceries/widgets/category_item.dart';

class FreshTab extends StatefulWidget {
  const FreshTab({super.key});

  @override
  State<FreshTab> createState() => _FreshTabState();
}

class _FreshTabState extends State<FreshTab> {
  final List<CategoryItem> categories = [
    const CategoryItem(
        title: 'Fruits',
        imageUrl: 'https://cdn-icons-png.flaticon.com/512/415/415733.png'),
    const CategoryItem(
        title: 'Vegetables',
        imageUrl: 'https://cdn-icons-png.flaticon.com/512/3082/3082061.png'),
    const CategoryItem(
        title: 'Dairy',
        imageUrl: 'https://cdn-icons-png.flaticon.com/512/1046/1046857.png'),
    const CategoryItem(
        title: 'Bakery',
        imageUrl: 'https://cdn-icons-png.flaticon.com/512/135/135620.png'),
    const CategoryItem(
        title: 'Meat',
        imageUrl: 'https://cdn-icons-png.flaticon.com/512/3174/3174880.png'),
    const CategoryItem(
        title: 'Seafood',
        imageUrl: 'https://cdn-icons-png.flaticon.com/512/831/831682.png'),
    const CategoryItem(
        title: 'Snacks',
        imageUrl: 'https://cdn-icons-png.flaticon.com/512/857/857681.png'),
    const CategoryItem(
        title: 'Frozen Foods',
        imageUrl: 'https://cdn-icons-png.flaticon.com/512/650/650195.png'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                imageUrl:
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS58UjdeXSf8qTPnnLReA5uwCJX-yUPJlYT-A&s',
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    color: Colors.white,
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text("Explore Top Categories",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 20,
            ),
            CategoryGrid(
                tileColor: Colors.grey.shade100, categories: categories),
          ],
        ),
      ),
    );
  }
}
