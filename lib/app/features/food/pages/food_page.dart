// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:suprapp/app/core/constants/app_colors.dart';
import 'package:suprapp/app/core/constants/app_images.dart';
import 'package:suprapp/app/core/constants/global_variables.dart';
import 'package:suprapp/app/features/food/pages/poduct_detail_page.dart';
import 'package:suprapp/app/features/food/pages/product_screen.dart';
import 'package:suprapp/app/features/food/provider/selection_toggle_provider.dart';
import 'package:suprapp/app/features/food/widgets/food_card.dart';
import 'package:suprapp/app/features/food/widgets/food_filter_widget.dart';
import 'package:suprapp/app/features/food/widgets/item_tile.dart';
import 'package:suprapp/app/features/food/widgets/lists.dart';
import 'package:suprapp/app/features/food/widgets/top_food_section.dart';
import 'package:suprapp/app/shared/widgets/custom_textformfield.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({super.key});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  List<String> addressList = ["Villa 13", "Villa 14", "Villa 15"];
  String selectedAddress = "Villa 13";
  final List<String> allFilters = [
    'Offers',
    'Top Rated',
    'Free Delivery',
  ];
  final List<String> imageList = [
    AppImages.cheeseBurger,
    AppImages.chickenSticks,
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final foodToggle = Provider.of<FoodToggleProvider>(context);
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              context.pop();
            },
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.appGrey),
                  borderRadius: BorderRadius.circular(7)),
              child: const Icon(
                Icons.arrow_back,
                color: AppColors.darkGrey,
                size: 20,
              ),
            ),
          ),
        ),
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Deliver to ",
              style: textTheme(context)
                  .bodyLarge
                  ?.copyWith(fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              width: 3,
            ),
            DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: selectedAddress,
                items: addressList.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: textTheme(context).bodySmall?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    selectedAddress = newValue!;
                  });
                },
                icon: const Icon(Icons.keyboard_arrow_down_outlined, size: 20),
                style: textTheme(context).bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {},
              child: Container(
                height: 50,
                width: 40,
                decoration: BoxDecoration(
                    color: colorScheme(context).primary,
                    border: Border.all(color: AppColors.appGrey),
                    borderRadius: BorderRadius.circular(7)),
                child: const Icon(
                  Icons.menu,
                  color: Color.fromARGB(255, 20, 188, 96),
                  size: 15,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                        hint: ' Search for restaurents , dishes & cusines',
                        horizontalPadding: 5,
                        hintSize: 16,
                        hintColor: AppColors.darkGrey,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset(
                            AppIcon.searchIcon,
                            height: 10,
                            width: 10,
                            color:
                                colorScheme(context).onSurface.withOpacity(0.6),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'VEG\nMODE',
                          style: textTheme(context).bodyMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                                height: 1.0, // Tighter line height
                                color: foodToggle.isVeg
                                    ? Colors.green
                                    : Colors.grey,
                              ),
                        ),
                        Transform.scale(
                          scale: 0.7,
                          child: Switch(
                            value: foodToggle.isVeg,
                            onChanged: (val) {
                              foodToggle.toggle();
                            },
                            activeColor: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.only(right: 8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: colorScheme(context)
                                  .onSurface
                                  .withOpacity(0.3)),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Icon(Icons.filter_alt_outlined, size: 16),
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: allFilters
                              .map((f) => FoodFilterButton(label: f))
                              .toList(),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: size.height * 0.25,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: imageList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 12),
                        width: size.width * 0.7,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          gradient: LinearGradient(
                            colors: [
                              Colors.black.withOpacity(0.4),
                              Colors.transparent
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.topRight,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.15),
                              blurRadius: 6,
                              offset: const Offset(2, 4),
                            ),
                          ],
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(imageList[index]),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "What are you craving today ",
                  style: textTheme(context)
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: size.height * 0.45,
                  width: size.width,
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: categories.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4, // This will ensure two rows of items
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 0,
                      childAspectRatio:
                          (size.width * 0.9 / 2) / (size.height * 0.3),
                    ),
                    scrollDirection:
                        Axis.horizontal, // Enables horizontal scrolling
                    itemBuilder: (context, index) {
                      final item = categories[index];

                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductScreen(
                                category: item['text']!,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          height: size.height * 0.15,
                          width: size.width * 0.9,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                item['image']!,
                                height: 45,
                                width: 40,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(height: 3),
                              Text(
                                textAlign: TextAlign.center,
                                item['text']!,
                                style: textTheme(context)
                                    .labelLarge
                                    ?.copyWith(fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: size.height * 0.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.4),
                        Colors.transparent
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.topRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 6,
                        offset: const Offset(2, 4),
                      ),
                    ],
                    image: const DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                          'https://img.pikbest.com/templates/20240528/fast-food-restaurant-banner-template_10587852.jpg!sw800'),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Offer Zone - Flat 125 Off ",
                      style: textTheme(context)
                          .titleLarge
                          ?.copyWith(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      "Add 2 of the same item to use FLAT125   coupon",
                      style: textTheme(context).labelLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.darkGrey),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: size.height * 0.4,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: burgerList.length,
                    itemBuilder: (context, index) {
                      final burger = burgerList[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  ProductDetailPage(product: burger),
                            ),
                          );
                        },
                        child: SizedBox(
                          height: size.height * 0.32,
                          child: FoodCard(
                            portion: burger['portion'],
                            image: burger['image'],
                            title: burger['title'],
                            oldPrice: burger['oldPrice'],
                            newPrice: burger['newPrice'],
                            offerText: burger['offerText'],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 2,
                      width: 100,
                      color: AppColors.appGrey,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    RichText(
                        text: TextSpan(
                            text: "Top",
                            style: textTheme(context).displaySmall!.copyWith(
                                  color: colorScheme(context).onSurface,
                                  fontWeight: FontWeight.w700,
                                ),
                            children: <TextSpan>[
                          TextSpan(
                            text: 'Picks',
                            style: textTheme(context).displaySmall!.copyWith(
                                  color: colorScheme(context).primary,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ])),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 2,
                      width: 100,
                      color: AppColors.appGrey,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: size.height * 0.35,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: burgerList.length,
                    itemBuilder: (context, index) {
                      final burger = burgerList[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  ProductDetailPage(product: burger),
                            ),
                          );
                        },
                        child: TopPickItem(
                          discountText: '20 % off',
                          image: burger['image'],
                          title: burger['title'],
                          oldPrice: burger['oldPrice'],
                          newPrice: burger['newPrice'],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Chaat Cravings Sorted",
                  style: textTheme(context)
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: size.height * 0.4,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: chaatCravingList.length,
                    itemBuilder: (context, index) {
                      final chaat = chaatCravingList[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ProductDetailPage(product: chaat),
                            ),
                          );
                        },
                        child: FoodCard(
                          offerText: '20 % off',
                          portion: chaat['portion'],
                          image: chaat['image'],
                          title: chaat['title'],
                          oldPrice: chaat['oldPrice'],
                          newPrice: chaat['newPrice'],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: size.height * 0.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.4),
                        Colors.transparent
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.topRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 6,
                        offset: const Offset(2, 4),
                      ),
                    ],
                    image: const DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                          'https://img.freepik.com/free-psd/food-menu-restaurant-facebook-cover-template_106176-749.jpg'),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Cofees for you",
                      style: textTheme(context)
                          .titleLarge
                          ?.copyWith(fontWeight: FontWeight.w600),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'View All',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: colorScheme(context).primary,
                          decorationThickness: 2,
                          color: colorScheme(context).primary,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: size.height * 0.4,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: cofees.length,
                    itemBuilder: (context, index) {
                      final cofee = cofees[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ProductDetailPage(product: cofee),
                            ),
                          );
                        },
                        child: FoodCard(
                          offerText: '20 % off',
                          portion: cofee['portion'],
                          image: cofee['image'],
                          title: cofee['title'],
                          oldPrice: cofee['oldPrice'],
                          newPrice: cofee['newPrice'],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Blissful Bites",
                  style: textTheme(context)
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: size.height * 0.4,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: blisfulbites.length,
                    itemBuilder: (context, index) {
                      final bliss = blisfulbites[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ProductDetailPage(product: bliss),
                            ),
                          );
                        },
                        child: Container(
                          height: size.height * 0.32,
                          child: FoodCard(
                            portion: bliss['portion'],
                            image: bliss['image'],
                            title: bliss['title'],
                            oldPrice: bliss['oldPrice'],
                            newPrice: bliss['newPrice'],
                            offerText: bliss['offerText'],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Quick Grabs",
                  style: textTheme(context)
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: size.height * 0.4,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: quickGrabs.length,
                    itemBuilder: (context, index) {
                      final quick = quickGrabs[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ProductDetailPage(product: quick),
                            ),
                          );
                        },
                        child: Container(
                          height: size.height * 0.32,
                          child: FoodCard(
                            portion: quick['portion'],
                            image: quick['image'],
                            title: quick['title'],
                            oldPrice: quick['oldPrice'],
                            newPrice: quick['newPrice'],
                            offerText: quick['offerText'],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Crazy Delight",
                  style: textTheme(context)
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: size.height * 0.7,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: crazyDelight.length,
                    itemBuilder: (context, index) {
                      final crazy = crazyDelight[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ProductDetailPage(product: crazy),
                            ),
                          );
                        },
                        child: ItemTile(
                          portion: crazy['portion'],
                          priceBefore: crazy['priceBefore'],
                          priceNow: crazy['priceNow'],
                          subtitle: crazy['subtitle'],
                          tag: crazy['tag'],
                          image: crazy['image'],
                          title: crazy['title'],
                        ),
                      );
                    },
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
