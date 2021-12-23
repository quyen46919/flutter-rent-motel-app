import 'package:flutter/material.dart';
import 'package:travel_hotel_app/screens/home_screen.dart';
import 'package:travel_hotel_app/screens/profile_page.dart';
import 'package:travel_hotel_app/screens/support_center_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Travel App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF3EBACE),
          colorScheme: ColorScheme.fromSwatch().copyWith(
              secondary: const Color(0xFFD8ECF1),
          ),
        scaffoldBackgroundColor: const Color(0xFFF3F5F7),
      ),
      home: SupportCenterPage(),
    );
  }
}

