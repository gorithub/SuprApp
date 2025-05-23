import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';
import 'package:suprapp/app/features/groceries/models/item_model.dart';
import 'package:suprapp/app/features/groceries/models/product_model.dart';
import 'package:suprapp/app/features/groceries/widgets/category_item.dart';
import 'package:suprapp/app/features/groceries/widgets/large_image_listview.dart';
import 'package:suprapp/app/features/groceries/widgets/product_section.dart';

class FreshTab extends StatefulWidget {
  const FreshTab({super.key});

  @override
  State<FreshTab> createState() => _FreshTabState();
}

class _FreshTabState extends State<FreshTab> {
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
            const SizedBox(
              height: 20,
            ),
            ProductSection(
              title: 'just in: The freshest picks',
              products: myherbalList,
              isHerbal: true,
              onSectionTap: () {},
            ),
            const SizedBox(
              height: 20,
            ),
            ProductSection(
              title: 'Mango mania',
              products: mangoes,
              isHerbal: true,
              onSectionTap: () {},
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 250,
              child: LargeImageList(
                imageUrls: [
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4wLwuKvj91NAUFxMMxJQKZd1xXAW3IiVKIA&s"
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDh6RmUj-ZuZw_77mK_iQzGxg1R46_hVjSxg&s',
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTx4-Qqf3BAjIrjlA1EMzZI1WdChhJpOOLzJw&s',
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQV9ISghVXxkHXN2N6skyJF8sCuQSP4bd3aiw&s',
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRL24eDnrVQ_XWzldg-prfJnmWMzDv790aMzg&s',
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ProductSection(
              title: 'Most Loved',
              products: mostLoved,
              isHerbal: true,
              onSectionTap: () {},
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
