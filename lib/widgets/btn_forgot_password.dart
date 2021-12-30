import 'package:flutter/material.dart';
import 'package:travel_hotel_app/screens/forgot_password_screen.dart';

class Btnforgotpassword extends StatelessWidget {
  final Color _textcolor =  const Color.fromRGBO(68, 58, 79, 1);
  const Btnforgotpassword({
    Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.only(right: 40.0),
      child: TextButton(
        child:  Text(
          'Forgot Password?',
          style: TextStyle(
            fontSize: 17,
            color: _textcolor,
            fontWeight: FontWeight.bold,

          ),
        ),
        onPressed:() {
          Navigator.pushNamed(context, '/ForgotPassword');
        },
      ),
    );
  }
}