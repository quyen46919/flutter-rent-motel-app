import 'package:flutter/material.dart';

class HeaderBackground extends StatelessWidget {
  final String header;
  const HeaderBackground({ required this.header });

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              height: 140,
              color: const Color.fromRGBO(64, 58, 165, 1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      header,
                      style: const TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]
    );
  }
}
