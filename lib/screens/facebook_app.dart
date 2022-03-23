import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:travel_hotel_app/screens/home_detail_screen.dart';
import 'package:travel_hotel_app/screens/home_screen_tabs.dart';

void main() {
  runApp(FacebookApp());
}

class FacebookApp extends StatefulWidget {
  const FacebookApp({Key? key}) : super(key: key);

  @override
  _FacebookAppState createState() => _FacebookAppState();
}

class _FacebookAppState extends State<FacebookApp> {
  Map? _userData;

  void _logInWithFacebook() async {
    try {
      // final result = await FacebookAuth.instance.login();
      // final userData = await FacebookAuth.instance.getUserData();
      //
      // // final facebookLoginWithCredential = FacebookAuthPro
      // await FirebaseFirestore
      final result = await FacebookAuth.i.login(
          permissions: ["public_profile", "email"]
      );
      if (result.status == LoginStatus.success){
        final requestData = await FacebookAuth.i.getUserData(
            fields: "email, name"
        );

        setState(() {
          _userData = requestData;
        });
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => const HomeScreen()),
                (route) => false);
      }
    }  on Exception catch (e) {
      print('Login failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Facebook (Logged '+ (_userData == null ? 'out' : 'in')+')'),
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () async {},
                  child: Text( 'log in')
              ),
              ElevatedButton(onPressed: () async {
                await FacebookAuth.i.logOut();
                setState(() {
                  _userData = null;
                });
              }, child: Text( 'log out')),
            ],
          ),
        ),
      ),
    );
  }
}
