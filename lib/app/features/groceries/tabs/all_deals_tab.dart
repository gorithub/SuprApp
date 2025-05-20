import 'package:flutter/material.dart';
import 'package:suprapp/app/features/groceries/widgets/product_card.dart';

class AllDealsTab extends StatefulWidget {
  const AllDealsTab({super.key});

  @override
  State<AllDealsTab> createState() => _AllDealsTabState();
}

class _AllDealsTabState extends State<AllDealsTab> {
  final List<Map<String, String>> allDeals = [
    {
      'title': 'Pure Organic Honey Jar',
      'price': '\$10',
      'discount': '15% OFF',
      'old': '\$12',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQavcMVvrXn7KoldH8-1IiGNwLbh0mFtskAgA&s',
    },
    {
      'title': 'Unsweetened Almond Milk Pack',
      'price': '\$6',
      'discount': '10% OFF',
      'old': '\$7',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrXh06hIlgR0eXl4lKBHgaz9kmS--IkgmHoQ&s',
    },
    {
      'title': 'Thick Greek Yogurt Tub',
      'price': '\$4',
      'discount': '12% OFF',
      'old': '\$5',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRib_d0P13XP13Mypnc8tu893qOD9Rl-MdILg&s',
    },
    {
      'title': 'High-Fiber Oats Breakfast Pack',
      'price': '\$5',
      'discount': '18% OFF',
      'old': '\$6',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJtZEE5zxcfq-nAlS_5fJxJrlcjlnxLWOPMQ&s',
    },
    {
      'title': 'Premium Green Tea Bags',
      'price': '\$8',
      'discount': '20% OFF',
      'old': '\$10',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRunZcCzD4RN1X8jK2u5G9VjfFcGExuA5i4dQ&s',
    },
    {
      'title': 'Chocolate Flavored Protein Bar',
      'price': '\$3',
      'discount': '10% OFF',
      'old': '\$3.5',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRx2-LEkNXJNKwlafI9IkC-ZUMcs7OXfptRGw&s',
    },
    {
      'title': 'Freshly Picked Strawberries Box',
      'price': '\$5',
      'discount': '15% OFF',
      'old': '\$6',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4qZv4mf12HcEcm7xaZRiHVwJrQXpd4JgBiA&s',
    },
    {
      'title': 'Healthy Mixed Nuts Jar',
      'price': '\$12',
      'discount': '25% OFF',
      'old': '\$16',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfETfsxW8wJujgwP0wqlCM_t3RwZykE3y1vg&s',
    },
    {
      'title': 'Natural Coconut Water Bottle',
      'price': '\$2',
      'discount': '5% OFF',
      'old': '\$2.2',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSp8bRiOhsb-UKLtNVe8Kvya31CVmYId2MRCg&s',
    },
    {
      'title': 'Crunchy Granola Trail Mix',
      'price': '\$7',
      'discount': '17% OFF',
      'old': '\$8.5',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4qZv4mf12HcEcm7xaZRiHVwJrQXpd4JgBiA&s',
    },
    {
      'title': 'Dark Cocoa Chocolate Bar',
      'price': '\$4',
      'discount': '10% OFF',
      'old': '\$4.5',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfETfsxW8wJujgwP0wqlCM_t3RwZykE3y1vg&s',
    },
    {
      'title': 'Whole Chia Seeds Pouch',
      'price': '\$6',
      'discount': '15% OFF',
      'old': '\$7',
      'image': 'https://cdn-icons-png.flaticon.com/512/3064/3064161.png',
    },
    {
      'title': 'Natural Energy Drink Can',
      'price': '\$3',
      'discount': '10% OFF',
      'old': '\$3.3',
      'image': 'https://cdn-icons-png.flaticon.com/512/706/706164.png',
    },
    {
      'title': 'Gluten-Free Rice Cakes',
      'price': '\$2',
      'discount': '8% OFF',
      'old': '\$2.2',
      'image': 'https://cdn-icons-png.flaticon.com/512/3303/3303894.png',
    },
    {
      'title': 'Cold-Pressed Avocado Oil',
      'price': '\$9',
      'discount': '20% OFF',
      'old': '\$11',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTbU0uYwyRqHXYWAaTC8UJOaQtBD4oizlCE2Q&s',
    },
    {
      'title': 'Probiotic Kombucha Bottle',
      'price': '\$4',
      'discount': '10% OFF',
      'old': '\$4.5',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWvo5gawyT3ciPZz3TXAxpRYutChp7_VHqxg&s',
    },
    {
      'title': 'Red Lentil Pasta Pack',
      'price': '\$6',
      'discount': '12% OFF',
      'old': '\$7',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8d2IYYe7usBxeyzKCyVESImqcCENieL1pLw&s',
    },
    {
      'title': 'Smooth Peanut Butter Jar',
      'price': '\$5',
      'discount': '10% OFF',
      'old': '\$5.5',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjjpf6uemrYZC16p9XjA8xvqQfWRHMIXMKFA&s',
    },
    {
      'title': 'Protein-Rich Quinoa Pack',
      'price': '\$7',
      'discount': '15% OFF',
      'old': '\$8.5',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMIh-OsMjJMEfnxl3IIhIr2bIWUmkEXRikWw&s',
    },
    {
      'title': 'Mixed Fruit Juice Bottle',
      'price': '\$3',
      'discount': '5% OFF',
      'old': '\$3.2',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfETfsxW8wJujgwP0wqlCM_t3RwZykE3y1vg&s',
    },
  ];
  @override
  Widget build(BuildContext context) {
    const double spacing = 30;
    const int crossAxisCount = 2;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: GridView.builder(
                itemCount: allDeals.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: spacing,
                  mainAxisSpacing: 2,
                  childAspectRatio: 165 / 210,
                ),
                itemBuilder: (context, index) {
                  final item = allDeals[index];
                  return ProductCard(
                    title: item['title']!,
                    price: item['price']!,
                    discount: item['discount']!,
                    oldPrice: item['old'],
                    imageUrl: item['image']!,
                    showOldPrice: true,
                    onAddTap: () {},
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
