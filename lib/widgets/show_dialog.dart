import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ShowDiaLog extends StatelessWidget {
  final String message;
  final IconData icon;
  final String navigateType;
  const ShowDiaLog({
    required this.message,
    this.icon = FontAwesomeIcons.key,
    this.navigateType = "pushNamedAndRemoveUntil"
  });

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
    width: MediaQuery.of(context).size.width* 0.8,
    decoration:  BoxDecoration(
        color: Colors.blue.shade900,
        shape: BoxShape.rectangle,
        borderRadius: const BorderRadius.all(Radius.circular(12))
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,        crossAxisAlignment: CrossAxisAlignment.center,
      children:  <Widget>[
        Icon(
          icon,
          color: Colors.white,
          size: 100,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(50, 50, 50, 50),
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width* 0.6,
          height: 70,
          child: ElevatedButton(
              child:  Text(
                "Tôi đã hiểu",
                style: TextStyle(color: Colors.blue.shade900, fontSize: 25, fontWeight: FontWeight.bold),
              ),
              onPressed:() {
                navigateType == 'pushNamedAndRemoveUntil'
                    ? Navigator.pushNamedAndRemoveUntil(context, '/', ModalRoute.withName('/login'))
                    : Navigator.pop(context);
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