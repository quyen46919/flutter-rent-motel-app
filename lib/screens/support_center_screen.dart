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
  PRIMARY: Color.fromRGBO(104, 106, 221, 1),
  SECONDARY: Color.fromRGBO(116, 126, 232,1),
  BASIC_LIGHT: Color.fromRGBO(205, 202, 216, 1),
  BASIC_DARK: Color.fromRGBO(52, 40, 97, 1),
  BACKGROUND: Color.fromRGBO(205, 208, 247, 1),
  COLOR_IMAGE: Color.fromRGBO(73, 63, 113, 1),
  COLOR_USER: Color.fromRGBO(89, 100, 219, 1),
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
      backgroundColor: const Color(0xfff3f5fa),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeaderBackground(header: "Hỗ trợ"),
            const SizedBox(height: 20.0),
            Container(
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
            )
          ],
        )
      ),
    );
  }
}

