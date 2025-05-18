import 'package:flutter/material.dart';
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

    final items = [
      {
        'title': 'Sanita Club Biodegradable',
        'price': 'AED 25.99',
        'discount': '-9%',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQavcMVvrXn7KoldH8-1IiGNwLbh0mFtskAgA&s',
      },
      {
        'title': 'Sanita Paper Cups 266.16 m...',
        'price': 'AED 13.85',
        'discount': '-8%',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrXh06hIlgR0eXl4lKBHgaz9kmS--IkgmHoQ&s',
      },
      {
        'title': 'Sanita Club Garbage Bags',
        'price': 'AED 19.95',
        'discount': '-15%',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRib_d0P13XP13Mypnc8tu893qOD9Rl-MdILg&s',
      },
    ];

    final herbal = [
      {
        'title': 'Himalaya Soap Neem & Turm...',
        'price': 'AED 19.20',
        'old': 'AED 24',
        'discount': '-20%',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJtZEE5zxcfq-nAlS_5fJxJrlcjlnxLWOPMQ&s',
      },
      {
        'title': 'Himalaya Soap Moisturizing A...',
        'price': 'AED 19.20',
        'old': 'AED 24',
        'discount': '-20%',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRunZcCzD4RN1X8jK2u5G9VjfFcGExuA5i4dQ&s',
      },
      {
        'title': 'Himalaya Pure Tulsi & Aloe V...',
        'price': 'AED 25.90',
        'old': 'AED 30.45',
        'discount': '-15%',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRx2-LEkNXJNKwlafI9IkC-ZUMcs7OXfptRGw&s',
      },
    ];

    final beverages = [
      {
        'title': 'Pepsi Can 330ml',
        'price': 'AED 3.50',
        'old': 'AED 4.00',
        'discount': '-12%',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWm8nJlEPObT1-XdlBT7CagggnQ4t7pjGFEQ&s',
      },
      {
        'title': '7Up Bottle 1.5L',
        'price': 'AED 6.25',
        'old': 'AED 7.00',
        'discount': '-11%',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQfnM_O9lNMewzSSjYhS_fDM1ma3vFY4_fo4Q&s',
      },
      {
        'title': 'Red Bull 250ml',
        'price': 'AED 8.00',
        'old': 'AED 9.50',
        'discount': '-16%',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQvqMwbho-a0epWPgUGA-C4Htn7DYJwIEW3oA&s',
      },
    ];

    final bundleOffers = [
      {
        'title': 'Combo Pasta Pack',
        'price': 'AED 18.00',
        'old': 'AED 22.00',
        'discount': '-18%',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSt4bajQIs2fcjMbvO_qcCiKC2BbDM43CgmSw&s',
      },
      {
        'title': 'Buy 1 Get 1 Biscuits',
        'price': 'AED 10.00',
        'old': 'AED 14.00',
        'discount': '-29%',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRinpOFSYKilh42mODD8KwHwILgNCCI9Leq4w&s',
      },
      {
        'title': 'Rice & Lentil Combo',
        'price': 'AED 30.00',
        'old': 'AED 35.00',
        'discount': '-14%',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0V_h6HGYxgYPyZa4Rg3QOZRAsIypy2IMi8g&s',
      },
    ];

    final reducedToClear = [
      {
        'title': 'Choco Cookies (Expiring Soon)',
        'price': 'AED 5.00',
        'old': 'AED 10.00',
        'discount': '-50%',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSp8bRiOhsb-UKLtNVe8Kvya31CVmYId2MRCg&s',
      },
      {
        'title': 'Cheddar Cheese 250g',
        'price': 'AED 12.00',
        'old': 'AED 18.00',
        'discount': '-33%',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4qZv4mf12HcEcm7xaZRiHVwJrQXpd4JgBiA&s',
      },
      {
        'title': 'Yogurt (Last Few Days)',
        'price': 'AED 3.00',
        'old': 'AED 6.00',
        'discount': '-50%',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfETfsxW8wJujgwP0wqlCM_t3RwZykE3y1vg&s',
      },
    ];
    final milkAndYogurt = [
      {
        'title': 'Al Ain Milk 1L',
        'price': 'AED 4.25',
        'old': 'AED 5.00',
        'discount': '-15%',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSp8bRiOhsb-UKLtNVe8Kvya31CVmYId2MRCg&s',
      },
      {
        'title': 'Greek Yogurt Plain 500g',
        'price': 'AED 9.99',
        'old': 'AED 12.00',
        'discount': '-17%',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4qZv4mf12HcEcm7xaZRiHVwJrQXpd4JgBiA&s',
      },
      {
        'title': 'Strawberry Yogurt Cup',
        'price': 'AED 2.50',
        'old': 'AED 3.00',
        'discount': '-16%',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfETfsxW8wJujgwP0wqlCM_t3RwZykE3y1vg&s',
      },
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductSection(
            title: 'Recommended',
            products: items,
            isHerbal: false,
          ),
          const SizedBox(
            height: 20,
          ),
          ProductSection(
            title: 'Herbal Goodness',
            products: herbal,
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
