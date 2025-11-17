import 'package:delevery_boy_app/presentation/views/app_main_screen.dart';
import 'package:delevery_boy_app/provider/current_location_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CurrentLocationProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Delivery Boy App',
        home: const AppMainScreen(),
      ),
    );
  }
}

