import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:suprapp/app/features/all_services/coming_soon_page.dart';
import 'package:suprapp/app/routes/go_router.dart';

class AllServicesPage extends StatelessWidget {
  const AllServicesPage({super.key});

  void onServiceTap(BuildContext context, String service) {
    switch (service) {
      case 'Rides':
        Navigator.pushNamed(context, AppRoute.enterPickUpLocationPage);
        break;
      case 'Car Rental':
      case 'Bike Rental':
      case 'Bike':
      case 'Box':
      case 'Send Money':
      case 'Bills & Recharges':
      case 'Gaza & Lebanon':
      case 'Pay Someone':
      case 'Home Services':
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
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (_) => QuickElectronicsScreen()));
        break;
    }
  }

  Widget buildServiceTile(BuildContext context, String label, String image) {
    return GestureDetector(
      onTap: () => onServiceTap(context, label),
      child: Container(
        height: 100,
        width: 100,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color(0xFFFDF5EA),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/$image",
              fit: BoxFit.contain,
              height: 50,
              width: 50,
            ),
            const SizedBox(height: 6),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
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
        const SizedBox(height: 24),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        const SizedBox(height: 12),
        GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: items
              .map((item) =>
                  buildServiceTile(context, item['label']!, item['image']!))
              .toList(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.close, size: 24),
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      'All Services',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
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
