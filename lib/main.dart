import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_hotel_app/provider/google_sign_in.provider.dart';
import 'package:travel_hotel_app/provider/motels.dart';
import 'package:travel_hotel_app/provider/user.dart';
import 'package:travel_hotel_app/screens/facebook_app.dart';
import 'package:travel_hotel_app/screens/home_screen_tabs.dart';
import 'package:travel_hotel_app/screens/login_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb) {
    await Firebase.initializeApp();
  } else {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyC4kt7HYIo_xzUrBMmsMst2pQwZsBfp7nY',
        appId: '1:503718951409:android:fc8ceb6a2525b27f40ac50',
        messagingSenderId: '503718951409',
        projectId: 'chia-se-tro',
      ),
    );
  }

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
        ChangeNotifierProvider(create: (_) => GoogleSignInProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Rent Motel App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: const Color(0xff8168dd),
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: const Color(0xffD774E8),
          ),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.white,
          ),
          scaffoldBackgroundColor: const Color(0xFFFFFFFF),
        ),
        home: const LoginScreen(),
      ),
    );

  }
}

