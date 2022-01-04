import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_hotel_app/provider/motels.dart';
import 'package:travel_hotel_app/provider/user.dart';
import 'package:travel_hotel_app/screens/home_screen_tabs.dart';
import 'package:travel_hotel_app/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MotelProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MaterialApp(
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
      ),
    );

  }
}

