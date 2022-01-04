import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_hotel_app/provider/user.dart';

const PRIMARY = 'primary';
const SECONDARY = 'secondary';
const BASIC_LIGHT = 'basic_light';
const BASIC_DARK = 'basic_dark';
const BACKGROUND = 'background';
const COLOR_IMAGE = 'color_image';

const Map<String,Color> myColors ={
  PRIMARY: Color.fromRGBO(129, 104, 221, 1),
  SECONDARY: Color.fromRGBO(215, 116, 232,1),
  BASIC_LIGHT: Color.fromRGBO(205, 202, 216, 1),
  BASIC_DARK: Color.fromRGBO(52, 40, 97, 1),
  BACKGROUND: Color.fromRGBO(246, 243, 250, 1),
  COLOR_IMAGE: Color.fromRGBO(73, 63, 113, 1),
};

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}
class _ProfileScreenState extends State<ProfileScreen>{
  get child => null;

  @override
  Widget build(BuildContext context){
    return Consumer<UserProvider>(
        builder: (context, userState, _) {
          var currentUser = userState.currentUser;
          var userFullnameLength = currentUser.fullName.toString().split(" ").length - 1;
          return Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Center(
                child: Container(
                  color: myColors[BACKGROUND],
                  width: 430,
                  child: Column(
                    children: <Widget>[
                      buildTop(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(color: Colors.purple[400],),
                          const SizedBox(
                            child:
                            Padding(
                              padding: EdgeInsets.only(left: 30.0, bottom: 30.0),
                              child: Text(
                                "Thông tin cá nhân",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                    fontFamily: 'RaleWay'),
                              ),
                            ),
                          ),
                          // Flexible( child: Container(color: Colors.purple[100],),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                child:
                                Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child:
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 7.0),
                                          child: Text(
                                            'Họ đệm',
                                            style: TextStyle(color: myColors[BASIC_LIGHT], fontSize: 12.0),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 7.0),
                                          child: Text(
                                            currentUser.fullName
                                                .toString()
                                                .split(" ")
                                                .sublist(0, userFullnameLength)
                                                .join(" "),
                                            // textScaleFactor: 1,
                                            style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 14.0),
                                          ),
                                        ),
                                      ],
                                    )

                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.purple.withOpacity(0.1),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: const Offset(0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                height: 50,
                                width: 180,
                              ),
                              Container(
                                child:
                                Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child:
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 7.0),
                                          child: Text(
                                            'Tên',
                                            style: TextStyle(color: myColors[BASIC_LIGHT], fontSize: 12.0),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 7.0),
                                          child: Text(
                                            currentUser.fullName.toString().split(" ").removeLast(),
                                            // textScaleFactor: 1,
                                            style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 14.0),
                                          ),
                                        ),
                                      ],
                                    )
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.purple.withOpacity(0.1),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                height: 50,
                                width: 180,
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(17.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 17.0),
                                  child: Container(
                                    width: double.infinity,
                                    child:
                                    Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child:
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left: 7.0),
                                              child: Text(
                                                'Email',
                                                style: TextStyle(color: myColors[BASIC_LIGHT], fontSize: 12.0),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 7.0),
                                              child: Text(
                                                currentUser.email.toString(),
                                                // textScaleFactor: 1,
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 14.0
                                                ),
                                              ),
                                            ),
                                          ],
                                        )

                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.purple.withOpacity(0.1),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: const Offset(0, 3), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    height: 50,
                                    // width: ,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    child:
                                    Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child:
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left: 7.0),
                                              child: Text(
                                                'Phone',
                                                style: TextStyle(color: myColors[BASIC_LIGHT], fontSize: 12.0),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 7.0),
                                              child: Text(
                                                currentUser.phone.toString(),
                                                // textScaleFactor: 1,
                                                style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 14.0),
                                              ),
                                            ),
                                          ],
                                        )

                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.purple.withOpacity(0.1),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: const Offset(0, 3), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    height: 50,
                                    // width: ,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                child:
                                Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child:
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 7.0),
                                          child: Text(
                                            'Giới tính',
                                            style: TextStyle(color: myColors[BASIC_LIGHT], fontSize: 12.0),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 7.0),
                                          child: Text(
                                            currentUser.gender.toString(),
                                            // textScaleFactor: 1,
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 14.0
                                            ),
                                          ),
                                        ),
                                      ],
                                    )

                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.purple.withOpacity(0.1),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: const Offset(0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                height: 50,
                                width: 180,
                              ),
                              Container(
                                child:
                                Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child:
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 7.0),
                                          child: Text(
                                            'Ngày sinh',
                                            style: TextStyle(color: myColors[BASIC_LIGHT], fontSize: 12.0),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 7.0),
                                          child: Text(
                                            currentUser.dateOfBirth.toString(),
                                            // textScaleFactor: 1,
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 14.0
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.purple.withOpacity(0.1),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: const Offset(0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                height: 50,
                                width: 180,
                              ),
                            ],
                          ),
                          const SizedBox(
                            child:
                            Padding(
                              padding: EdgeInsets.only(top:30, left: 30),
                              child: Text(
                                "Địa chỉ",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                    fontFamily: 'RaleWay'
                                ),
                              ),
                            )
                            ,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(17.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 17.0),
                                  child: Container(
                                    width: double.infinity,
                                    child:
                                    Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child:
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left: 7.0),
                                              child: Text(
                                                'Nơi ở hiện tại',
                                                style: TextStyle(color: myColors[BASIC_LIGHT], fontSize: 12.0),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 7.0),
                                              child: Text(
                                                currentUser.address.toString(),
                                                // textScaleFactor: 1,
                                                style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 14.0),
                                              ),
                                            ),
                                          ],
                                        )
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.purple.withOpacity(0.1),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: const Offset(0, 3), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    height: 50,
                                    // width: ,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                      child:
                                      Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child:
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(left: 7.0),
                                                child: Text(
                                                  'Thành phố',
                                                  style: TextStyle(color: myColors[BASIC_LIGHT], fontSize: 12.0),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 7.0),
                                                child: Text(
                                                  currentUser.city.toString(),
                                                  // textScaleFactor: 1,
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.w700,
                                                      fontSize: 14.0
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )

                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.purple.withOpacity(0.1),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: const Offset(0, 3), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      height: 50,
                                      width: 180,
                                    ),
                                    Container(
                                      child:
                                      Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child:
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(left: 7.0),
                                                child: Text(
                                                  'Quốc gia',
                                                  style: TextStyle(color: myColors[BASIC_LIGHT], fontSize: 12.0),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 7.0),
                                                child: Text(
                                                  currentUser.country.toString(),
                                                  // textScaleFactor: 1,
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.w700,
                                                      fontSize: 14.0
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.purple.withOpacity(0.1),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: const Offset(0, 3), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      height: 50,
                                      width: 180,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 40.0),
                            height: 110.0,
                            child: ElevatedButton(
                                child: const Text(
                                  "Đăng xuất",
                                  style: TextStyle(color: Colors.white, fontSize: 20),
                                ),
                                onPressed: () {
                                  Navigator.pushNamedAndRemoveUntil(context, '/', ModalRoute.withName('/login'));
                                },
                                style: ButtonStyle(
                                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                  backgroundColor: MaterialStateProperty.all<Color>(const Color.fromRGBO(128, 103, 221, 1)),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      )
                                  ),
                                )
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
    );

  }
  // Widget buildContent() => Column(
  //   crossAxisAlignment: CrossAxisAlignment.start,
  //   mainAxisAlignment: MainAxisAlignment.start,
  //   children: [
  //     Container(color: Colors.purple[400],),
  //     const SizedBox(
  //       child:
  //       Padding(
  //         padding: EdgeInsets.only(left: 30.0, bottom: 30.0),
  //         child: Text(
  //           "Thông tin cá nhân",
  //           style: TextStyle(
  //               fontWeight: FontWeight.w600,
  //               fontSize: 20,
  //               fontFamily: 'RaleWay'),
  //         ),
  //       ),
  //     ),
  //     // Flexible( child: Container(color: Colors.purple[100],),),
  //     Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //       children: <Widget>[
  //         Container(
  //           child:
  //           Padding(
  //               padding: const EdgeInsets.all(8.0),
  //               child:
  //               Column(
  //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Padding(
  //                     padding: const EdgeInsets.only(left: 7.0),
  //                     child: Text(
  //                       'Họ đệm',
  //                       style: TextStyle(color: myColors[BASIC_LIGHT], fontSize: 12.0),
  //                     ),
  //                   ),
  //                   const Padding(
  //                     padding: EdgeInsets.only(left: 7.0),
  //                     child: Text(
  //                       userState,
  //                       // textScaleFactor: 1,
  //                       style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 14.0),
  //                     ),
  //                   ),
  //                 ],
  //               )
  //
  //           ),
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(15),
  //             color: Colors.white,
  //             boxShadow: [
  //               BoxShadow(
  //                 color: Colors.purple.withOpacity(0.1),
  //                 spreadRadius: 5,
  //                 blurRadius: 7,
  //                 offset: Offset(0, 3), // changes position of shadow
  //               ),
  //             ],
  //           ),
  //           height: 50,
  //           width: 180,
  //         ),
  //         Container(
  //           child:
  //           Padding(
  //               padding: const EdgeInsets.all(8.0),
  //               child:
  //               Column(
  //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Padding(
  //                     padding: const EdgeInsets.only(left: 7.0),
  //                     child: Text(
  //                       'Last Name',
  //                       style: TextStyle(color: myColors[BASIC_LIGHT], fontSize: 12.0),
  //                     ),
  //                   ),
  //                   const Padding(
  //                     padding: EdgeInsets.only(left: 7.0),
  //                     child: Text(
  //                       'Hoàng',
  //                       // textScaleFactor: 1,
  //                       style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 14.0),
  //                     ),
  //                   ),
  //                 ],
  //               )
  //           ),
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(15),
  //             color: Colors.white,
  //             boxShadow: [
  //               BoxShadow(
  //                 color: Colors.purple.withOpacity(0.1),
  //                 spreadRadius: 5,
  //                 blurRadius: 7,
  //                 offset: Offset(0, 3), // changes position of shadow
  //               ),
  //             ],
  //           ),
  //           height: 50,
  //           width: 180,
  //         ),
  //       ],
  //     ),
  //     Padding(
  //       padding: const EdgeInsets.all(17.0),
  //       child: Column(
  //         children: [
  //           Padding(
  //             padding: const EdgeInsets.only(bottom: 17.0),
  //             child: Container(
  //               width: double.infinity,
  //               child:
  //               Padding(
  //                   padding: const EdgeInsets.all(8.0),
  //                   child:
  //                   Column(
  //                     mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       Padding(
  //                         padding: const EdgeInsets.only(left: 7.0),
  //                         child: Text(
  //                           'Email',
  //                           style: TextStyle(color: myColors[BASIC_LIGHT], fontSize: 12.0),
  //                         ),
  //                       ),
  //                       const Padding(
  //                         padding: EdgeInsets.only(left: 7.0),
  //                         child: Text(
  //                           'tai47406@donga.edu.vn ',
  //                           // textScaleFactor: 1,
  //                           style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 14.0),
  //                         ),
  //                       ),
  //                     ],
  //                   )
  //
  //               ),
  //               decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(15),
  //                 color: Colors.white,
  //                 boxShadow: [
  //                   BoxShadow(
  //                     color: Colors.purple.withOpacity(0.1),
  //                     spreadRadius: 5,
  //                     blurRadius: 7,
  //                     offset: Offset(0, 3), // changes position of shadow
  //                   ),
  //                 ],
  //               ),
  //               height: 50,
  //               // width: ,
  //             ),
  //           ),
  //           Padding(
  //             padding: const EdgeInsets.only(bottom: 0.0),
  //             child: Container(
  //               width: double.infinity,
  //               child:
  //               Padding(
  //                   padding: const EdgeInsets.all(8.0),
  //                   child:
  //                   Column(
  //                     mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       Padding(
  //                         padding: const EdgeInsets.only(left: 7.0),
  //                         child: Text(
  //                           'Phone',
  //                           style: TextStyle(color: myColors[BASIC_LIGHT], fontSize: 12.0),
  //                         ),
  //                       ),
  //                       const Padding(
  //                         padding: EdgeInsets.only(left: 7.0),
  //                         child: Text(
  //                           '0344468215',
  //                           // textScaleFactor: 1,
  //                           style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 14.0),
  //                         ),
  //                       ),
  //                     ],
  //                   )
  //
  //               ),
  //               decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(15),
  //                 color: Colors.white,
  //                 boxShadow: [
  //                   BoxShadow(
  //                     color: Colors.purple.withOpacity(0.1),
  //                     spreadRadius: 5,
  //                     blurRadius: 7,
  //                     offset: Offset(0, 3), // changes position of shadow
  //                   ),
  //                 ],
  //               ),
  //               height: 50,
  //               // width: ,
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //     Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //       children: <Widget>[
  //         Container(
  //           child:
  //           Padding(
  //               padding: const EdgeInsets.all(8.0),
  //               child:
  //               Column(
  //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Padding(
  //                     padding: const EdgeInsets.only(left: 7.0),
  //                     child: Text(
  //                       'Gender',
  //                       style: TextStyle(color: myColors[BASIC_LIGHT], fontSize: 12.0),
  //                     ),
  //                   ),
  //                   const Padding(
  //                     padding: EdgeInsets.only(left: 7.0),
  //                     child: Text(
  //                       'Female',
  //                       // textScaleFactor: 1,
  //                       style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 14.0),
  //                     ),
  //                   ),
  //                 ],
  //               )
  //
  //           ),
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(15),
  //             color: Colors.white,
  //             boxShadow: [
  //               BoxShadow(
  //                 color: Colors.purple.withOpacity(0.1),
  //                 spreadRadius: 5,
  //                 blurRadius: 7,
  //                 offset: Offset(0, 3), // changes position of shadow
  //               ),
  //             ],
  //           ),
  //           height: 50,
  //           width: 180,
  //         ),
  //         Container(
  //           child:
  //           Padding(
  //               padding: const EdgeInsets.all(8.0),
  //               child:
  //               Column(
  //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Padding(
  //                     padding: const EdgeInsets.only(left: 7.0),
  //                     child: Text(
  //                       'Date of Birth',
  //                       style: TextStyle(color: myColors[BASIC_LIGHT], fontSize: 12.0),
  //                     ),
  //                   ),
  //                   const Padding(
  //                     padding: EdgeInsets.only(left: 7.0),
  //                     child: Text(
  //                       '06/05/2001',
  //                       // textScaleFactor: 1,
  //                       style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 14.0),
  //                     ),
  //                   ),
  //                 ],
  //               )
  //           ),
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(15),
  //             color: Colors.white,
  //             boxShadow: [
  //               BoxShadow(
  //                 color: Colors.purple.withOpacity(0.1),
  //                 spreadRadius: 5,
  //                 blurRadius: 7,
  //                 offset: Offset(0, 3), // changes position of shadow
  //               ),
  //             ],
  //           ),
  //           height: 50,
  //           width: 180,
  //         ),
  //       ],
  //     ),
  //     const SizedBox(
  //       child:
  //       Padding(
  //         padding: EdgeInsets.only(top:30, left: 30),
  //         child: Text("Address", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20, fontFamily: 'RaleWay'),),
  //       )
  //       ,
  //     ),
  //     Padding(
  //       padding: const EdgeInsets.all(17.0),
  //       child: Column(
  //         children: [
  //           Padding(
  //             padding: const EdgeInsets.only(bottom: 17.0),
  //             child: Container(
  //               width: double.infinity,
  //               child:
  //               Padding(
  //                   padding: const EdgeInsets.all(8.0),
  //                   child:
  //                   Column(
  //                     mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       Padding(
  //                         padding: const EdgeInsets.only(left: 7.0),
  //                         child: Text(
  //                           'Address',
  //                           style: TextStyle(color: myColors[BASIC_LIGHT], fontSize: 12.0),
  //                         ),
  //                       ),
  //                       const Padding(
  //                         padding: EdgeInsets.only(left: 7.0),
  //                         child: Text(
  //                           '158 Lê Lợi, Hải Châu',
  //                           // textScaleFactor: 1,
  //                           style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 14.0),
  //                         ),
  //                       ),
  //                     ],
  //                   )
  //               ),
  //               decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(15),
  //                 color: Colors.white,
  //                 boxShadow: [
  //                   BoxShadow(
  //                     color: Colors.purple.withOpacity(0.1),
  //                     spreadRadius: 5,
  //                     blurRadius: 7,
  //                     offset: Offset(0, 3), // changes position of shadow
  //                   ),
  //                 ],
  //               ),
  //               height: 50,
  //               // width: ,
  //             ),
  //           ),
  //           Padding(
  //             padding: const EdgeInsets.only(bottom: 16.0),
  //             child: Container(
  //               width: double.infinity,
  //               child:
  //               Padding(
  //                   padding: const EdgeInsets.all(8.0),
  //                   child:
  //                   Column(
  //                     mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       Padding(
  //                         padding: const EdgeInsets.only(left: 7.0),
  //                         child: Text(
  //                           'City',
  //                           style: TextStyle(color: myColors[BASIC_LIGHT], fontSize: 12.0),
  //                         ),
  //                       ),
  //                       const Padding(
  //                         padding: EdgeInsets.only(left: 7.0),
  //                         child: Text(
  //                           'Đà Nẵng',
  //                           // textScaleFactor: 1,
  //                           style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 14.0),
  //                         ),
  //                       ),
  //                     ],
  //                   )
  //               ),
  //               decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(15),
  //                 color: Colors.white,
  //                 boxShadow: [
  //                   BoxShadow(
  //                     color: Colors.purple.withOpacity(0.1),
  //                     spreadRadius: 5,
  //                     blurRadius: 7,
  //                     offset: Offset(0, 3), // changes position of shadow
  //                   ),
  //                 ],
  //               ),
  //               height: 50,
  //               // width: ,
  //             ),
  //           ),
  //           Padding(
  //             padding: const EdgeInsets.only(bottom: 0.0),
  //             child: Container(
  //               width: double.infinity,
  //               child:
  //               Padding(
  //                   padding: const EdgeInsets.all(8.0),
  //                   child:
  //                   Column(
  //                     mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       Padding(
  //                         padding: const EdgeInsets.only(left: 7.0),
  //                         child: Text(
  //                           'Country',
  //                           style: TextStyle(color: myColors[BASIC_LIGHT], fontSize: 12.0),
  //                         ),
  //                       ),
  //                       const Padding(
  //                         padding: EdgeInsets.only(left: 7.0),
  //                         child: Text(
  //                           'Việt Nam',
  //                           // textScaleFactor: 1,
  //                           style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 14.0),
  //                         ),
  //                       ),
  //                     ],
  //                   )
  //               ),
  //               decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(15),
  //                 color: Colors.white,
  //                 boxShadow: [
  //                   BoxShadow(
  //                     color: Colors.purple.withOpacity(0.1),
  //                     spreadRadius: 5,
  //                     blurRadius: 7,
  //                     offset: Offset(0, 3), // changes position of shadow
  //                   ),
  //                 ],
  //               ),
  //               height: 50,
  //               // width: ,
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   ],
  // );
  Widget buildTop() => Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: Container(
              color: myColors[COLOR_IMAGE],
              width: double.infinity,
              height: 140,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Center(
                    child: Text(
                      'About Me',
                      style: TextStyle(
                          fontSize: 28,
                          color: Colors.white
                      ),
                    ),
                  ),
                ],
              ),

            ),
          ),
        ),
      ]
  );
  //

}