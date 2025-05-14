import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:suprapp/app/core/constants/app_colors.dart';
import 'package:suprapp/app/core/constants/app_images.dart';
import 'package:suprapp/app/core/constants/global_variables.dart';
import 'package:suprapp/app/features/dine_out/controller/dine_out_provider.dart';
import 'package:suprapp/app/features/dine_out/widgets/opening_hour_bottom_sheet.dart';
import 'package:suprapp/app/features/profile/widgets/custom_arrow_back.dart';
import 'package:suprapp/app/routes/go_router.dart';
import 'package:suprapp/app/shared/widgets/custom_elevated_button.dart';

class AnotherRestorantScreen extends StatelessWidget {
  final int parentIndex;
  final int childIndex;
  const AnotherRestorantScreen(
      {super.key, required this.childIndex, required this.parentIndex});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DineOutProvider>(context);
    final data = provider.getAnotherByIndex(parentIndex, childIndex);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
              expandedHeight: 200.0,
              pinned: true,
              floating: false,
              actions: [
                customIconContainer(Icons.share_outlined, () {}),
                const SizedBox(width: 10),
                customIconContainer(Icons.favorite_outline, () {}),
                const SizedBox(width: 10),
              ],
              leading: const CustomArrowBack(),
              backgroundColor: colorScheme(context).onPrimary,
              flexibleSpace: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                final isCollapsed = constraints.maxHeight <=
                    kToolbarHeight + MediaQuery.of(context).padding.top;

                return FlexibleSpaceBar(
                  titlePadding: const EdgeInsets.all(10),
                  title: isCollapsed
                      ? const SizedBox()
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  backgroundColor: Colors.transparent,
                                  isScrollControlled: true,
                                  builder: (_) => OpeningHoursBottomSheet(),
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 4),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2),
                                    color: colorScheme(context).primary),
                                child: Row(
                                  children: [
                                    Text(
                                      "Open until 1:30 AM",
                                      style: textTheme(context)
                                          .labelSmall
                                          ?.copyWith(
                                              color: Colors.white, fontSize: 7),
                                    ),
                                    const Icon(Icons.keyboard_arrow_down,
                                        size: 10, color: Colors.white),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                  color: colorScheme(context).primary),
                              child: Row(
                                children: [
                                  const Icon(Icons.photo_camera_outlined,
                                      size: 10, color: Colors.white),
                                  Text(
                                    "4 of 9",
                                    style: textTheme(context)
                                        .labelSmall
                                        ?.copyWith(
                                            color: Colors.white, fontSize: 7),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                  background: Image.asset(
                    data.image[0].image1,
                    fit: BoxFit.cover,
                  ),
                );
              })),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.title,
                      style: textTheme(context)
                          .bodyLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      data.location,
                      style: textTheme(context)
                          .labelLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star,
                            color: colorScheme(context).primary, size: 16),
                        Text(
                          "${data.rating} (2454 ratings on google)",
                          style: textTheme(context)
                              .labelLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    _careemPlusCard(context),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _actionButton(
                            Icons.location_on_outlined, "Map", () {}, context),
                        const SizedBox(width: 10),
                        _actionButton(Icons.directions_car_outlined,
                            "Book a ride", () {}, context),
                        const SizedBox(width: 10),
                        _actionButton(
                            Icons.call_outlined, "Call", () {}, context),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Go for their samosas",
                      style: textTheme(context)
                          .bodyLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.restaurant_menu_outlined, size: 18),
                        const SizedBox(width: 6),
                        Text(
                          "Cafe",
                          style: textTheme(context).bodySmall,
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(Icons.payments_outlined, size: 18),
                        const SizedBox(width: 6),
                        Text(
                          "Average cost of AED 45 for one",
                          style: textTheme(context).bodySmall,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    _menuCard(() {
                      context.pushNamed(AppRoute.menu);
                    }, context),
                    const SizedBox(height: 24),
                    customTile("Photos", () {}, context),
                    const SizedBox(height: 16),
                    customPhotos(context),
                    const SizedBox(height: 16),
                    customTile("Useful bits", () {
                      context.pushNamed(AppRoute.usefull);
                    }, context),
                    Divider(
                      color: Colors.black.withOpacity(0.3),
                    ),
                    Text(
                      "Amenities",
                      style: textTheme(context)
                          .bodyLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "indoor Seating, Parking Availablity (Paid , Outdoor/ \n Street), Whellchair Accessible, Outdoor Seating, Kid \n Friendly",
                      style: textTheme(context)
                          .labelLarge
                          ?.copyWith(color: Colors.black.withOpacity(0.6)),
                    ),
                    Divider(
                      color: Colors.black.withOpacity(0.3),
                    ),
                    Text(
                      "House Rules",
                      style: textTheme(context)
                          .bodyLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Dress Code, Casual, Family Friendly",
                      style: textTheme(context)
                          .labelLarge
                          ?.copyWith(color: Colors.black.withOpacity(0.6)),
                    ),
                    const SizedBox(height: 20),
                    CustomElevatedButton(
                        text: "Subscribe to creame plus now",
                        onPressed: () {
                          context.pushNamed(AppRoute.creamplusPage);
                        })
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _careemPlusCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colorScheme(context).primary,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Stack(
            children: [
              Text(
                "Caream+ |",
                style: textTheme(context)
                    .bodyMedium
                    ?.copyWith(color: AppColors.brightGreen),
              ),
            ],
          ),
          Text(
            "  Subscribe to get",
            style: textTheme(context).bodyMedium?.copyWith(color: Colors.white),
          ),
          Text(
            " 10% off",
            style: textTheme(context)
                .bodyMedium
                ?.copyWith(color: AppColors.brightGreen),
          ),
          const Spacer(),
          const Icon(Icons.arrow_forward,
              color: AppColors.brightGreen, size: 16),
        ],
      ),
    );
  }

  Widget _actionButton(
      IconData icon, String label, VoidCallback onTap, BuildContext context) {
    return Expanded(
      child: OutlinedButton.icon(
        onPressed: onTap,
        icon: Icon(
          icon,
          size: 18,
          color: Colors.black.withOpacity(0.4),
        ),
        label: Text(
          label,
          style: textTheme(context)
              .labelLarge
              ?.copyWith(color: Colors.black.withOpacity(0.4)),
        ),
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }

  Widget _menuCard(VoidCallback onTap, BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 232, 232, 232)),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: const Icon(Icons.menu_book_outlined,
              color: Color.fromARGB(255, 63, 63, 63)),
        ),
        title: Text(
          "View menu",
          style: textTheme(context)
              .bodyMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        subtitle: Text("Bon appetit!",
            style: textTheme(context)
                .labelLarge
                ?.copyWith(color: Colors.black.withOpacity(0.7))),
        onTap: onTap,
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

  Widget customTile(String title, VoidCallback onTpa, BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style:
            textTheme(context).bodyLarge?.copyWith(fontWeight: FontWeight.bold),
      ),
      trailing: const Icon(
        Icons.arrow_forward_outlined,
        size: 20,
      ),
      onTap: onTpa,
    );
  }

  Widget customPhotos(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.45,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              AppImages.eggtranding,
              height: 120,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fitWidth,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      AppImages.eggtranding,
                      cacheHeight: 70,
                      cacheWidth: 150,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      AppImages.eggtranding,
                      cacheHeight: 70,
                      cacheWidth: 150,
                    ),
                  ),
                ],
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  AppImages.eggtranding,
                  cacheHeight: 150,
                  cacheWidth: 150,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
