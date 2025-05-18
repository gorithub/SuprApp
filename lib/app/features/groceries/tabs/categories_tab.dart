import 'package:flutter/material.dart';
import 'package:suprapp/app/features/groceries/widgets/category_item.dart';

class CategoriesTab extends StatefulWidget {
  const CategoriesTab({super.key});

  @override
  State<CategoriesTab> createState() => _CategoriesTabState();
}

class _CategoriesTabState extends State<CategoriesTab> {
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
    const CategoryItem(
        title: 'Beverages',
        imageUrl: 'https://cdn-icons-png.flaticon.com/512/2738/2738730.png'),
    const CategoryItem(
        title: 'Soft Drinks',
        imageUrl: 'https://cdn-icons-png.flaticon.com/512/3075/3075977.png'),
    const CategoryItem(
        title: 'Water',
        imageUrl: 'https://cdn-icons-png.flaticon.com/512/3314/3314492.png'),
    const CategoryItem(
        title: 'Tea & Coffee',
        imageUrl: 'https://cdn-icons-png.flaticon.com/512/1977/1977453.png'),
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
            const Text("Fresh Food",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 20,
            ),
            CategoryGrid(categories: categories),
            const SizedBox(
              height: 40,
            ),
            const Text("Snacks & Beverages",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 20,
            ),
            CategoryGrid(categories: categories),
            const SizedBox(
              height: 40,
            ),
            const Text("Groceries",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 20,
            ),
            CategoryGrid(categories: categories),
            const SizedBox(
              height: 40,
            ),
            const Text("Cleaning & Household",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 20,
            ),
            CategoryGrid(categories: categories),
            const SizedBox(
              height: 40,
            ),
            const Text("Health & Wellness",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 20,
            ),
            CategoryGrid(categories: categories),
          ],
        ),
      ),
    );
  }
}
