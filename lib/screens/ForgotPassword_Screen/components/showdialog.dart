import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_hotel_app/screens/Login_Screen/login_screen.dart';


class ShowDiaLog extends StatelessWidget {
  const ShowDiaLog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16)
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: _buildChild(context),
    );
  }

  _buildChild(BuildContext context) => Container(

    height: 450,
    decoration: const BoxDecoration(
        color:  Color(0xffdd774e8),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(12))
    ),
    child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
      children:  <Widget>[

        const Icon(
          FontAwesomeIcons.key,
          color: Colors.white,
          size: 100,
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(50, 50, 50, 50),
          child: Text(
            'Your password has been reset',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),
          ),
        ),
        SizedBox(
          width: 250,
          height: 70,
          child: ElevatedButton(
              child: const Text(
                "Done",
                style: TextStyle(color: Color(0xffdd774e8), fontSize: 25,),
              ),
              onPressed:() {
                Navigator.pushNamed(context, '/LoginScreen');
              },
              style:
              ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(
                    Colors.black),
                backgroundColor: MaterialStateProperty.all<Color>(
                     Colors.white),
                shape: MaterialStateProperty.all<
                    RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(23),

                    )),
              )
          ),
        ),
      ],
    ),
  );
}