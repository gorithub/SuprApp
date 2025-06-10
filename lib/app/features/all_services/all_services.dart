import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:suprapp/app/core/constants/app_colors.dart';
import 'package:suprapp/app/core/constants/global_variables.dart';
import 'package:suprapp/app/features/all_services/coming_soon_page.dart';
import 'package:suprapp/app/features/super_quick_electronics/quickelec_main_screen.dart';
import 'package:suprapp/app/routes/go_router.dart';

class AllServicesPage extends StatelessWidget {
  const AllServicesPage({super.key});

  void onServiceTap(BuildContext context, String service) {
    switch (service) {
      case 'Rides':
        context.pushNamed(AppRoute.rideHome);
        break;
      case 'Car Rental':
      case 'Bike':
        context.pushNamed(AppRoute.bikeRideHome);
        break;
      case 'Box':
      case 'Send Money':
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => ComingSoonPage()));
        break;
      case 'Bills & Recharges':
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => ComingSoonPage()));
        break;
      case 'Gaza & Lebanon':
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => ComingSoonPage()));
        break;
      case 'Pay Someone':
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => ComingSoonPage()));
        break;
      case 'Home Services':
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => ComingSoonPage()));
        break;
      case 'Supr Live':
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => ComingSoonPage()));
        break;
      case 'Food':
        context.pushNamed(AppRoute.foodPage);
        break;
      case 'Dineout':
        context.pushNamed(AppRoute.dineOutPage);
        break;
      case 'Groceries':
        context.pushNamed(AppRoute.groceryHomeScreen);
        break;
      case 'Shops':
        //  Navigator.pushNamed(context, AppRoutes.shopsScreen);
        break;
      case 'Electronics':
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => QuickElectronicsScreen()));
        break;
    }
  }

  Widget buildServiceTile(BuildContext context, String label, String image) {
    return GestureDetector(
      onTap: () => onServiceTap(context, label),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        decoration: BoxDecoration(
          color: AppColors.appGrey.withOpacity(0.5),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/$image",
              fit: BoxFit.contain,
              height: 40,
              width: 50,
            ),
            const SizedBox(height: 6),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCategory(
      BuildContext context, String title, List<Map<String, String>> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        const SizedBox(height: 12),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 25,
            childAspectRatio: 0.7,
            // crossAxisCount: 3, // 3 items per row
            // crossAxisSpacing: 19, // Horizontal space between tiles
            // mainAxisSpacing: 19, // Vertical space between tiles
            // childAspectRatio: 1.4, // Width / Height ratio
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return buildServiceTile(
              context,
              items[index]['label']!,
              items[index]['image']!,
            );
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
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
        title: Text(
          "All Services ",
          style: textTheme(context)
              .titleMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildCategory(context, "Go Anywhere", [
                  {'label': 'Rides', 'image': 'rides.png'},
                  {'label': 'Car Rental', 'image': 'car_rental.png'},
                  {'label': 'Bike Rental', 'image': 'bike_rental.png'},
                  {'label': 'Bike', 'image': 'bike.png'},
                ]),
                buildCategory(context, "Eat anytime", [
                  {'label': 'Food', 'image': 'food.png'},
                  {'label': 'Dineout', 'image': 'dineout.png'},
                ]),
                buildCategory(context, "Get anything", [
                  {'label': 'Groceries', 'image': 'groceries.png'},
                  {'label': 'Shops', 'image': 'shops.png'},
                  {'label': 'Box', 'image': 'box.png'},
                  {'label': 'Electronics', 'image': 'electronics.png'},
                ]),
                buildCategory(context, "Pay Anyone", [
                  {'label': 'Send Money', 'image': 'send_money.png'},
                  {'label': 'Bills & Recharges', 'image': 'bills.png'},
                  {'label': 'Gaza & Lebanon', 'image': 'gaza.png'},
                  {'label': 'Pay Someone', 'image': 'pay_someone.png'},
                ]),
                buildCategory(context, "Other", [
                  {'label': 'Home Services', 'image': 'home_services.png'},
                  {'label': 'Supr Live', 'image': 'supr_live.png'},
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
