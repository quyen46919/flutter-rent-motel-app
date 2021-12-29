import 'package:flutter/material.dart';

class SocalIcon extends StatelessWidget {
  final icon;
  final Function press;
  final coloricon;
  final colorbox;
  const SocalIcon({
     Key? key,
    this.colorbox,
    required this.icon,
    required this.press,
    this.coloricon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press(),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: colorbox,
          border: Border.all(
            width: 2,
            color: const Color.fromRGBO(1, 1, 1,0),
          ),
          shape: BoxShape.circle,
        ),
        child: icon,
      ),
    );
  }
}
