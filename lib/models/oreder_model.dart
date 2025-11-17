import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrderModel {
  final String id;
  final String customerName;
  final String customerPhone;
  final String item;
  final int quantity;
  final int price;  
  final LatLng pickupLocation;
  final LatLng deleviryLocation;
  final String pickedAddress;
  final String deliveryAddress;

  OrderModel({
    required this.id,
    required this.customerName,
    required this.customerPhone,
    required this.item,
    required this.quantity,
    required this.price,
    required this.pickupLocation,
    required this.deleviryLocation,
    required this.pickedAddress,
    required this.deliveryAddress,
  });
}
