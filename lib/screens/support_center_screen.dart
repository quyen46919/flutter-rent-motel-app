import 'dart:ui';

import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_hotel_app/widgets/collapse.dart';
import 'dart:collection';

import 'package:travel_hotel_app/widgets/header_background.dart';

const PRIMARY = 'primary';
const SECONDARY = 'secondary';
const BASIC_LIGHT = 'basic_light';
const BASIC_DARK = 'basic_dark';
const BACKGROUND = 'background';
const COLOR_IMAGE = 'color_image';
const COLOR_USER = 'color_user';
const COLOR_TEXT = 'color_text';
const Map<String,Color> myColors ={
  PRIMARY: Color.fromRGBO(129, 104, 221, 1),
  SECONDARY: Color.fromRGBO(215, 116, 232,1),
  BASIC_LIGHT: Color.fromRGBO(205, 202, 216, 1),
  BASIC_DARK: Color.fromRGBO(52, 40, 97, 1),
  BACKGROUND: Color.fromRGBO(235, 205, 247, 1),
  COLOR_IMAGE: Color.fromRGBO(73, 63, 113, 1),
  COLOR_USER: Color.fromRGBO(217, 89, 219, 1),
  COLOR_TEXT: Color.fromRGBO(157, 138, 228, 1),
};

class SupportCenterScreen extends StatefulWidget {
  const SupportCenterScreen({Key? key}) : super(key: key);

  @override
  _SupportCenterScreenState createState() => _SupportCenterScreenState();
}

class _SupportCenterScreenState extends State<SupportCenterScreen> {
  final List<String> _questions = [
    'Làm sao tôi tìm được nhà trọ? ',
    'Làm sao để đăng thông tin trọ?',
    'Tính xác thực của thông tin?',
    'Phương thức thanh toán là gì?',
    'Tôi cần hỗ trợ phải làm sao?',
  ];

  final List<String> _answers = [
    'A Flutter widget that can be expanded or collapsed by clicking on a header or an icon. A Flutter widget that can be expanded or collapsed by clicking on a header or an icon.?',
    'A Flutter widget that can be expanded or collapsed by clicking on a header or an icon. A Flutter widget that can be expanded or collapsed by clicking on a header or an icon.?',
    'A Flutter widget that can be expanded or collapsed by clicking on a header or an icon. A Flutter widget that can be expanded or collapsed by clicking on a header or an icon.?',
    'A Flutter widget that can be expanded or collapsed by clicking on a header or an icon. A Flutter widget that can be expanded or collapsed by clicking on a header or an icon.?',
    'A Flutter widget that can be expanded or collapsed by clicking on a header or an icon. A Flutter widget that can be expanded or collapsed by clicking on a header or an icon.?',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myColors[BACKGROUND],
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeaderBackground(header: "Hỗ trợ"),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0)
                ),
                child: Column(
                  children: _questions.asMap().entries.map((e) {
                    return Collapse(
                      header: _questions[e.key],
                      collapse: _answers[e.key],
                      expanded: _answers[e.key],
                    );
                  }).toList(),
                ),
              ),
            )
          ],
        )
      ),
    );
  }
  // Widget BuildUserSupport() => Row(
  //   children: [
  //     Expanded(
  //       child: Container(
  //         decoration: BoxDecoration(
  //             borderRadius: const BorderRadius.only(
  //               bottomRight: Radius.circular(80.0),
  //             ),
  //             color: myColors[COLOR_USER]
  //         ),
  //         height: 150,
  //         width: double.infinity,
  //         child: Row(
  //           crossAxisAlignment: CrossAxisAlignment.end,
  //           mainAxisAlignment: MainAxisAlignment.start,
  //           children: [
  //             Container(
  //               width: 215,
  //               child: Image.asset(
  //                   'assets/images/support_user.png',
  //                   height: 100,
  //               ),
  //             ),
  //             Container(
  //               width: 190,
  //               height: 200,
  //
  //               // color: Colors.red,
  //               child: Padding(
  //                 padding: const EdgeInsets.only(bottom: 10.0),
  //                 child: Column(
  //                   mainAxisAlignment: MainAxisAlignment.end,
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     const Text(
  //                         'Live Chat',
  //                         style:TextStyle(
  //                             fontSize: 35,
  //                             color: Colors.white,
  //                             fontWeight: FontWeight.w600
  //                         )
  //                     ),
  //                     const Text(
  //                         'with our Support',
  //                         style:TextStyle(
  //                             fontSize: 20,
  //                             color: Colors.white,
  //                             fontWeight: FontWeight.w300
  //                         )
  //                     ),
  //                     SizedBox(
  //                       child: Padding(
  //                         padding: const EdgeInsets.only(top: 20),
  //                         child: Container(
  //                           height: 25,
  //                           width: 80,
  //                           // color: Colors.red,
  //                           decoration: BoxDecoration(
  //                               borderRadius: BorderRadius.circular(15.0),
  //                               color: Colors.white
  //                           ),
  //                           child:
  //                           const Center(child: Text(
  //                               'Start',
  //                               style:TextStyle(
  //                                   fontSize: 16,
  //                                   color: Colors.grey,
  //                                   fontWeight: FontWeight.w600
  //                               )
  //                             )
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   ],
  // );
}

