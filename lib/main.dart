import 'package:flutter/material.dart';
import 'package:travel_hotel_app/screens/Login_Screen/login_screen.dart';
import 'package:travel_hotel_app/screens/home_screen.dart';
import 'package:travel_hotel_app/screens/profile_page.dart';
import 'package:travel_hotel_app/screens/suport_center_extend_page.dart';
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
      title: 'Flutter Rent Motel App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xff8168dd),
        colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: const Color(0xffD774E8),
        ),
        scaffoldBackgroundColor: const Color(0xFFFFFFFF),
      ),
      home: const LoginScreen(),
    );
  }
}

