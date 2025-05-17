import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:suprapp/app/core/constants/app_images.dart';
import 'package:suprapp/app/core/constants/global_variables.dart';
import 'package:suprapp/app/features/food/controller/food_controller.dart';
import 'package:suprapp/app/features/food/widgets/custom_bottom_sheet.dart';
import 'package:suprapp/app/features/food/widgets/custom_item1_bottom_sheet.dart';
import 'package:suprapp/app/features/food/widgets/custom_offer_bottom_sheet.dart';
import 'package:suprapp/app/features/food/widgets/custom_row.dart';
import 'package:suprapp/app/features/food/widgets/custom_title_container.dart';
import 'package:suprapp/app/features/food/widgets/food_container.dart';
import 'package:suprapp/app/features/food/widgets/food_itemcard.dart';

import 'package:suprapp/app/features/food/widgets/tabbar_deligation.dart';

class FoodDetailPage extends StatefulWidget {
  const FoodDetailPage({super.key});

  @override
  State<FoodDetailPage> createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage>
    with TickerProviderStateMixin {
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

  void showProductBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => const ProductDetailSheet(),
    );
  }

  late TabController _tabController;
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _foodKey = GlobalKey();
  final GlobalKey _beveragesKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    final selectedFood = context.read<FoodController>().selectedFood;

    final tabTexts = selectedFood?.tbartext;
    _tabController = TabController(length: tabTexts!.length, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    if (_tabController.indexIsChanging) return;
    final context = _tabController.index == 0
        ? _foodKey.currentContext
        : _beveragesKey.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(context,
          duration: const Duration(milliseconds: 300));
    }
  }

  var height, width;
  @override
  Widget build(BuildContext context) {
    final selectedFood = context.watch<FoodController>().selectedFood;
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    if (selectedFood == null) {
      return const Center(child: CircularProgressIndicator());
    }

    final tabTexts = selectedFood.tbartext;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
              expandedHeight: height * 0.63,
              pinned: true,
              floating: false,
              actions: [
                customIconContainer(Icons.share_outlined, () {
                  showProductBottomSheet(context);
                }),
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
                title: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    final isCollapsed = constraints.maxHeight <=
                        kToolbarHeight + MediaQuery.of(context).padding.top;

                    return isCollapsed
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(height: 30),
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
          SliverPersistentHeader(
            pinned: true,
            delegate: SliverAppBarDelegate(
              TabBar(
                labelStyle: textTheme(context)
                    .bodySmall
                    ?.copyWith(fontWeight: FontWeight.bold),
                controller: _tabController,
                labelColor: Colors.black,
                indicatorColor: Colors.teal,
                dividerColor: Colors.white,
                indicatorPadding: const EdgeInsets.symmetric(horizontal: 5),
                isScrollable: true,
                labelPadding: const EdgeInsets.symmetric(horizontal: 10),
                onTap: (index) {},
                tabs: tabTexts.map((text) => Tab(text: text)).toList(),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: height,
              width: width,
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Text(
                          tabTexts[0],
                          style: textTheme(context)
                              .titleMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: 3,
                        itemBuilder: (context, index) => const FoodItemCard(
                          title: "Salmon Box 24 Pieces",
                          description:
                              "2 pieces salmon sashimi, 2 pieces salmon nigiri, 4 pieces salmon hoso maki...",
                          imageUrl: AppImages.award,
                          price: 82.5,
                          oldPrice: 165,
                          discount: 50,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Text(
                          tabTexts[1],
                          style: textTheme(context)
                              .titleMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: 3,
                        itemBuilder: (context, index) => const FoodItemCard(
                          title: "Salmon Box 24 Pieces",
                          description:
                              "2 pieces salmon sashimi, 2 pieces salmon nigiri, 4 pieces salmon hoso maki...",
                          imageUrl: AppImages.award,
                          price: 82.5,
                          oldPrice: 165,
                          discount: 50,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Text(
                          tabTexts[2],
                          style: textTheme(context)
                              .titleMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: 3,
                        itemBuilder: (context, index) => const FoodItemCard(
                          title: "Salmon Box 24 Pieces",
                          description:
                              "2 pieces salmon sashimi, 2 pieces salmon nigiri, 4 pieces salmon hoso maki...",
                          imageUrl: AppImages.award,
                          price: 82.5,
                          oldPrice: 165,
                          discount: 50,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Text(
                          tabTexts[3],
                          style: textTheme(context)
                              .titleMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: 3,
                        itemBuilder: (context, index) => const FoodItemCard(
                          title: "Salmon Box 24 Pieces",
                          description:
                              "2 pieces salmon sashimi, 2 pieces salmon nigiri, 4 pieces salmon hoso maki...",
                          imageUrl: AppImages.award,
                          price: 82.5,
                          oldPrice: 165,
                          discount: 50,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Text(
                          tabTexts[4],
                          style: textTheme(context)
                              .titleMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: 3,
                        itemBuilder: (context, index) => const FoodItemCard(
                          title: "Salmon Box 24 Pieces",
                          description:
                              "2 pieces salmon sashimi, 2 pieces salmon nigiri, 4 pieces salmon hoso maki...",
                          imageUrl: AppImages.award,
                          price: 82.5,
                          oldPrice: 165,
                          discount: 50,
                        ),
                      )
                    ]),
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

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}
