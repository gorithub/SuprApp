import 'package:flutter/material.dart';
import 'package:suprapp/app/features/groceries/widgets/product_section.dart';

class KidsTab extends StatefulWidget {
  const KidsTab({super.key});

  @override
  State<KidsTab> createState() => _KidsTabState();
}

class _KidsTabState extends State<KidsTab> {
  @override
  Widget build(BuildContext context) {
final daipers = [
  {
    'id': "101",
    'title': 'Pampers Premium Care Size 3 (58 pcs)',
    'price': 'AED 25.99',
    'discount': '-9%',
    'image':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTycPxb70Yu6ww3l0b85CtvcOYCxa468tgY_g&s',
  },
  {
    'id': "102",
    'title': 'Huggies Dry Comfort Size 4 (44 pcs)',
    'price': 'AED 13.85',
    'discount': '-8%',
    'image':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5qDWN30Nn5tIu6vxz-a1zeySXaQrp9ab7Ew&s',
  },
  {
    'id': "103",
    'title': 'Molfix Jumbo Pack Size 5 (50 pcs)',
    'price': 'AED 19.95',
    'discount': '-15%',
    'image':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6O0MDiNWLYuBQlf4TWnDhLrvu7gpfhLKm5g&s',
  },
];

final babyBath = [
  {
    'id': "201",
    'title': 'Johnson’s Baby Bath 500ml',
    'price': 'AED 19.20',
    'old': 'AED 24',
    'discount': '-20%',
    'image':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPeH9Zji50jD_pss2wmvPgQYETYgnv7iFtpA&s',
  },
  {
    'id': "202",
    'title': 'Sebamed Baby Wash Extra Soft 200ml',
    'price': 'AED 19.20',
    'old': 'AED 24',
    'discount': '-20%',
    'image':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJcKWMKjFztXPxTAOfW9JXo7dS5O9TaIlTaQ&s',
  },
  {
    'id': "203",
    'title': 'Himalaya Gentle Baby Bath 400ml',
    'price': 'AED 25.90',
    'old': 'AED 30.45',
    'discount': '-15%',
    'image':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7iTNQcnXeaiHKnMU9OdfZ2AjA8iW9mefS_A&s',
  },
];

final babyCare = [
  {
    'id': "301",
    'title': 'Johnson’s Baby Lotion 500ml',
    'price': 'AED 14.50',
    'old': 'AED 18.00',
    'discount': '-19%',
    'image':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQEV5qK-KIb0HWUenN0enHWQsiKM5hlChpLWw&s',
  },
  {
    'id': "302",
    'title': 'Pampers Baby Wipes Sensitive 56 pcs',
    'price': 'AED 9.25',
    'old': 'AED 11.00',
    'discount': '-16%',
    'image':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcREGJ9IUL22AbOzfGHKxA4nkJNXJHxgmZ56Ow&s',
  },
  {
    'id': "303",
    'title': 'Sebamed Baby Cream Extra Soft 200ml',
    'price': 'AED 18.00',
    'old': 'AED 22.00',
    'discount': '-18%',
    'image':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRtJRj61F7Ahgw6Wup0yHgYjEvqlLbDkcLl2g&s',
  },
];

final babyFood = [
  {
    'id': "401",
    'title': 'Gerber Rice Cereal 227g',
    'price': 'AED 15.00',
    'old': 'AED 18.00',
    'discount': '-17%',
    'image':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-5W_woOKQPX7F3AkdIIhVt3n2GXkdYnMZ6Q&s',
  },
  {
    'id': "402",
    'title': 'Nestle Cerelac Wheat & Milk 250g',
    'price': 'AED 12.50',
    'old': 'AED 15.00',
    'discount': '-17%',
    'image':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_K3yFncHzFcIXr3O8RtID1KBcnZMiWgeg-A&s',
  },
  {
    'id':" 403",
    'title': 'Heinz Baby Food Jar Carrot 125g',
    'price': 'AED 8.00',
    'old': 'AED 9.50',
    'discount': '-16%',
    'image':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKH5M6LW8zt0yH4WXJ2VwCakaKzLqmrlfjNg&s',
  },
];



    return Scaffold(
      body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductSection(
                title: 'Daipers',
                products: daipers,
                isHerbal: false,
              ),
              const SizedBox(
                height: 20,
              ),
              ProductSection(
                title: 'Baby bath & Shower',
                products: babyBath,
                isHerbal: true,
                onSectionTap: () {},
              ),
              const SizedBox(
                height: 20,
              ),
              ProductSection(
                title: 'Baby Care',
                products: babyCare,
                isHerbal: false,
                onSectionTap: () {},
              ),
              const SizedBox(
                height: 20,
              ),
              ProductSection(
                title: 'Baby Food',
                products: babyFood,
                isHerbal: false,
                onSectionTap: () {},
              ),
              const SizedBox(
                height: 20,
              ),
              ProductSection(
                title: 'Bleach & Starch',
                products: babyBath,
                isHerbal: true,
                onSectionTap: () {},
              ),
             
              const SizedBox(
                height: 20,
              ),
            ],
          )),
    );
  }
}
