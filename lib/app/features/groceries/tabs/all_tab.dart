import 'package:flutter/material.dart';
import 'package:suprapp/app/features/groceries/models/product_model.dart';
import 'package:suprapp/app/features/groceries/widgets/category_grid.dart';
import 'package:suprapp/app/features/groceries/widgets/large_image_listview.dart';
import 'package:suprapp/app/features/groceries/widgets/product_section.dart';

class AllTab extends StatelessWidget {
  const AllTab({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
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
      const CategoryItem(
          title: 'Breakfast & Cereals',
          imageUrl: 'https://cdn-icons-png.flaticon.com/512/1631/1631441.png'),
      const CategoryItem(
          title: 'Cooking Oils',
          imageUrl: 'https://cdn-icons-png.flaticon.com/512/2474/2474440.png'),
      const CategoryItem(
          title: 'Spices & Condiments',
          imageUrl: 'https://cdn-icons-png.flaticon.com/512/3075/3075973.png'),
      const CategoryItem(
          title: 'Pasta & Noodles',
          imageUrl: 'https://cdn-icons-png.flaticon.com/512/971/971091.png'),
      const CategoryItem(
          title: 'Rice & Grains',
          imageUrl: 'https://cdn-icons-png.flaticon.com/512/2829/2829720.png'),
      const CategoryItem(
          title: 'Canned Foods',
          imageUrl: 'https://cdn-icons-png.flaticon.com/512/650/650202.png'),
      const CategoryItem(
          title: 'Chocolates',
          imageUrl: 'https://cdn-icons-png.flaticon.com/512/2036/2036542.png'),
      const CategoryItem(
          title: 'Ice Cream',
          imageUrl: 'https://cdn-icons-png.flaticon.com/512/3132/3132693.png'),
      const CategoryItem(
          title: 'Baby Food',
          imageUrl: 'https://cdn-icons-png.flaticon.com/512/4474/4474269.png'),
      const CategoryItem(
          title: 'Pet Supplies',
          imageUrl: 'https://cdn-icons-png.flaticon.com/512/616/616408.png'),
      const CategoryItem(
          title: 'Cleaning Supplies',
          imageUrl: 'https://cdn-icons-png.flaticon.com/512/1686/1686341.png'),
      const CategoryItem(
          title: 'Laundry',
          imageUrl: 'https://cdn-icons-png.flaticon.com/512/3075/3075974.png'),
      const CategoryItem(
          title: 'Dishwashing',
          imageUrl: 'https://cdn-icons-png.flaticon.com/512/2738/2738738.png'),
      const CategoryItem(
          title: 'Paper Products',
          imageUrl: 'https://cdn-icons-png.flaticon.com/512/1046/1046764.png'),
      const CategoryItem(
          title: 'Personal Care',
          imageUrl: 'https://cdn-icons-png.flaticon.com/512/3075/3075976.png'),
      const CategoryItem(
          title: 'Hair Care',
          imageUrl: 'https://cdn-icons-png.flaticon.com/512/3075/3075979.png'),
      const CategoryItem(
          title: 'Skin Care',
          imageUrl: 'https://cdn-icons-png.flaticon.com/512/616/616493.png'),
      const CategoryItem(
          title: 'Oral Care',
          imageUrl: 'https://cdn-icons-png.flaticon.com/512/1046/1046854.png'),
      const CategoryItem(
          title: 'Health & Wellness',
          imageUrl: 'https://cdn-icons-png.flaticon.com/512/1046/1046853.png'),
      const CategoryItem(
          title: 'Medicines',
          imageUrl: 'https://cdn-icons-png.flaticon.com/512/1046/1046773.png'),
      const CategoryItem(
          title: 'Sanitary Products',
          imageUrl: 'https://cdn-icons-png.flaticon.com/512/3064/3064161.png'),
      const CategoryItem(
          title: 'Tissues & Wipes',
          imageUrl: 'https://cdn-icons-png.flaticon.com/512/3064/3064176.png'),
      const CategoryItem(
          title: 'Home Essentials',
          imageUrl: 'https://cdn-icons-png.flaticon.com/512/706/706164.png'),
      const CategoryItem(
          title: 'Stationery',
          imageUrl: 'https://cdn-icons-png.flaticon.com/512/2719/2719825.png'),
      const CategoryItem(
          title: 'Batteries & Bulbs',
          imageUrl: 'https://cdn-icons-png.flaticon.com/512/896/896497.png'),
      const CategoryItem(
          title: 'Kitchen Supplies',
          imageUrl: 'https://cdn-icons-png.flaticon.com/512/3303/3303894.png'),
      const CategoryItem(
          title: 'Party Supplies',
          imageUrl: 'https://cdn-icons-png.flaticon.com/512/3208/3208752.png'),
      const CategoryItem(
          title: 'Gifting',
          imageUrl: 'https://cdn-icons-png.flaticon.com/512/3145/3145765.png'),
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductSection(
            title: 'Recommended',
            products: myRecomendations,
            isHerbal: false,
          ),
          const SizedBox(
            height: 20,
          ),
          ProductSection(
            title: 'Herbal Goodness',
            products: myherbalList,
            isHerbal: true,
            onSectionTap: () {},
          ),
          const SizedBox(
            height: 20,
          ),
          ProductSection(
            title: 'Milk & Yogurt',
            products: milkAndYogurt,
            isHerbal: false,
            onSectionTap: () {},
          ),
          const SizedBox(height: 20),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Shop by Category',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Icon(Icons.arrow_forward),
            ],
          ),
          const SizedBox(height: 20),
          ShopByCategoryGrid(categories: categories),
          const SizedBox(height: 20),
          ProductSection(
            title: 'Bundle Offers',
            products: bundleOffers,
            isHerbal: false,
            onSectionTap: () {},
          ),
          const SizedBox(
            height: 20,
          ),
          ProductSection(
            title: 'Reduced to Clear',
            products: reducedToClear,
            isHerbal: false,
            onSectionTap: () {},
          ),
          const SizedBox(
            height: 20,
          ),
          ProductSection(
            title: 'Beverages',
            products: beverages,
            isHerbal: false,
            onSectionTap: () {},
          ),
          const SizedBox(
            height: 250,
            child: LargeImageList(
              imageUrls: [
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMIh-OsMjJMEfnxl3IIhIr2bIWUmkEXRikWw&s"
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjjpf6uemrYZC16p9XjA8xvqQfWRHMIXMKFA&s',
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8d2IYYe7usBxeyzKCyVESImqcCENieL1pLw&s',
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWvo5gawyT3ciPZz3TXAxpRYutChp7_VHqxg&s',
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTbU0uYwyRqHXYWAaTC8UJOaQtBD4oizlCE2Q&s',
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
