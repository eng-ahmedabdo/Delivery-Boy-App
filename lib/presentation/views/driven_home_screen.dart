import 'package:delevery_boy_app/provider/current_location_provider.dart';
import 'package:delevery_boy_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class DrivenHomeScreen extends StatefulWidget {
  const DrivenHomeScreen({super.key});

  @override
  State<DrivenHomeScreen> createState() => _DrivenHomeScreenState();
}

class _DrivenHomeScreenState extends State<DrivenHomeScreen> {
  GoogleMapController? mapController;
  bool isOnline = true;

  //CallBack when map is ready
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  //Create markers for current location on the map
  Set<Marker> _buildMarkers(LatLng currentLocation) {
    return {
      Marker(
        markerId: const MarkerId('current_location'),
        position: currentLocation,
        infoWindow: const InfoWindow(
          title: 'Current Location',
          snippet: 'You are here',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Consumer<CurrentLocationProvider>(
        builder: (context, locationProvider, child) {
          // Show loading indicator while fetching location
          if (locationProvider.isLoading) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 15),
                  Text('Getting your location...'),
                ],
              ),
            );
          }
          // Show error message after permission denied
          if (locationProvider.errorMessage.isNotEmpty) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              showAppSnackbar(
                description: locationProvider.errorMessage,
                type: SnackbarType.error,
                context: context,
              );
            });
          }
          Size screenSize = MediaQuery.of(context).size;
          return Stack(
            children: [
              // Display the Google Map
              GoogleMap(
                onMapCreated: _onMapCreated,
                markers: _buildMarkers(locationProvider.currentLocation),
                initialCameraPosition: CameraPosition(
                  target: locationProvider.currentLocation,
                  zoom: 15.0,
                ),
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                mapType: MapType.normal,
              ),
              if (locationProvider.errorMessage.isEmpty)
                // show order car in the bottom
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text('Hello'),
                  ),
                ),
              // show static online button at the top
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: screenSize.height * 0.12,
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Center(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: 200,
                          height: 38,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.red, width: 2),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Row(children: [
                              //online button
                              Expanded(
                                flex: 2,
                                child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  'ONLINE',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),),
                              Expanded(child: SizedBox(

                              ))
                            ]),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
