import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;

class MapProvider with ChangeNotifier {
  LatLng? _currentPosition;
  GoogleMapController? _mapController;
  List<Map<String, dynamic>> _placeSuggestions = [];
  Set<Polyline> _polylines = {};
  final String _apiKey = 'AIzaSyBd3kJD7r1aKzBg7rMrfV2Rys9p9rz_OS0';

  LatLng? get currentPosition => _currentPosition;
  List<Map<String, dynamic>> get placeSuggestions => _placeSuggestions;
  Set<Polyline> get polylines => _polylines;

  MapProvider() {
    _initLocation();
  }

  // Initialize live location
  Future<void> _initLocation() async {
    Location location = Location();
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) return;
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) return;
    }

    LocationData locationData = await location.getLocation();
    _currentPosition = LatLng(locationData.latitude!, locationData.longitude!);
    notifyListeners();
  }

  // Handle map creation
  void onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    if (_currentPosition != null) {
      _mapController?.animateCamera(
        CameraUpdate.newLatLngZoom(_currentPosition!, 14),
      );
    }
  }

  // Search for places using Google Places API
  Future<void> searchPlaces(String query) async {
    if (query.isEmpty) {
      _placeSuggestions = [];
      notifyListeners();
      return;
    }

    final url = Uri.parse(
      'https://maps.googleapis.com/maps/api/place/textsearch/json?query=${Uri.encodeQueryComponent(query)}&key=$_apiKey',
    );

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['status'] == 'OK') {
          _placeSuggestions = List<Map<String, dynamic>>.from(data['results']);
          notifyListeners();
        } else {
          _placeSuggestions = [];
          notifyListeners();
        }
      } else {
        _placeSuggestions = [];
        notifyListeners();
      }
    } catch (e) {
      _placeSuggestions = [];
      notifyListeners();
    }
  }

  // Draw polyline to destination using Google Directions API
  Future<void> drawPolyline(Map<String, dynamic> destination) async {
    if (_currentPosition == null) return;

    final destinationLocation = destination['geometry']['location'];
    final destLat = destinationLocation['lat'];
    final destLng = destinationLocation['lng'];

    final url = Uri.parse(
      'https://maps.googleapis.com/maps/api/directions/json?'
      'origin=${_currentPosition!.latitude},${_currentPosition!.longitude}'
      '&destination=$destLat,$destLng'
      '&mode=driving'
      '&key=$_apiKey',
    );

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['status'] == 'OK') {
          final polylinePoints =
              data['routes'][0]['overview_polyline']['points'];
          final points = _decodePolyline(polylinePoints);

          _polylines = {
            Polyline(
              polylineId: const PolylineId('route'),
              points: points,
              color: Colors.blue,
              width: 5,
            ),
          };

          // Move camera to show both points
          _mapController?.animateCamera(
            CameraUpdate.newLatLngBounds(
              LatLngBounds(
                southwest: LatLng(
                  _currentPosition!.latitude < destLat
                      ? _currentPosition!.latitude
                      : destLat,
                  _currentPosition!.longitude < destLng
                      ? _currentPosition!.longitude
                      : destLng,
                ),
                northeast: LatLng(
                  _currentPosition!.latitude > destLat
                      ? _currentPosition!.latitude
                      : destLat,
                  _currentPosition!.longitude > destLng
                      ? _currentPosition!.longitude
                      : destLng,
                ),
              ),
              100,
            ),
          );

          notifyListeners();
        }
      }
    } catch (e) {
      _polylines = {};
      notifyListeners();
    }
  }

  // Decode polyline points
  List<LatLng> _decodePolyline(String encoded) {
    List<LatLng> points = [];
    int index = 0, len = encoded.length;
    int lat = 0, lng = 0;

    while (index < len) {
      int b, shift = 0, result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlat = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lat += dlat;

      shift = 0;
      result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlng = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lng += dlng;

      points.add(LatLng(lat / 1E5, lng / 1E5));
    }
    return points;
  }

  // Clear suggestions and polylines
  void clear() {
    _placeSuggestions = [];
    _polylines = {};
    notifyListeners();
  }
}
