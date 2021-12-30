import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

class SupportCenterPage extends StatefulWidget {
  @override
  _SupportCenterPageState createState() => _SupportCenterPageState();
}

class _SupportCenterPageState extends State<SupportCenterPage> {
  final List<String> _questions = [
    'Làm sao tôi tìm được nhà trọ? ',
    'Làm sao để đăng thông tin trọ?',
    'Tính xác thực của thông tin?',
    'Phương thức thanh toán là gì?',
    'Tôi cần hỗ trợ phải làm sao?',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myColors[BACKGROUND],
      body:
      SingleChildScrollView(
        child: Center(
          child: Container(
            color: myColors[BACKGROUND],
            width: 430,
            height: 900,
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                buildTop(),
                Positioned(
                  top: 300,
                    child: buildContent()
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 140.0),
                  child: Positioned(
                    // top: 0,
                      child: BuildUserSupport()),
                ),
                Positioned(
                  top: 110,
                  child: Container(
                    child: const Material(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      child: TextField(
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          prefixIcon: Icon(Icons.search),
                          hintText: 'Search for Help...',
                          hintStyle: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w500, color: Colors.grey),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    height: 60,
                    width: 300,
                    // color: Colors.red,
                  ),

                ),
                // buildContent(),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget buildTop() => Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 0.0),
            child: Container(
              color: myColors[COLOR_IMAGE],
              width: double.infinity,
              height: 140,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Row(
                  children: [
                    SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0, left: 8),
                        child: Container(
                          height: 40,
                          width: 40,
                          // color: Colors.red,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13.0),
                              color: Colors.white
                          ),
                          child:
                          BackButton(color: Colors.grey,),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 70.0, top: 10),
                      child: Center(
                        child: Text(
                          'Support Center',
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w600,
                              color: Colors.white
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0, left: 55),
                        child: Container(
                          height: 40,
                          width: 40,
                          // color: Colors.red,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13.0),
                              color: Colors.white
                          ),
                          child: const Icon(
                            Icons.notifications,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ]
  );
  Widget BuildUserSupport() => Row(
    children: [
      Expanded(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(80.0),
              ),
              color: myColors[COLOR_USER]
          ),
          height: 150,
          width: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 215,
                // color: Colors.red,
                child: Image.asset(
                    'assets/images/support_user.png',
                    height: 100,
                ),
              ),
              Container(
                width: 190,
                height: 200,

                // color: Colors.red,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                          'Live Chat',
                          style:TextStyle(
                              fontSize: 35,
                              color: Colors.white,
                              fontWeight: FontWeight.w600
                          )
                      ),
                      const Text(
                          'with our Support',
                          style:TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w300
                          )
                      ),
                      SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Container(
                            height: 25,
                            width: 80,
                            // color: Colors.red,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: Colors.white
                            ),
                            child:
                            const Center(child: Text(
                                'Start',
                                style:TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w600
                                )
                              )
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                ),

              ),

            ],
          ),

        ),


      ),
      // //cố gắng positione dc thì sẽ đẩy input search vào
      // SizedBox (
      //     width: double.infinity,
      //     height: double.infinity,
      //     child: Stack(
      //       alignment: Alignment.centerLeft,
      //       children: <Widget>[
      //         Positioned (
      //           left: 100,
      //           top: 70,
      //           child: Container(
      //             width: 200,
      //             height: 100,
      //             color: Colors.green,
      //           ),
      //         )
      //       ],
      //     )
      // )
    ],
  );
  Widget buildContent() => Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(top:30.0, left: 20, right: 20),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13.0),
              color: Colors.white,
          ),
          height: 500,
          width: 380,
          child: Column(
            children:
              _questions.map((question) =>
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: Center(
                        child: Container(
                          height: 50,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding:  const EdgeInsets.only(left: 16.0),
                                  child: Text(
                                      question,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w800
                                        ,
                                      )
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 40.0),
                                  child: SizedBox(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 0),
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        // color: Colors.red,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(18.0),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.purple.withOpacity(0.1),
                                              spreadRadius: 5,
                                              blurRadius: 7,
                                              offset: Offset(0, 3), // changes position of shadow
                                            ),],
                                        ),
                                        child: const Icon(
                                          Icons.arrow_right,
                                          color: Colors.grey,

                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ]

                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13.0),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.purple.withOpacity(0.1),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3), // changes position of shadow
                              ),],
                          ),
                        ),
                      ),

                    ),
                  ),
              ).toList(),
        ),
      )
    )],
  );
}

