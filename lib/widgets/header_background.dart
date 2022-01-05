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
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/header-background.png'
                  ),
                  fit: BoxFit.cover,
                ),
              ),
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
