import 'package:flutter/material.dart';
import 'package:suprapp/app/features/groceries/widgets/product_section.dart';

class TopPicksTab extends StatefulWidget {
  const TopPicksTab({super.key});

  @override
  State<TopPicksTab> createState() => _TopPicksTabState();
}

class _TopPicksTabState extends State<TopPicksTab> {
  @override
  Widget build(BuildContext context) {
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
    return Scaffold(
      body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductSection(
                title: 'Our Top Picks',
                products: items,
                isHerbal: false,
              ),
              const SizedBox(
                height: 20,
              ),
              ProductSection(
                title: 'Fresh Produce',
                products: herbal,
                isHerbal: true,
                onSectionTap: () {},
              ),
              const SizedBox(
                height: 20,
              ),
              ProductSection(
                title: 'Milk & Yogurt Essentials',
                products: milkAndYogurt,
                isHerbal: false,
                onSectionTap: () {},
              ),
              const SizedBox(
                height: 20,
              ),
              ProductSection(
                title: 'Drinks & Sips',
                products: beverages,
                isHerbal: false,
                onSectionTap: () {},
              ),
              const SizedBox(
                height: 20,
              ),
              ProductSection(
                title: 'Sugar Rush',
                products: reducedToClear,
                isHerbal: false,
                onSectionTap: () {},
              ),
                const SizedBox(
                height: 20,
              ),
              ProductSection(
                title: 'Bakery Picks',
                products: herbal,
                isHerbal: true,
                onSectionTap: () {},
              ),
                const SizedBox(
                height: 20,
              ),
              ProductSection(
                title: 'Cheese Spreads',
                products: bundleOffers,
                isHerbal: true,
                onSectionTap: () {},
              ),
               const SizedBox(
                height: 20,
              ),
              ProductSection(
                title: 'Fresh Eggs',
                products: milkAndYogurt,
                isHerbal: false,
                onSectionTap: () {},
              ),
            ],
          )),
    );
  }
}
