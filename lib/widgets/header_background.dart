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
              color: const Color.fromRGBO(73, 63, 113, 1),
              width: double.infinity,
              height: 140,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      header,
                      style: const TextStyle(
                          fontSize: 28,
                          color: Colors.white
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
