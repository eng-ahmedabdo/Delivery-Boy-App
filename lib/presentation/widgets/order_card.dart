import 'package:delevery_boy_app/presentation/widgets/dash_vertical_line.dart';
import 'package:delevery_boy_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 330,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ------------ Title Row ------------
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "New Order Available",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const Text(
                "₹320",
                style: TextStyle(
                  fontSize: 16,
                  color: buttonMainColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Icon(Icons.close, size: 22),
            ],
          ),
          const SizedBox(height: 16),

          // ------------ Product Row ------------
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  "https://mir-s3-cdn-cf.behance.net/projects/404/dbc856216830447.Y3JvcCwxMzA5LDEwMjQsMjUsMA.png",
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Text(
                  "El Marai Zapado  (Normal) × 4",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),
          const Divider(indent: 40, endIndent: 40),
          const SizedBox(height: 8),
          // ------------ Pickup ------------
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  const Icon(Icons.location_on_outlined, color: Colors.red),
                  SizedBox(
                    height: 35,
                    child: DashVerticalLine(dashHeight: 4, dashWidth: 2),
                  ),
                ],
              ),

              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Pickup - El Azay Sharqia - 1.2 km",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "El Oqealy Supermarket",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),

          // ------------ Delivery ------------
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.location_on, color: Colors.red),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Delivery - El Salhia El Zahraa Street - 3.5 km",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Ahmed Abdo",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 18),

          // ------------ Button ------------
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {},
              child: const Text(
                "View order details",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:delevery_boy_app/presentation/widgets/custom_button.dart';
// import 'package:delevery_boy_app/presentation/widgets/dash_vertical_line.dart';
// import 'package:delevery_boy_app/utils/app_colors.dart';
// import 'package:flutter/material.dart';

// class OrderCard extends StatelessWidget {
//   const OrderCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(25),
//         color: Colors.white,
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           // new order available header
//           Container(
//             width: double.infinity,
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//             decoration: BoxDecoration(
//               color: Colors.grey[100],
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(15),
//                 topRight: Radius.circular(15),
//               ),
//             ),
//             child: Row(
//               children: [
//                 Text(
//                   'New Order Available',
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//                 ),
//                 SizedBox(width: 15),
//                 Text(
//                   "<320",
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                     color: buttonMainColor,
//                   ),
//                 ),
//                 Spacer(),
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.pop(context);
//                   },
//                   child: Icon(Icons.close),
//                 ),
//               ],
//             ),
//           ),
//           // order details
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Material(
//                   color: Colors.white,
//                   elevation: 1,
//                   shadowColor: Colors.black26,
//                   child: Row(
//                     children: [
//                       Container(
//                         width: 40,
//                         height: 40,
//                         decoration: BoxDecoration(
//                           color: Colors.brown[100],
//                           borderRadius: BorderRadius.circular(8),
//                           image: DecorationImage(image: NetworkImage('')),
//                         ),
//                       ),
//                       SizedBox(width: 12),
//                       Text.rich(
//                         TextSpan(
//                           style: TextStyle(
//                             fontSize: 15,
//                             fontWeight: FontWeight.w500,
//                           ),
//                           children: [
//                             TextSpan(text: 'Tender Coconut (normal)'),
//                             TextSpan(
//                               text: ' x 4',
//                               style: TextStyle(
//                                 fontWeight: FontWeight.w400,
//                                 color: Colors.black38,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 // Pickup and Delivery
//                 SizedBox(height: 20),
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Column(
//                       children: [
//                         Icon(Icons.radio_button_checked, color: Colors.black54),
//                         SizedBox(
//                           height: 35,
//                           child: DashVerticalLine(dashHeight: 5, dashWidth: 5),
//                         ),
//                       ],
//                     ),
//                     SizedBox(width: 8),
//                     Expanded(
//                       child: pickupAndDeliveryInfo(
//                         'Pickup - ',
//                         'El Azazy - 2nd floor - 12 km for from you',
//                         'Al Okaly Market',
//                       ),
//                     ),
//                     SizedBox(height: 16),
//                     // steps 2: Delivery
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Icon(
//                           Icons.location_on_outlined,
//                           color: buttonMainColor,
//                         ),
//                         SizedBox(width: 8),
//                         Expanded(
//                           child: pickupAndDeliveryInfo(
//                             'Delivery - ',
//                             'Nasr City - 5th settlement - 2.5 km from pickup location',
//                             'Ahmed Abdo',
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 15),
//                     // action buttons
//                     SizedBox(
//                       child: CustomButton(
//                         title: 'View Order Details',
//                         onPressed: () {
//                           //NavigationHelper.navigateTo(context, '/orderDetails');
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Expanded pickupAndDeliveryInfo(title, address, subtitle) {
//     return Expanded(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Expanded(
//                 flex: 3,
//                 child: Text(
//                   title,
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                   style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
//                 ),
//               ),
//               Expanded(
//                 flex: 9,
//                 child: Text(
//                   address,
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                   style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
//                 ),
//               ),
//             ],
//           ),
//           Text(subtitle, style: TextStyle(color: Colors.black38)),
//         ],
//       ),
//     );
//   }
// }
