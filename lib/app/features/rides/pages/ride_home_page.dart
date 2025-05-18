import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:suprapp/app/features/rides/provider/map_provider.dart';

class RideHomePage extends StatefulWidget {
  const RideHomePage({super.key});

  @override
  State<RideHomePage> createState() => _RideHomePageState();
}

class _RideHomePageState extends State<RideHomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<MapProvider>(context, listen: false).setCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MapProvider>(context);
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: provider.initialPosition,
          zoom: 14,
        ),
        myLocationEnabled: true,
        onMapCreated: provider.onMapCreated,
      ),
    );
  }
}
