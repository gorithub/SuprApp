import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:suprapp/app/core/constants/app_colors.dart';
import 'package:suprapp/app/core/constants/global_variables.dart';
import 'package:suprapp/app/features/rides/provider/map_provider.dart';
import 'package:suprapp/app/features/rides/widgets/custom_drage_able_bottom_sheet.dart';

class RideHomePage extends StatefulWidget {
  const RideHomePage({super.key});

  @override
  State<RideHomePage> createState() => _RideHomePageState();
}

class _RideHomePageState extends State<RideHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<MapProvider>(
        builder: (context, provider, child) {
          return Stack(
            children: [
              GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: provider.currentPosition ?? const LatLng(0, 0),
                  zoom: 20,
                ),
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                onMapCreated: provider.onMapCreated,
                polylines: provider.polylines,
              ),
              const CustomBottomSheet(),
              Positioned(
                top: 30,
                left: 0,
                right: 0,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Back Button
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.appGrey),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: const Icon(
                          Icons.arrow_back,
                          color: AppColors.darkGrey,
                          size: 20,
                        ),
                      ),
                      const SizedBox(), // Tite
                      Text(
                        'Rides',
                        style: textTheme(context).headlineLarge?.copyWith(
                              color: colorScheme(context).primary,
                              fontWeight: FontWeight.w600,
                            ),
                      ),

                      // Menu Button
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: colorScheme(context).primary,
                          border: Border.all(color: AppColors.appGrey),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: const Icon(
                          Icons.menu,
                          color: Color.fromARGB(255, 20, 188, 96),
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
