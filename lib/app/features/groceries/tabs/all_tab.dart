import 'package:flutter/material.dart';
import 'package:suprapp/app/features/groceries/widgets/category_grid.dart';
import 'package:suprapp/app/features/groceries/widgets/product_card.dart';

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
      // const CategoryItem(title: 'Seasonal', imageUrl: 'https://cdn-icons-png.flaticon.com/512/1513/1513600.png'),
    ];

    final items = [
      {
        'title': 'Sanita Club Biodegradable',
        'price': 'AED 25.99',
        'discount': '-9%'
      },
      {
        'title': 'Sanita Paper Cups 266.16 m...',
        'price': 'AED 13.85',
        'discount': '-8%'
      },
      {
        'title': 'Sanita Club Garbage Bags',
        'price': 'AED 19.95',
        'discount': '-15%'
      },
    ];

    final herbal = [
      {
        'title': 'Himalaya Soap Neem & Turm...',
        'price': 'AED 19.20',
        'old': 'AED 24',
        'discount': '-20%'
      },
      {
        'title': 'Himalaya Soap Moisturizing A...',
        'price': 'AED 19.20',
        'old': 'AED 24',
        'discount': '-20%'
      },
      {
        'title': 'Himalaya Pure Tulsi & Aloe V...',
        'price': 'AED 25.90',
        'old': 'AED 30.45',
        'discount': '-15%'
      },
    ];

    final beverages = [
      {
        'title': 'Pepsi Can 330ml',
        'price': 'AED 3.50',
        'old': 'AED 4.00',
        'discount': '-12%'
      },
      {
        'title': '7Up Bottle 1.5L',
        'price': 'AED 6.25',
        'old': 'AED 7.00',
        'discount': '-11%'
      },
      {
        'title': 'Red Bull 250ml',
        'price': 'AED 8.00',
        'old': 'AED 9.50',
        'discount': '-16%'
      },
    ];

    final bundleOffers = [
      {
        'title': 'Combo Pasta Pack',
        'price': 'AED 18.00',
        'old': 'AED 22.00',
        'discount': '-18%'
      },
      {
        'title': 'Buy 1 Get 1 Biscuits',
        'price': 'AED 10.00',
        'old': 'AED 14.00',
        'discount': '-29%'
      },
      {
        'title': 'Rice & Lentil Combo',
        'price': 'AED 30.00',
        'old': 'AED 35.00',
        'discount': '-14%'
      },
    ];

    final reducedToClear = [
      {
        'title': 'Choco Cookies (Expiring Soon)',
        'price': 'AED 5.00',
        'old': 'AED 10.00',
        'discount': '-50%'
      },
      {
        'title': 'Cheddar Cheese 250g',
        'price': 'AED 12.00',
        'old': 'AED 18.00',
        'discount': '-33%'
      },
      {
        'title': 'Yogurt (Last Few Days)',
        'price': 'AED 3.00',
        'old': 'AED 6.00',
        'discount': '-50%'
      },
    ];

    final milkAndYogurt = [
      {
        'title': 'Al Ain Milk 1L',
        'price': 'AED 4.25',
        'old': 'AED 5.00',
        'discount': '-15%'
      },
      {
        'title': 'Greek Yogurt Plain 500g',
        'price': 'AED 9.99',
        'old': 'AED 12.00',
        'discount': '-17%'
      },
      {
        'title': 'Strawberry Yogurt Cup',
        'price': 'AED 2.50',
        'old': 'AED 3.00',
        'discount': '-16%'
      },
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        
          _buildProductRow(items),
          _buildSection('Herbal Goodness', herbal),
          _buildSection('Beverages', beverages),
            const SizedBox(height: 12),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Shop by Category',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Icon(Icons.arrow_forward),
            ],
          ),
          const SizedBox(height: 12),
          ShopByCategoryGrid(categories: categories),
          const SizedBox(height: 20),
          _buildSection('Bundle Offers', bundleOffers),
          _buildSection('Reduced to Clear', reducedToClear),
          _buildSection('Milk & Yogurt', milkAndYogurt),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildSection(String title, List<Map<String, String>> products) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Icon(Icons.arrow_forward),
          ],
        ),
        const SizedBox(height: 12),
        _buildProductRow(products, isHerbal: true),
      ],
    );
  }

  Widget _buildProductRow(List<Map<String, String>> products,
      {bool isHerbal = false}) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) {
          final item = products[index];
          return ProductCard(
            title: item['title']!,
            price: item['price']!,
            discount: item['discount']!,
            oldPrice: item['old'],
            showOldPrice: isHerbal,
            onAddTap: () {},
          );
        },
      ),
    );
  }
}
