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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<MapProvider>(
        builder: (context, provider, child) {
          return Stack(
            children: [
              GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: provider.currentPosition ?? const LatLng(0, 0),
                  zoom: 14,
                ),
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                onMapCreated: provider.onMapCreated,
                polylines: provider.polylines,
              ),
              // Search bar and suggestions
              Positioned(
                top: 50,
                left: 15,
                right: 15,
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Search location',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        ),
                      ),
                      onChanged: (value) {
                        provider.searchPlaces(value);
                      },
                    ),
                    // Suggestions list
                    if (provider.placeSuggestions.isNotEmpty)
                      Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 5,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          constraints: const BoxConstraints(maxHeight: 200),
                          margin: const EdgeInsets.only(top: 5),
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: provider.placeSuggestions.length,
                              itemBuilder: (context, index) {
                                const BouncingScrollPhysics();
                                (context, index) {
                                  final place =
                                      provider.placeSuggestions[index];
                                  return ListTile(
                                    title: Text(
                                      place['name'] ?? 'Unknown Place',
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                    subtitle: Text(
                                      place['formatted_address'] ??
                                          'No address',
                                      style: const TextStyle(
                                          fontSize: 14, color: Colors.grey),
                                    ),
                                    onTap: () {
                                      provider.drawPolyline(place);
                                      provider.clear(); // Clear suggestions
                                    },
                                  );
                                };
                                return null;
                              })),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
