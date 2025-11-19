import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CurrentLocationProvider extends ChangeNotifier {
  // Default to San Francisco
  LatLng _currentLocation = LatLng(30.762467562800502, 31.94190050425241);
  bool _isLoading = false;
  String _errorMessage = '';

  // Getter for current location
  LatLng get currentLocation => _currentLocation;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  CurrentLocationProvider() {
    _getCurrentLocation();
  }

  // Main function to fetch current location
  Future<void> _getCurrentLocation() async {
    try {
      //Check if location permission is granted
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          _errorMessage = 'Location permissions are denied';
          _isLoading = false;
          notifyListeners();
          return;
        }
      }
      // Check if location services are enabled
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        _errorMessage = 'Location services are disabled';
        _isLoading = false;
        notifyListeners();
        return;
      }
      // Get the current position
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      _currentLocation = LatLng(position.latitude, position.longitude);
      _isLoading = false;
      _errorMessage = '';
      notifyListeners();
    } catch (e) {
      // Handle any errors that might occur during location fetching
      _errorMessage =
          'Failed to get location: ${e.toString()}. Use default location.';
      _isLoading = false;
      notifyListeners();
    }
  }

  // Public method to manually refresh location (can be called from UI)
  void refreshLocation() {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();
    _getCurrentLocation();
  }
}
