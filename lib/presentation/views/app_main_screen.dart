import 'package:delevery_boy_app/presentation/views/driven_home_screen.dart';
import 'package:delevery_boy_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppMainScreen extends StatefulWidget {
  const AppMainScreen({super.key});

  @override
  State<AppMainScreen> createState() => _AppMainScreenState();
}

class _AppMainScreenState extends State<AppMainScreen> {
  // initially display the index of the pages list
   int _currentIndex = 0;

   final List<Widget> _pages = [
    const DrivenHomeScreen(),
    Center(child: Text('Orders Screen')),
    Center(child: Text('Shipment Screen')),
    Center(child: Text('Profile Screen')),
  ];

  final List<IconData> _icons = [
    FontAwesomeIcons.house,
    FontAwesomeIcons.boxOpen,
    FontAwesomeIcons.truckFast,
    FontAwesomeIcons.solidCircleUser,
  ];

  final List<String> _labels = ['Home', 'Orders', 'Shipment', 'Profile'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(bottom: 20, top: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              offset: const Offset(0, -1),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(_icons.length, (index) {
            final bool isSelected =
                _currentIndex == index; // Placeholder for selection logic
            return GestureDetector(
              onTap: () {
                setState(() {
                  _currentIndex = index;
                });
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 6,
                    ),
                    decoration: isSelected
                        ? BoxDecoration(
                            color: buttonSecondaryColor,
                            borderRadius: BorderRadius.circular(15),
                          )
                        : null,
                    child: Icon(
                      _icons[index],
                      color: isSelected ? buttonMainColor : Colors.black,
                      size: 18,
                    ),
                  ),
                  Text(
                    _labels[index],
                    style: TextStyle(
                      color: isSelected ? buttonMainColor : Colors.black,
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
