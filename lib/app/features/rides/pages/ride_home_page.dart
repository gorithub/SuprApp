import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:suprapp/app/features/rides/provider/map_provider.dart';
import 'package:suprapp/app/features/rides/widgets/custom_drage_able_bottom_sheet.dart';
import 'package:suprapp/app/features/rides/widgets/nested_bottom_sheets.dart';

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
              Positioned(
                  top: 50,
                  left: 100,
                  child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (_) => CarBottomSheet(),
                        );
                      },
                      child: Icon(Icons.menu))),
              const CustomBottomSheet()
            ],
          );
        },
      ),
    );
  }
}
