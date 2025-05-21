import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';
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
  final mangoes = [
    {
      'title': 'Alphonso Mango Premium Box',
      'price': 'AED 19.20',
      'old': 'AED 24',
      'discount': '-20%',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkEbYmomBlqAHgrep6gH24ZgGnkRsK0mk9Dw&s',
    },
    {
      'title': 'Kesar Mango (Export Quality)',
      'price': 'AED 19.20',
      'old': 'AED 24',
      'discount': '-20%',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHUYOGjvIALIoCCp9EYvy-2MtIEhaWdWfh0g&s',
    },
    {
      'title': 'Dasheri Mango – 1 Kg Pack',
      'price': 'AED 25.90',
      'old': 'AED 30.45',
      'discount': '-15%',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAn321feU9VoEaA1gOob_qn8hEUw70WgNM0w&s',
    },
  ];
  final mostLoved = [
    {
      'title': 'Alphonso Mango Premium Box',
      'price': 'AED 19.20',
      'old': 'AED 24',
      'discount': '-20%',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSgYoY-mxL8X2G2cF1okBsFDc_EqIjhTsznw&s',
    },
    {
      'title': 'Kesar Mango (Export Quality)',
      'price': 'AED 19.20',
      'old': 'AED 24',
      'discount': '-20%',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRC8zud_GiEq2I5xU0w-6tcVPEtZB_jjCJx3w&s',
    },
    {
      'title': 'Dasheri Mango – 1 Kg Pack',
      'price': 'AED 25.90',
      'old': 'AED 30.45',
      'discount': '-15%',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRW86xKHst7eO2XAXznefUq7jcS7-q3I5Sc9w&s',
    },
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
              products: herbal,
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
