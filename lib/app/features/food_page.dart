import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:suprapp/app/core/constants/app_colors.dart';
import 'package:suprapp/app/core/constants/app_images.dart';
import 'package:suprapp/app/core/constants/global_variables.dart';
import 'package:suprapp/app/features/food_filter_widget.dart';
import 'package:suprapp/app/shared/widgets/custom_textformfield.dart';

import '../routes/go_router.dart';

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
  final List<Map<String, String>> categories = [
    {'image': AppImages.offers, 'text': 'Offers'},
    {'image': AppImages.burger, 'text': 'Burger'},
    {'image': AppImages.healthy, 'text': 'Healthy'},
    {'image': AppImages.asian, 'text': 'Asian'},
    {'image': AppImages.exclusiveOffer, 'text': 'Exclusive Offer'},
    {'image': AppImages.bestSelling, 'text': 'Best Selling'},
    {'image': AppImages.chickenWings, 'text': 'Chicken & Wings'},
    {'image': AppImages.russian, 'text': 'Russian'},
    {'image': AppImages.gotYou, 'text': 'GOT YOU'},
    {'image': AppImages.lebanese, 'text': 'Lebanese'},
    {'image': AppImages.pizza, 'text': 'Pizza'},
    {'image': AppImages.indian, 'text': 'Indian'},
    {'image': AppImages.dessert, 'text': 'Dessert'},
    {'image': AppImages.cofee, 'text': 'Cofee'},
    {'image': AppImages.sushi, 'text': 'Sushi'},
    {'image': AppImages.breakfast, 'text': 'BreakFast'},
  ];
  final List<Map<String, dynamic>> burgerList = [
    {
      'image': AppImages.cheeseBurger,
      'title': 'Eeetwell',
      'rating': 4.5,
      'foodItems': 'Fast Food',
      'distance': '. 1.7 km',
      'arriveTime': ' . 35-45 mins'
    },
    {
      'image': "assets/images/burger2.png",
      'title': 'Yo!-Sushi',
      'foodItems': 'Juices, Sand',
      'distance': '. 1.9 km',
      'rating': 4.5,
      'arriveTime': ' . 35-45 mins'
    },
    {
      'image': AppImages.cheeseBurger,
      'title': 'Eeetwell',
      'rating': 4.5,
      'foodItems': 'Fast Food',
      'distance': '. 1.7 km',
      'arriveTime': ' . 35-45 mins'
    },
    {
      'image': "assets/images/burger2.png",
      'title': 'Yo!-Sushi',
      'foodItems': 'Juices, Sand',
      'distance': '. 1.9 km',
      'rating': 4.5,
      'arriveTime': ' . 35-45 mins'
    },
  ];
  final List<String> brandsList = [
    'https://logos-world.net/wp-content/uploads/2020/04/McDonalds-Logo.png',
    'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/2a/cf/b9/28/cheezious-pizza.jpg?w=900&h=500&s=1',
    'https://play-lh.googleusercontent.com/qR-sPEGkCQvborNj2jqOF00EV3N9vxJMXYwaufVQMnIspanioOVOqLUSB4kLOkzKYJE7=w600-h300-pc0xffffff-pd',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4mn74PTlVHE-UElXmyr5dVzzs8X4MDG8pzQ&s'
  ];
  final List<String> inspiringList = [
    'https://img.freepik.com/free-photo/people-taking-photos-food_23-2149303524.jpg',
    'https://media.istockphoto.com/id/506828094/photo/waitress-taking-orders-to-people-at-a-restaurant.jpg?s=612x612&w=0&k=20&c=ppBNb3-qk0S8VprfTNmJLbHQIb5O4qgm7UiWw9cr_OI=',
    'https://media.istockphoto.com/id/1304752349/photo/female-customer-buying-food-on-digital-tablet-at-cashier-counter.jpg?s=170667a&w=is&k=20&c=QyFbRTExyAWvH5PWXk3jwg4kSgayEWI2-W9KOBqnw9s='
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
            SizedBox(
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
                icon: Icon(Icons.keyboard_arrow_down_outlined, size: 20),
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
                child: Icon(
                  Icons.menu,
                  color: const Color.fromARGB(255, 20, 188, 96),
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
                CustomTextFormField(
                  hint: 'Search for restaurents , dishes & cusines',
                  horizontalPadding: 15,
                  hintSize: 16,
                  hintColor: AppColors.darkGrey,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset(
                      AppIcon.searchIcon,
                      height: 10,
                      width: 10,
                      color: colorScheme(context).onSurface.withOpacity(0.6),
                    ),
                  ),
                ),
                SizedBox(
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
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: size.height * 0.25,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: imageList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(right: 12),
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
                              offset: Offset(2, 4),
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
                SizedBox(
                  height: 20,
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
                        onTap: () {},
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
                SizedBox(
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
                        offset: Offset(2, 4),
                      ),
                    ],
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                          'https://pbs.twimg.com/media/Eh3HzS6XkAUTAsA?format=jpg&name=medium'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Top trending restaurents",
                      style: textTheme(context)
                          .titleLarge
                          ?.copyWith(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      " Discover the hottest spots in town 👇",
                      style: textTheme(context).labelLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.darkGrey),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: size.height * 0.3,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: burgerList.length,
                    itemBuilder: (context, index) {
                      final burger = burgerList[index];
                      return Container(
                        height: size.height * 0.3,
                        width: size.width * 0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12),
                                  ),
                                  child: Image.asset(
                                    burger['image'],
                                    height: size.height * 0.15,
                                    width: size.width * 0.35,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    burger['title'],
                                    style: textTheme(context)
                                        .bodyMedium
                                        ?.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color:
                                                colorScheme(context).onSurface),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.star,
                                          color: colorScheme(context).primary,
                                          size: 14),
                                      const SizedBox(width: 4),
                                      Text(
                                        burger['rating'].toString(),
                                        style: textTheme(context)
                                            .labelLarge
                                            ?.copyWith(
                                                fontWeight: FontWeight.w600,
                                                color: colorScheme(context)
                                                    .primary),
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        burger['arriveTime'],
                                        style: textTheme(context)
                                            .bodySmall
                                            ?.copyWith(
                                                fontWeight: FontWeight.w600,
                                                color: colorScheme(context)
                                                    .onSurface),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Row(
                                    children: [
                                      Text(burger['foodItems'].toString(),
                                          style: textTheme(context)
                                              .labelLarge
                                              ?.copyWith(
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColors.darkGrey)),
                                      const SizedBox(width: 8),
                                      Text(burger['distance'].toString(),
                                          style: textTheme(context)
                                              .labelLarge
                                              ?.copyWith(
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColors.darkGrey)),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 3),
                                        decoration: BoxDecoration(
                                          color: Colors.pink,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Text('50 % off just for items',
                                            style: textTheme(context)
                                                .labelMedium
                                                ?.copyWith(
                                                    color: colorScheme(context)
                                                        .surface,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Popular  Brands",
                  style: textTheme(context)
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: size.height * 0.08,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: brandsList.length,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      return Container(
                        height: size.height * 0.08,
                        width: size.width * 0.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(brandsList[index]),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Best Sellers 🔥",
                          style: textTheme(context)
                              .titleLarge
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          "Satisfy cravings from top restaurents!",
                          style: textTheme(context).labelLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: AppColors.darkGrey),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_outlined,
                      size: 20,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: size.height * 0.55,
                  width: size.width,
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: burgerList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // This will ensure two rows of items
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 5,
                      childAspectRatio:
                          (size.width * 0.9 / 9) / (size.height * 0.2),
                    ),
                    scrollDirection:
                        Axis.horizontal, // Enables horizontal scrolling
                    itemBuilder: (context, index) {
                      final burger = burgerList[index];

                      return Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        shadowColor: const Color.fromARGB(255, 236, 239, 227),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: size.height * 0.2,
                            width: size.width * 0.8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(12),
                                        bottomLeft: Radius.circular(12),
                                      ),
                                      child: Image.asset(
                                        burger['image'],
                                        height: size.height * 0.14,
                                        width: size.width * 0.25,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            burger['title'],
                                            style: textTheme(context)
                                                .bodyMedium
                                                ?.copyWith(
                                                    fontWeight: FontWeight.w600,
                                                    color: colorScheme(context)
                                                        .onSurface),
                                          ),
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Row(
                                            children: [
                                              Icon(Icons.star,
                                                  color: colorScheme(context)
                                                      .primary,
                                                  size: 14),
                                              const SizedBox(width: 4),
                                              Text(
                                                burger['rating'].toString(),
                                                style: textTheme(context)
                                                    .labelLarge
                                                    ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color:
                                                            colorScheme(context)
                                                                .primary),
                                              ),
                                              const SizedBox(width: 4),
                                              Text(
                                                burger['arriveTime'],
                                                style: textTheme(context)
                                                    .bodySmall
                                                    ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color:
                                                            colorScheme(context)
                                                                .onSurface),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                  burger['foodItems']
                                                      .toString(),
                                                  style:
                                                      textTheme(context)
                                                          .labelLarge
                                                          ?.copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: AppColors
                                                                  .darkGrey)),
                                              const SizedBox(width: 8),
                                              Text(
                                                  burger['distance'].toString(),
                                                  style: textTheme(context)
                                                      .labelLarge
                                                      ?.copyWith(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: AppColors
                                                              .darkGrey)),
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          Row(
                                            children: [
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8,
                                                        vertical: 3),
                                                decoration: BoxDecoration(
                                                  color: Colors.pink,
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: Text(
                                                    '50 % off just for items',
                                                    style: textTheme(context)
                                                        .labelMedium
                                                        ?.copyWith(
                                                            color: colorScheme(
                                                                    context)
                                                                .surface,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600)),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Need inspiration",
                      style: textTheme(context)
                          .titleLarge
                          ?.copyWith(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      "Restaurents for every occasion",
                      style: textTheme(context).labelLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.darkGrey),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: size.height * 0.25,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: inspiringList.length,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: size.height * 0.15,
                          width: size.width * 0.35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(inspiringList[index]),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nearby  ⚡",
                          style: textTheme(context)
                              .titleLarge
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          "Savor the speedy goodness!",
                          style: textTheme(context).labelLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: AppColors.darkGrey),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_outlined,
                      size: 20,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: size.height * 0.3,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: burgerList.length,
                    itemBuilder: (context, index) {
                      final burger = burgerList[index];
                      return Container(
                        height: size.height * 0.3,
                        width: size.width * 0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12),
                                  ),
                                  child: Image.asset(
                                    burger['image'],
                                    height: size.height * 0.15,
                                    width: size.width * 0.35,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    burger['title'],
                                    style: textTheme(context)
                                        .bodyMedium
                                        ?.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color:
                                                colorScheme(context).onSurface),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.star,
                                          color: colorScheme(context).primary,
                                          size: 14),
                                      const SizedBox(width: 4),
                                      Text(
                                        burger['rating'].toString(),
                                        style: textTheme(context)
                                            .labelLarge
                                            ?.copyWith(
                                                fontWeight: FontWeight.w600,
                                                color: colorScheme(context)
                                                    .primary),
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        burger['arriveTime'],
                                        style: textTheme(context)
                                            .bodySmall
                                            ?.copyWith(
                                                fontWeight: FontWeight.w600,
                                                color: colorScheme(context)
                                                    .onSurface),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Row(
                                    children: [
                                      Text(burger['foodItems'].toString(),
                                          style: textTheme(context)
                                              .labelLarge
                                              ?.copyWith(
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColors.darkGrey)),
                                      const SizedBox(width: 8),
                                      Text(burger['distance'].toString(),
                                          style: textTheme(context)
                                              .labelLarge
                                              ?.copyWith(
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColors.darkGrey)),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 3),
                                        decoration: BoxDecoration(
                                          color: Colors.pink,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Text('50 % off just for items',
                                            style: textTheme(context)
                                                .labelMedium
                                                ?.copyWith(
                                                    color: colorScheme(context)
                                                        .surface,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Text(
                  "All Restaurants",
                  style: textTheme(context)
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: size.height * 0.7,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: burgerList.length,
                    itemBuilder: (context, index) {
                      final burger = burgerList[index];
                      return Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        shadowColor: const Color.fromARGB(255, 236, 239, 227),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: size.height * 0.15,
                            width: size.width * 0.8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(12),
                                        bottomLeft: Radius.circular(12),
                                      ),
                                      child: Image.asset(
                                        burger['image'],
                                        height: size.height * 0.14,
                                        width: size.width * 0.25,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            burger['title'],
                                            style: textTheme(context)
                                                .bodyMedium
                                                ?.copyWith(
                                                    fontWeight: FontWeight.w600,
                                                    color: colorScheme(context)
                                                        .onSurface),
                                          ),
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Row(
                                            children: [
                                              Icon(Icons.star,
                                                  color: colorScheme(context)
                                                      .primary,
                                                  size: 14),
                                              const SizedBox(width: 4),
                                              Text(
                                                burger['rating'].toString(),
                                                style: textTheme(context)
                                                    .labelLarge
                                                    ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color:
                                                            colorScheme(context)
                                                                .primary),
                                              ),
                                              const SizedBox(width: 4),
                                              Text(
                                                burger['arriveTime'],
                                                style: textTheme(context)
                                                    .bodySmall
                                                    ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color:
                                                            colorScheme(context)
                                                                .onSurface),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                  burger['foodItems']
                                                      .toString(),
                                                  style:
                                                      textTheme(context)
                                                          .labelLarge
                                                          ?.copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: AppColors
                                                                  .darkGrey)),
                                              const SizedBox(width: 8),
                                              Text(
                                                  burger['distance'].toString(),
                                                  style: textTheme(context)
                                                      .labelLarge
                                                      ?.copyWith(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: AppColors
                                                              .darkGrey)),
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          Row(
                                            children: [
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8,
                                                        vertical: 3),
                                                decoration: BoxDecoration(
                                                  color: Colors.pink,
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: Text(
                                                    '50 % off just for items',
                                                    style: textTheme(context)
                                                        .labelMedium
                                                        ?.copyWith(
                                                            color: colorScheme(
                                                                    context)
                                                                .surface,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600)),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
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
