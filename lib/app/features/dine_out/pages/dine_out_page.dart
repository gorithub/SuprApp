import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:suprapp/app/core/constants/app_colors.dart';
import 'package:suprapp/app/core/constants/app_images.dart';
import 'package:suprapp/app/core/constants/global_variables.dart';
import 'package:suprapp/app/features/dine_out/widgets/restaurent_card.dart';
import 'package:suprapp/app/routes/go_router.dart';
import 'package:suprapp/app/shared/widgets/custom_textformfield.dart';

class DineOutPage extends StatefulWidget {
  const DineOutPage({super.key});

  @override
  State<DineOutPage> createState() => _DineOutPageState();
}

class _DineOutPageState extends State<DineOutPage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, String>> tabData = [
    {'icon': AppIcon.allIcon, 'text': 'All'},
    {'icon': AppIcon.percetIcon, 'text': 'Offers'},
    {'icon': AppIcon.starIcon, 'text': 'Buy1Get1'},
    {'icon': AppIcon.trophyIcon, 'text': 'Award Winning'},
    {'icon': AppIcon.cheersIcon, 'text': 'Cheers'},
    {'icon': AppIcon.viewIcon, 'text': 'Great Views'},
    {'icon': AppIcon.leafIcon, 'text': 'Only Veg'},
    {'icon': AppIcon.waterBottleIcon, 'text': 'Shisha'},
  ];
  final List<Map<String, dynamic>> restaurant = [
    {
      'image':
          'https://images.unsplash.com/photo-1600891964599-f61ba0e24092?auto=format&fit=crop&w=300&q=60',
      'name': 'Press\'d',
      'location': 'Ground Level, Polo Residence Nad Al Sheba',
      'billingperperson': 'AED 40',
      'tag': 'Coffee & Snacks',
    },
    {
      'image':
          'https://images.unsplash.com/photo-1555992336-03a23c5f177c?auto=format&fit=crop&w=300&q=60',
      'name': 'Urban Bites',
      'location': 'Al Barsha, Dubai',
      'billingperperson': 'AED 55',
      'tag': 'Fast Food',
    },
    {
      'image':
          'https://images.unsplash.com/photo-1523986371872-9d3ba2e2f642?auto=format&fit=crop&w=300&q=60',
      'name': 'Green Bowl',
      'location': 'Downtown Dubai, Dubai Mall',
      'billingperperson': 'AED 60',
      'tag': 'Healthy',
    },
    {
      'image':
          'https://images.unsplash.com/photo-1586190848861-99aa4a171e90?auto=format&fit=crop&w=300&q=60',
      'name': 'Cafe Bloom',
      'location': 'Jumeirah Beach Road',
      'billingperperson': 'AED 30',
      'tag': 'Cafe',
    },
    {
      'image':
          'https://images.unsplash.com/photo-1600891965059-4d47cfa8fc17?auto=format&fit=crop&w=300&q=60',
      'name': 'The Sizzle House',
      'location': 'Marina Walk, Dubai Marina',
      'billingperperson': 'AED 85',
      'tag': 'Grill',
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabData.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
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
        title: Text(
          'DineOut',
          style: textTheme(context).headlineLarge?.copyWith(
                color: colorScheme(context).primary,
                fontWeight: FontWeight.w600,
              ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                context.pushNamed(AppRoute.favouriteRestaurentPage);
              },
              child: Container(
                height: 50,
                width: 40,
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.appGrey),
                    borderRadius: BorderRadius.circular(7)),
                child: Icon(
                  Icons.favorite_outline,
                  color: AppColors.darkGrey,
                  size: 16,
                ),
              ),
            ),
          ),
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextFormField(
              hint: 'Search restaurents',
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
          ),
          SizedBox(
            height: 80,
            child: AnimatedBuilder(
              animation: _tabController,
              builder: (context, _) {
                return TabBar(
                  controller: _tabController,
                  tabAlignment: TabAlignment.start,
                  labelPadding: EdgeInsets.zero,
                  isScrollable: true,
                  padding: EdgeInsets.zero,
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  dividerHeight: 2,
                  dividerColor: AppColors.appGrey,
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(
                      width: 2.0,
                      color: colorScheme(context).primary,
                    ),
                    insets: EdgeInsets.symmetric(horizontal: 15.0),
                  ),
                  tabs: List.generate(tabData.length, (index) {
                    final isSelected = _tabController.index == index;
                    final color = isSelected ? Colors.black : Colors.grey;

                    return SizedBox(
                      height: 70,
                      width: 90,
                      child: Tab(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              tabData[index]['icon']!,
                              height: 24,
                              width: 24,
                              color: color,
                            ),
                            SizedBox(height: 10),
                            Text(
                              tabData[index]['text']!,
                              style: textTheme(context).bodySmall?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: color,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                );
              },
            ),
          ),
          Expanded(
            child: TabBarView(controller: _tabController, children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Explore dining spots',
                        style: textTheme(context).titleMedium?.copyWith(
                            color: colorScheme(context).onSurface,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: size.height * 0.6,
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: restaurant.length,
                          itemBuilder: (context, index) {
                            final item = restaurant[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: InkWell(
                                onTap: () {},
                                child: RestaurantCard(
                                  imageUrl: item['image'],
                                  title: item['name'],
                                  location: item['location'],
                                  price: item['billingperperson'],
                                  tag: item['tag'],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Center(child: Text('123')),
              Center(child: Text('123')),
              Center(child: Text('123')),
              Center(child: Text('123')),
              Center(child: Text('123')),
              Center(child: Text('123')),
              Center(child: Text('123')),
            ]),
          ),
        ],
      ),
    );
  }
}
