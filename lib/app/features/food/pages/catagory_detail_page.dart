import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suprapp/app/core/constants/app_colors.dart';
import 'package:suprapp/app/core/constants/global_variables.dart';
import 'package:suprapp/app/features/food/controller/food_controller.dart';

class BurgerHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final foodProvider = Provider.of<FoodController>(context);
    final foodList = foodProvider.foods;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              'https://www.foodandwine.com/thmb/DI29Houjc_ccAtFKly0BbVsusHc=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/crispy-comte-cheesburgers-FT-RECIPE0921-6166c6552b7148e8a8561f7765ddf20b.jpg',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ), // Replace with your image
            SizedBox(height: 16),
            Wrap(
              spacing: 12,
              children: [
                _filterChip('GOTYOU'),
                _filterChip('4.5+ Rated'),
                _filterChip('⚡ 30 mins'),
              ],
            ),
            SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text("What's on your mind?",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    _foodCategory('Classic',
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0FoJ9skQZByTHEk3Qz8PF88o4Vjp1WrRMaw&s'),
                    _foodCategory('Smashed',
                        'https://static.vecteezy.com/system/resources/thumbnails/027/145/344/small_2x/delicious-bbq-bacon-burger-isolated-on-transparent-background-png.png'),
                    _foodCategory('Chicken Sando',
                        'https://static.vecteezy.com/system/resources/thumbnails/041/445/512/small_2x/ai-generated-delicious-chicken-sandwich-on-transparent-background-png.png'),
                    _foodCategory('Sliders',
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHzCC8dtX-YdqhUGPOkv6wet2JnokJtkGAUw&s'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Top burgers 🍔',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text('Meet your next burger obsession'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                height: size.height * 0.32,
                width: size.width,
                child: ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    itemCount: foodList.length,
                    itemBuilder: (context, index) {
                      final food = foodList[index];
                      return GestureDetector(
                          onTap: () {},
                          child: Card(
                            elevation: 6,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            child: Container(
                              height: size.height * 0.3,
                              width: size.width * 0.4,
                              decoration: BoxDecoration(
                                  color: colorScheme(context).onPrimary,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(5),
                                              topRight: Radius.circular(5)),
                                          child: Image.asset(
                                            food.image,
                                            height: size.height * 0.15,
                                            width: size.width,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Positioned(
                                          top: 70,
                                          left: 10,
                                          child: Text(
                                            "${index + 1}",
                                            style: textTheme(context)
                                                .headlineLarge
                                                ?.copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    color: colorScheme(context)
                                                        .onPrimary),
                                          ),
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        food.title,
                                        style: textTheme(context)
                                            .bodyMedium
                                            ?.copyWith(
                                                fontWeight: FontWeight.w600,
                                                color: colorScheme(context)
                                                    .onSurface),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        const SizedBox(width: 8),
                                        Icon(Icons.star,
                                            size: 15,
                                            color:
                                                colorScheme(context).primary),
                                        Text(
                                          food.rating,
                                          style: textTheme(context)
                                              .labelLarge
                                              ?.copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  color: colorScheme(context)
                                                      .primary),
                                        ),
                                        Container(
                                          height: 5,
                                          width: 5,
                                          margin: const EdgeInsets.all(5),
                                          decoration: const BoxDecoration(
                                              color: Colors.black,
                                              shape: BoxShape.circle),
                                        ),
                                        Text(
                                          food.time,
                                          style: textTheme(context)
                                              .bodySmall
                                              ?.copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  color: colorScheme(context)
                                                      .onSurface),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        const SizedBox(width: 8),
                                        SizedBox(
                                            width: 70,
                                            child: Text(food.location,
                                                style: textTheme(context)
                                                    .labelLarge
                                                    ?.copyWith(
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: AppColors
                                                            .darkGrey))),
                                        Container(
                                          height: 5,
                                          width: 5,
                                          margin: const EdgeInsets.all(5),
                                          decoration: const BoxDecoration(
                                              color: Colors.black,
                                              shape: BoxShape.circle),
                                        ),
                                        Text(food.distance,
                                            style: textTheme(context)
                                                .labelLarge
                                                ?.copyWith(
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColors.darkGrey)),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 8,
                                        ),
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
                                                      color:
                                                          colorScheme(context)
                                                              .surface,
                                                      fontWeight:
                                                          FontWeight.w600)),
                                        )
                                      ],
                                    )
                                  ]),
                            ),
                          ));
                    }),
              ),
            ),

            // SizedBox(height: 16),
            // _restaurantCard('Shake Shack', '4.3', '30 - 40 mins', '1.7 km',
            //     'https://www.foodandwine.com/thmb/LUEdbNTLcdq_BtCmINp23zQbQro=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/classic-cheeseburgers-eat-delicious-XL-BLOG0517-b578f43651854aeb8e2e605580094811.jpg'),
            // _restaurantCard('Burger Smash', '4.7', '25 - 35 mins', '0.3 km',
            //     'https://www.foodandwine.com/thmb/XE8ubzwObCIgMw7qJ9CsqUZocNM=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/MSG-Smash-Burger-FT-RECIPE0124-d9682401f3554ef683e24311abdf342b.jpg',
            //     showDiscount: true),
          ],
        ),
      ),
    );
  }

  Widget _filterChip(String label) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.white,
      shape: StadiumBorder(
          side: BorderSide(
        color: Colors.grey.shade300,
      )),
    );
  }

  Widget _foodCategory(String label, String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Image.network(imagePath, height: 40),
          SizedBox(height: 6),
          Text(label, style: TextStyle(fontSize: 13)),
        ],
      ),
    );
  }

  Widget _restaurantCard(String name, String rating, String time,
      String distance, String imagePath,
      {bool showDiscount = false}) {
    return Card(
      child: Column(
        children: [
          Image.network(imagePath, height: 100),
          ListTile(
            title: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('$rating ★ · $time · $distance'),
            trailing: showDiscount
                ? Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(6)),
                    child: Text('20% off',
                        style: TextStyle(color: Colors.white, fontSize: 12)),
                  )
                : null,
          ),
        ],
      ),
    );
  }
}
