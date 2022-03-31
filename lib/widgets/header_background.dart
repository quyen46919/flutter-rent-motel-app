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
              height: 110,
              color:  Colors.white,

              padding: const EdgeInsets.only(bottom: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      header,
                      style: const TextStyle(
                          fontSize: 24,
                          color: Colors.black,
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
