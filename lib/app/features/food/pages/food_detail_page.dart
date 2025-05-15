import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:suprapp/app/core/constants/app_images.dart';
import 'package:suprapp/app/core/constants/global_variables.dart';
import 'package:suprapp/app/features/food/controller/food_controller.dart';
import 'package:suprapp/app/features/food/widgets/custom_bottom_sheet.dart';
import 'package:suprapp/app/features/food/widgets/custom_offer_bottom_sheet.dart';
import 'package:suprapp/app/features/food/widgets/custom_row.dart';
import 'package:suprapp/app/features/food/widgets/custom_title_container.dart';
import 'package:suprapp/app/features/food/widgets/food_container.dart';

class FoodDetailPage extends StatefulWidget {
  const FoodDetailPage({super.key});

  @override
  State<FoodDetailPage> createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  void openGroupOrderSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(2)),
      ),
      builder: (_) => const GroupOrderBottomSheet(),
    );
  }

  void showOfferBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) => const OfferBottomSheet(),
    );
  }

  var height, width;
  @override
  Widget build(BuildContext context) {
    final selectedFood = context.watch<FoodController>().selectedFood;
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
              expandedHeight: height * 0.63,
              pinned: true,
              floating: false,
              actions: [
                customIconContainer(Icons.share_outlined, () {}),
                const SizedBox(width: 10),
                customIconContainer(Icons.favorite_outline, () {}),
                const SizedBox(width: 10),
              ],
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
                        color: colorScheme(context).surface,
                        borderRadius: BorderRadius.circular(7)),
                    child: Icon(
                      Icons.arrow_back,
                      color: colorScheme(context).onSurface,
                      size: 20,
                    ),
                  ),
                ),
              ),
              backgroundColor: colorScheme(context).onPrimary,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: const EdgeInsets.all(10),
                title: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    final isCollapsed = constraints.maxHeight <=
                        kToolbarHeight + MediaQuery.of(context).padding.top;

                    return isCollapsed
                        ? Column(
                            children: [
                              Text(
                                selectedFood!.time,
                                style: textTheme(context)
                                    .bodySmall
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                selectedFood.time,
                                style: textTheme(context).labelLarge?.copyWith(
                                    color: Colors.black.withOpacity(0.5)),
                              )
                            ],
                          )
                        : SizedBox();
                  },
                ),
                background: Stack(
                  children: [
                    SizedBox(
                      height: height,
                      width: width,
                      child: Column(
                        children: [
                          Image.asset(
                            selectedFood!.image,
                            height: height * 0.3,
                            width: width,
                            fit: BoxFit.cover,
                          ),
                          Container(
                              padding: const EdgeInsets.all(16),
                              height: height * 0.35,
                              width: width,
                              child: Column(children: [
                                CustomTitleContainer(
                                    title: selectedFood.title,
                                    location: selectedFood.location,
                                    distance: selectedFood.distance,
                                    rating: selectedFood.rating,
                                    norating: selectedFood.numofrating),
                                FoodContainer(
                                    time: selectedFood.time,
                                    fee: selectedFood.deliveryfee,
                                    price: selectedFood.price),
                                const SizedBox(height: 10),
                                CustomRow(
                                  discount: selectedFood.discount,
                                  onTap: () {
                                    showOfferBottomSheet(context);
                                  },
                                )
                              ])),
                        ],
                      ),
                    ),
                    Positioned(
                        top: height * 0.23,
                        child: Row(
                          children: [
                            customStackContainer(
                                Image.asset(
                                  AppImages.abcd,
                                  height: 50,
                                ),
                                () {}),
                            SizedBox(
                              width: width * 0.4,
                            ),
                            customStackContainer(
                                Row(
                                  children: [
                                    const Icon(Icons.person_outline, size: 15),
                                    const SizedBox(width: 8),
                                    Text(
                                      "Group order",
                                      style: textTheme(context)
                                          .labelMedium
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ), () {
                              openGroupOrderSheet(context);
                            }),
                          ],
                        ))
                  ],
                ),
              )),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget customIconContainer(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, size: 16),
      ),
    );
  }

  Widget customStackContainer(Widget child, VoidCallback onTap) {
    return Card(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: Colors.white),
          child: child,
        ),
      ),
    );
  }
}
