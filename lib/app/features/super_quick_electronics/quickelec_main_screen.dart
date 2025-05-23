import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:suprapp/app/core/constants/app_colors.dart';
import 'package:suprapp/app/core/constants/global_variables.dart';
import 'package:suprapp/app/features/home/widgets/top_sheet.dart';
import 'package:suprapp/app/routes/go_router.dart';

import 'electronic_tabs_screen.dart';

class QuickElectronicsScreen extends StatelessWidget {
  const QuickElectronicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 400;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Top app bar
            _buildTopBar(context),

            // Address and delivery time bar
            _buildAddressBar(),

            // Search bar
            _buildSearchBar(),

            // Main scrollable content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // New Carousel Slider Banner
                    _buildCarouselBanner(),

                    // Promotion cards (now horizontal scroll)
                    _buildPromotionCardsScroll(),

                    const SizedBox(height: 20),

                    // Mobile section
                    _buildSectionTitle(context, 'Mobiles'),
                    _buildMobileScrollSection(),

                    const SizedBox(height: 20),

                    // Shop by category
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Shop by category',
                        style: TextStyle(
                          fontSize: isSmallScreen ? 18 : 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    _buildCategorySection(),

                    const SizedBox(height: 20),

                    // Best sellers
                    _buildSectionWithArrow(context, 'Best Sellers'),
                    _buildBestSellersGrid(),

                    const SizedBox(height: 20),

                    // Top accessories
                    _buildSectionTitle(context, 'Top Accessories'),
                    _buildAccessoriesGrid(),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, AppRoute.homePage);
            },
            child: Container(
              height: 36,
              width: 36,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.close, size: 20),
            ),
          ),
          Row(
            children: [
              Text(
                'Quick',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff018D14),
                ),
              ),
              SizedBox(width: 5),
              Text(
                'Electronics',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber.shade600,
                ),
              ),
            ],
          ),
          CircleAvatar(
            radius: 20,
            backgroundColor: AppColors.darkGreen,
            child: IconButton(
              onPressed: () {
                showGeneralDialog(
                  context: context,
                  barrierDismissible: true,
                  barrierLabel: 'TopSheet',
                  transitionDuration: const Duration(milliseconds: 300),
                  pageBuilder: (_, __, ___) => const SizedBox.shrink(),
                  transitionBuilder: (_, animation, __, ___) {
                    return SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0, -1),
                        end: Offset.zero,
                      ).animate(animation),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: const TopSheetWidget(),
                      ),
                    );
                  },
                );
              },
              icon: Icon(
                Icons.menu,
                size: 20,
                color: colorScheme(context).surface,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildAddressBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Villa 16',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                'Gautam Buddh Nagar Noida',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              Text(
                'Delivering in',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              Text(
                '43 mins',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        height: 46,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          children: [
            const Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search for electronics',
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => print('Search pressed'),
              child: Container(
                height: 46,
                width: 46,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                ),
                child: const Icon(Icons.search),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCarouselBanner() {
    final List<Map<String, dynamic>> carouselItems = [
      {
        'backgroundColor': Color(0xff018D14),
        'title': 'Get an extra',
        'subtitle': '5% off',
        'imagePath': 'assets/images/halfiphone.png',
      },
      {
        'backgroundColor': Colors.blue,
        'title': 'New Arrivals',
        'subtitle': '10% off',
        'imagePath': 'assets/images/halfiphone.png',
      },
      {
        'backgroundColor': Colors.orange,
        'title': 'Weekend Sale',
        'subtitle': '15% off',
        'imagePath': 'assets/images/halfiphone.png',
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: CarouselSlider(
        options: CarouselOptions(
          height: 110,
          aspectRatio: 16 / 9,
          viewportFraction: 1.0,
          autoPlay: true,
          enlargeCenterPage: false,
        ),
        items: carouselItems.map((item) {
          return Builder(
            builder: (BuildContext context) {
              return GestureDetector(
                onTap: () => print('Banner tapped'),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  decoration: BoxDecoration(
                    color: item['backgroundColor'],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Text(
                              item['title'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              item['subtitle'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, right: 20),
                        child: Image.asset(item['imagePath']),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }

  Widget _buildPromotionCardsScroll() {
    return SizedBox(
      height: 260,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        children: [
          _buildPromotionCard(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFF1C623), // Yellow (#F1C623)
                Color(0xFFF99A29), // Orange (#F99A29)
                Color(0xFFFF792E), // Deep Orange (#FF792E)
              ],
            ),
            title: 'New Phone, who\'s this?',
            subtitle: 'Ring in the savings on the latest phones.',
            image: 'assets/images/iphonefull.png',
          ),
          _buildPromotionCard(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF593E7D), // Deep Purple (#593E7D)
                Color(0xFF7F5FED), // Brighter Purple (#7F5FED)
              ],
            ),
            title: 'Play more,pay less',
            subtitle: 'Get your fav games & consoles delivered.',
            image: 'assets/images/controller.png',
          ),
          _buildPromotionCard(
            color: Colors.blue,
            title: 'New Arrivals',
            subtitle: 'Get 10% off on all new products',
            image: 'assets/images/iphonefull.png',
          ),
        ],
      ),
    );
  }

  Widget _buildPromotionCard({
    Color? color,
    Gradient? gradient,
    required String title,
    required String subtitle,
    required String image,
  }) {
    // Ensure either color or gradient is provided
    assert(
      color != null || gradient != null,
      'Either color or gradient must be provided',
    );

    return GestureDetector(
      onTap: () => print('Promotion card tapped'),
      child: Container(
        width: 180,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: gradient == null ? color : null,
          gradient: gradient,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
            ),
            Row(
              children: [SizedBox(width: 20), Image.asset(image, width: 100)],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ElectronicTabScreen(),
                ),
              );
            },
            child: const Icon(Icons.arrow_forward),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionWithArrow(BuildContext context, String title) {
    return _buildSectionTitle(context, title);
  }

  Widget _buildMobileScrollSection() {
    return SizedBox(
      height: 260,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          _buildMobileProductCard(
            model: 'Apple iPhone 14',
            specs: 'Pro Max 265 GB Black',
            price: '₹ 3,787.20',
            hasDiscount: true,
          ),
          _buildMobileProductCard(
            model: 'Apple iPhone 15',
            specs: 'Pro Max 265 GB Black',
            price: '₹ 3,787.20',
            hasDiscount: true,
          ),
          _buildMobileProductCard(
            model: 'Apple iPhone 15',
            specs: 'Pro Max 265 GB Black',
            price: '₹ 3,787.20',
            hasDiscount: true,
          ),
        ],
      ),
    );
  }

  Widget _buildMobileProductCard({
    required String model,
    required String specs,
    required String price,
    bool hasDiscount = false,
  }) {
    return GestureDetector(
      onTap: () => print('$model product tapped'),
      child: Container(
        width: 160,
        margin: const EdgeInsets.only(right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 160,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Image.asset('assets/images/iphonefull.png',
                        height: 140),
                  ),
                ),
                if (hasDiscount)
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        '20%',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: () => print('Add to cart tapped for $model'),
                    child: Container(
                      height: 32,
                      width: 32,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: const Center(child: Icon(Icons.add, size: 20)),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              model,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              specs,
              style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Text(
              price,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategorySection() {
    final categories = [
      {'label': 'Phones', 'image': 'assets/images/vivo.png'},
      {'label': 'Tablets', 'image': 'assets/images/tab.png'},
      {'label': 'Laptops', 'image': 'assets/images/laptop.png'},
      {'label': 'Monitors', 'image': 'assets/images/led.png'},
      {'label': 'Accessories', 'image': 'assets/images/iphonefull.png'},
    ];

    return SizedBox(
      height: 135,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        children: categories.map((category) {
          return GestureDetector(
            onTap: () => print('${category['label']} category tapped'),
            child: Container(
              width: 100,
              margin: const EdgeInsets.only(right: 16),
              child: Column(
                children: [
                  Container(
                    height: 95,
                    width: 95,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black),
                      image: DecorationImage(
                        image: AssetImage(category['image']!),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    category['label']!,
                    style: const TextStyle(fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildBestSellersGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: [
          _buildGridProductCard(
            image: 'assets/images/iphone15.png',
            title: 'Apple iPhone 15 Pro',
            subtitle: 'Max 265 GB Black Titanium',
            originalPrice: '₹ 5,117.80',
            discountedPrice: '₹ 3,787.20',
            discountPercent: 20,
          ),
          _buildGridProductCard(
            image: 'assets/images/sony.png',
            title: 'Sony Playstation Disc 5',
            subtitle: 'Slim Version 1TB - Man',
            discountedPrice: '₹ 3,787.20',
          ),
        ],
      ),
    );
  }

  Widget _buildAccessoriesGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: [
          _buildGridProductCard(
            image: 'assets/images/fc24.png',
            title: 'EA FC24',
            subtitle: 'PS5 Game',
            originalPrice: 'AED 5,117.80',
            discountedPrice: 'AED 3,787.20',
            currencyChanged: true,
          ),
          _buildGridProductCard(
            image: 'assets/images/sony.png',
            title: 'Sony Playstation Disc 5',
            subtitle: 'Slim Version 1TB - Man',
            discountedPrice: 'AED 3,787.20',
            currencyChanged: true,
          ),
          _buildGridProductCard(
            image: 'assets/images/bag1.png',
            title: 'EA FC24',
            subtitle: 'PS5 Game',
            originalPrice: 'AED 5,117.80',
            discountedPrice: 'AED 3,787.20',
            currencyChanged: true,
          ),
          _buildGridProductCard(
            image: 'assets/images/controller2.png',
            title: 'Sony Playstation Disc 5',
            subtitle: 'Slim Version 1TB - Man',
            discountedPrice: 'AED 3,787.20',
            currencyChanged: true,
          ),
          _buildGridProductCard(
            image: 'assets/images/suitcase.png',
            title: 'EA FC24',
            subtitle: 'PS5 Game',
            originalPrice: 'AED 5,117.80',
            discountedPrice: 'AED 3,787.20',
            currencyChanged: true,
          ),
          _buildGridProductCard(
            image: 'assets/images/assasincreed.png',
            title: 'Sony Playstation Disc 5',
            subtitle: 'Slim Version 1TB - Man',
            discountedPrice: 'AED 3,787.20',
            currencyChanged: true,
          ),
        ],
      ),
    );
  }

  Widget _buildGridProductCard({
    required String image,
    required String title,
    required String subtitle,
    required String discountedPrice,
    String? originalPrice,
    int? discountPercent,
    bool currencyChanged = false,
  }) {
    return GestureDetector(
      onTap: () => print('$title product tapped'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(child: Image.asset(image, height: 110)),
                ),
                if (discountPercent != null)
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        '-$discountPercent%',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: () => print('Add to cart tapped for $title'),
                    child: Container(
                      height: 32,
                      width: 32,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: const Center(child: Icon(Icons.add, size: 20)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            subtitle,
            style: TextStyle(color: Colors.grey.shade600, fontSize: 11),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              if (originalPrice != null) ...[
                Text(
                  originalPrice,
                  style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    color: Colors.grey.shade600,
                    fontSize: 11,
                  ),
                ),
                const SizedBox(width: 4),
              ],
              Text(
                discountedPrice,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ],
          ),
          Container(
            height: 23,
            width: 120,
            margin: const EdgeInsets.only(top: 4),
            decoration: BoxDecoration(
              color: Color(0xff066316),
              borderRadius: BorderRadius.circular(2),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Supr + INR 3,787.20',
                  style: TextStyle(fontSize: 10, color: Color(0xff00FF2D)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
