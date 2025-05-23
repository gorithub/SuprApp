import 'package:flutter/material.dart';
import 'package:suprapp/app/features/groceries/models/item_model.dart';
import 'package:suprapp/app/features/groceries/widgets/category_item.dart';

class CategoriesTab extends StatefulWidget {
  const CategoriesTab({super.key});

  @override
  State<CategoriesTab> createState() => _CategoriesTabState();
}

class _CategoriesTabState extends State<CategoriesTab> {
  final List<CategoryItem> categories = [
    const CategoryItem(
        products: [
          ProductItem(
            name: 'Apple',
            imageUrl:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ868djAR5mIlAFnnjF---4paarCg48aQTr-g&s',
          ),
          ProductItem(
            name: 'Banana',
            imageUrl:
                'https://brightsidempls.org/cdn/shop/articles/Bananas.jpg?v=1646435008',
          ),
        ],
        title: 'Fruits',
        imageUrl: 'https://cdn-icons-png.flaticon.com/512/415/415733.png'),
    const CategoryItem(
        products: [
          ProductItem(
            name: 'Tomato',
            imageUrl:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSn_RpV_Nq_aND67ekZG9sOso6gv4AQatx2sw&s',
          ),
          ProductItem(
            name: 'Cucumber',
            imageUrl:
                'https://aarp.widen.net/content/pfnkunhcxa/jpeg/GettyImages-1247537880-web.jpg?crop=true&anchor=7,89&q=80&color=ffffffff&u=k2e9ec&w=2033&h=1168',
          ),
        ],
        title: 'Vegetables',
        imageUrl: 'https://cdn-icons-png.flaticon.com/512/3082/3082061.png'),
    const CategoryItem(
        products: [
          ProductItem(
            name: 'Milk',
            imageUrl:
                'https://nutritionsource.hsph.harvard.edu/wp-content/uploads/2024/11/AdobeStock_354060824-1024x683.jpeg',
          ),
          ProductItem(
            name: 'Cheese',
            imageUrl:
                'https://freshbasket.com.pk/cdn/shop/articles/mozerrila_cheese_1200x.jpg?v=1724161655',
          ),
        ],
        title: 'Dairy',
        imageUrl: 'https://cdn-icons-png.flaticon.com/512/1046/1046857.png'),
    const CategoryItem(
        products: [
          ProductItem(
            name: 'Bread',
            imageUrl:
                'https://www.allrecipes.com/thmb/CjzJwg2pACUzGODdxJL1BJDRx9Y=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/6788-amish-white-bread-DDMFS-4x3-6faa1e552bdb4f6eabdd7791e59b3c84.jpg',
          ),
          ProductItem(
            name: 'Croissant',
            imageUrl:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdA3CHk8pbUGla_Ls2INRotqW5782cFI5NCg&s',
          ),
        ],
        title: 'Bakery',
        imageUrl: 'https://cdn-icons-png.flaticon.com/512/135/135620.png'),
    const CategoryItem(
        products: [
          ProductItem(
            name: 'Chicken',
            imageUrl:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSaqk0g2bvO8exnqTfBltocAgnJXQ-xQMyPOw&s',
          ),
          ProductItem(
            name: 'Beef',
            imageUrl:
                'https://cdn.britannica.com/68/143268-050-917048EA/Beef-loin.jpg',
          ),
        ],
        title: 'Meat',
        imageUrl: 'https://cdn-icons-png.flaticon.com/512/3174/3174880.png'),
    const CategoryItem(
        products: [
          ProductItem(
            name: 'Fish',
            imageUrl:
                'https://vuniversity.in/wp-content/uploads/2023/10/Cuts-of-fish.png',
          ),
          ProductItem(
            name: 'Shrimp',
            imageUrl:
                'https://images.contentstack.io/v3/assets/bltcedd8dbd5891265b/bltce5a9e408e6073dc/664cbe3c0ba2f9ea1c043454/difference-between-shrimp-and-prawns-boiled-prawns.jpg',
          ),
        ],
        title: 'Seafood',
        imageUrl: 'https://cdn-icons-png.flaticon.com/512/831/831682.png'),
    const CategoryItem(
        products: [
          ProductItem(
            name: 'Chips',
            imageUrl:
                'https://www.allrecipes.com/thmb/WyCC-RL8cuAEKfYHsdnzqi64iTc=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/73135-homestyle-potato-chips-ddmfs-0348-3x4-hero-c21021303c8849bbb40c1007bfa9af6e.jpg',
          ),
          ProductItem(
            name: 'Cookies',
            imageUrl:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTO-rNNhDnBfqG0WNIeEmcDwrLMbGDjIGIVMg&s',
          ),
        ],
        title: 'Snacks',
        imageUrl: 'https://cdn-icons-png.flaticon.com/512/857/857681.png'),
    const CategoryItem(
        products: [
          ProductItem(
            name: 'Frozen Pizza',
            imageUrl:
                'https://cdn.thewirecutter.com/wp-content/media/2024/05/frozen-pizza-2048px-8979.jpg',
          ),
          ProductItem(
            name: 'Frozen Fries',
            imageUrl:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRcf_jFEFM8--oTpG__Xavjd7kO1IRv28e_Rg&s',
          ),
        ],
        title: 'Frozen Foods',
        imageUrl: 'https://cdn-icons-png.flaticon.com/512/650/650195.png'),
    const CategoryItem(
        products: [
          ProductItem(
            name: 'Juice',
            imageUrl:
                'https://cdn.healthyrecipes101.com/recipes/images/juices/orange-juice-apple-cider-vinegar-honey-recipe-clavzz7uu001z551b961w6b6a.webp',
          ),
          ProductItem(
            name: 'Energy Drink',
            imageUrl:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTVC0XW9pAXhyIQ_L4OD_GqcOFw-GQHFlp2pQ&s',
          ),
        ],
        title: 'Beverages',
        imageUrl: 'https://cdn-icons-png.flaticon.com/512/2738/2738730.png'),
    const CategoryItem(
        products: [
          ProductItem(
            name: 'Coke',
            imageUrl:
                'https://kentstreetcellars.com.au/cdn/shop/files/coke-can_7bf866c9-bffc-449d-a173-de324ac47905_1000x1000.png?v=1687840069',
          ),
          ProductItem(
            name: 'Pepsi',
            imageUrl:
                'https://contact.pepsico.com/files/pepsi/documents/1701962330/pepsi_lineup.jpg',
          ),
        ],
        title: 'Soft Drinks',
        imageUrl: 'https://cdn-icons-png.flaticon.com/512/3075/3075977.png'),
    const CategoryItem(
        products: [
          ProductItem(
            name: 'Mineral Water',
            imageUrl:
                'https://livpure.com/cdn/shop/articles/List-of-Factors-to-Take-Into-Account-When-Buying-a-Water-Purifier-1_981aaa83-c91d-4417-bfe4-e8af5032c2b2-563825.png?v=1726726245&width=1100',
          ),
          ProductItem(
            name: 'Sparkling Water',
            imageUrl:
                'https://blog.myfitnesspal.com/wp-content/uploads/2018/07/Is-Flavored-Sparkling-Water-Killing-Your-Weight-Loss-Goals_-1.jpg',
          ),
        ],
        title: 'Water',
        imageUrl: 'https://cdn-icons-png.flaticon.com/512/3314/3314492.png'),
    const CategoryItem(
        products: [
          ProductItem(
            name: 'Tea',
            imageUrl:
                'https://ikneadtoeat.com/wp-content/uploads/2019/01/Masala-Chai-Recipe-1.jpg',
          ),
          ProductItem(
            name: 'Coffee',
            imageUrl:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSUiVuTP47Bb1z0h4XDC2y3a9aNkfW5jyP9FQ&s',
          ),
        ],
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
