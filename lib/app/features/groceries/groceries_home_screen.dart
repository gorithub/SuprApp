import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:suprapp/app/core/constants/app_colors.dart';
import 'package:suprapp/app/core/constants/app_images.dart';
import 'package:suprapp/app/core/constants/global_variables.dart';
import 'package:suprapp/app/features/groceries/controllers/tab_provider.dart';
import 'package:suprapp/app/features/groceries/tabs/all_deals_tab.dart';
import 'package:suprapp/app/features/groceries/tabs/categories_tab.dart';
import 'package:suprapp/app/features/groceries/tabs/fresh_tab.dart';
import 'package:suprapp/app/features/groceries/tabs/top_picks_tab.dart';
import 'package:suprapp/app/features/groceries/widgets/app_bar_title.dart';
import 'package:suprapp/app/features/groceries/widgets/custom_tab_bar.dart';
import 'package:suprapp/app/features/groceries/widgets/grocery_home_tabs.dart';
import 'package:suprapp/app/features/groceries/tabs/all_tab.dart';
import 'package:suprapp/app/shared/widgets/custom_textformfield.dart';

// ignore: must_be_immutable
class GroceriesHomeScreen extends StatelessWidget {
  GroceriesHomeScreen({super.key});

  final List<TabItem> tabItems = const [
    TabItem(label: 'All', icon: Icons.apps),
    TabItem(label: 'Categories', icon: Icons.category),
    TabItem(label: 'Top Picks', icon: Icons.thumb_up),
    TabItem(label: 'All Deals', icon: Icons.local_offer),
    TabItem(label: 'Fresh', icon: Icons.eco),
    TabItem(label: 'Exclusive', icon: Icons.star),
    TabItem(label: 'Home', icon: Icons.home),
    TabItem(label: 'Kids', icon: Icons.child_care),
  ];
  TextEditingController searchControlller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final selectedIndex = context.watch<TabProvider>().tabIndex;

    return DefaultTabController(
      length: tabItems.length,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
          elevation: 1,
          automaticallyImplyLeading: false,
          toolbarHeight: 0,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(270),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                  child: AppBarTitle(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: CustomTextFormField(
                    hint: 'Search for groceries',
                    horizontalPadding: 15,
                    hintSize: 16,
                    controller: searchControlller,
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
                const SizedBox(height: 12),
                CustomTabBar(
                  tabItems: tabItems,
                  selectedIndex: selectedIndex,
                  onTabTap: (index) {
                    context.read<TabProvider>().setTabIndex(index);
                  },
                ),
              ],
            ),
          ),
        ),
        body: IndexedStack(
          index: selectedIndex,
          children: [
            const AllTab(),
            const CategoriesTab(),
            const TopPicksTab(),
            const AllDealsTab(),
            const FreshTab(),
            ...List.generate(
              tabItems.length - 2,
              (i) => Center(child: Text('${tabItems[i + 1].label} Tab')),
            ),
          ],
        ),
      ),
    );
  }
}
