import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suprapp/app/core/constants/global_variables.dart';

class TopPicksSection extends StatelessWidget {
  const TopPicksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return
        //  ChangeNotifierProvider(
        //     create: (_) => PopularRestaurantsProvider()
        //       ..fetchPopularRestaurants(
        //           context), // Fetch data when this widget is created
        //     child: Consumer<PopularRestaurantsProvider>(
        //         builder: (context, provider, _) {
        //       // Check if the list of popular restaurants is empty and show a loading indicator
        //       if (provider.popularRestaurants.isEmpty) {
        //         return Center(child: CircularProgressIndicator());
        //       }

        // return
        Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 15),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Top Picks',
                  style: textTheme(
                    context,
                  ).headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold, color: Color(0xff0A0C0B)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // SizedBox(
          //   height: 130,
          //   child: ListView.builder(
          //     scrollDirection: Axis.horizontal,
          //     padding: const EdgeInsets.symmetric(horizontal: 20),
          //     itemCount: provider.popularRestaurants.length,
          //     itemBuilder: (context, index) {
          //       final brand = provider.popularRestaurants[index];
          //       return InkWell(
          //         onTap: () {
          //           Navigator.push(
          //             context,
          //             MaterialPageRoute(
          //               builder: (context) =>
          //                   RestaurentDetailPage(restaurant: brand),
          //             ),
          //           );
          //         },
          //         child: _buildModernBrandCard(
          //           brand.name,
          //           logo: brand.image,
          //         ),
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
    );
    // }));
  }
}

Widget _buildModernBrandCard(
  String name, {
  required String logo,
}) {
  return Container(
    width: 115,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 8,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Column(
      children: [
        Expanded(
          flex: 2,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: Image.network(
              logo,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFFFC8A06),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: Center(
              child: Text(
                name,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
