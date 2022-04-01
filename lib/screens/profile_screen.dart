import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_hotel_app/provider/google_sign_in.provider.dart';
import 'package:travel_hotel_app/provider/user.dart';
import 'package:travel_hotel_app/widgets/header_background.dart';

import 'login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: const [
            HeaderBackground(header: "Hồ sơ người dùng"),
            ProfilePic(),
            SizedBox(height: 40),
            ProfileMenu(
              hintText: 'Họ và tên',
              text: "Hoàng Hữu Tài",
              icon: "assets/images/user.png",
            ),
            ProfileMenu(
              hintText: 'Giới tính',
              text: "Nam",
              icon: "assets/images/male-and-female-signs.png",
            ),
            ProfileMenu(
              hintText: 'Địa chỉ',
              text: "Hải Châu, Đà Nẵng",
              icon: "assets/images/address.png",
            ),
            ProfileMenu(
              hintText: 'Nghề nghiệp',
              text: "Developer",
              icon: "assets/images/job.png",
            ),
            ProfileMenu(
              hintText: 'Số điện thoại',
              text: "0344444215",
              icon: "assets/images/phone.png",
            ),
            Button(),
          ],
        ),
      ),
    );
  }
}

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 115,
        width: 115,
        child: Stack(
          fit: StackFit.expand,
          clipBehavior: Clip.none,
          children: [
            // Text('data'),
            CircleAvatar(
              backgroundImage: AssetImage("assets/images/hoanghon.jpg"),
            ),
            Positioned(
              right: -16,
              bottom: 0,
              child: SizedBox(
                height: 46,
                width: 46,
                child: TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                      side: BorderSide(color: Colors.white),
                    ),
                    primary: Colors.white,
                    backgroundColor: Color(0xFFF5F6F9),
                  ),
                  onPressed: () {},
                  child: const Icon(Icons.camera_alt,
                      color: Colors.black, size: 24.0),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    required this.icon,
    required this.hintText,
  }) : super(key: key);

  final String text, icon, hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      child: Padding(
        child: Container(
          // color: Colors.indigo,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 3,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: Text(
                          hintText,
                          style: const TextStyle(fontSize: 13, color: Colors.black45),
                        ),
                      ),
                      Text(
                        text,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black87,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  // width: double.infinity,
                  child: Image.asset(
                    icon,
                    width: 22,
                    color: Colors.black45,
                  ),
                  padding: EdgeInsets.only(right: 15.0),
                ),
              ],
            ),
          ),
        ),
        padding: const EdgeInsets.all(10.0),
      ),
    );
  }
}

class Button extends StatelessWidget {
  const Button({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 40.0),
      height: 105.0,
      child: ElevatedButton(
        child: const Text(
          "Đăng xuất",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: () {
          Provider.of<UserProvider>(context, listen: false).logout();
          Provider.of<UserProvider>(context, listen: false).facebookLogout();
          Provider.of<GoogleSignInProvider>(context, listen: false).logout();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
        },
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          backgroundColor:
              MaterialStateProperty.all<Color>(Colors.blue.shade900),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          )),
        ),
      ),
    );
  }
}
