import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}
class _ProfilePageState extends State<ProfilePage>{
  get child => null;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      body:
      SingleChildScrollView(
        child: Center(
          child: Container(
            color: myColors[BACKGROUND],
            width: 430,
            child: Column(
              children: <Widget>[
                buildTop(),
                buildContent(),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget buildContent() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(color: Colors.purple[400],),
      const SizedBox(
        child:
        Padding(
          padding: EdgeInsets.only(left: 30.0, bottom: 30.0),
          child: Text("Personal Details", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20, fontFamily: 'RaleWay'),),
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
                        'First Name',
                        style: TextStyle(color: myColors[BASIC_LIGHT], fontSize: 12.0),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 7.0),
                      child: Text(
                        'Hữu Tài',
                        // textScaleFactor: 1,
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 14.0),
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
                        'Last Name',
                        style: TextStyle(color: myColors[BASIC_LIGHT], fontSize: 12.0),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 7.0),
                      child: Text(
                        'Hoàng',
                        // textScaleFactor: 1,
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 14.0),
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
                        const Padding(
                          padding: EdgeInsets.only(left: 7.0),
                          child: Text(
                            'tai47406@donga.edu.vn ',
                            // textScaleFactor: 1,
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 14.0),
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
                        const Padding(
                          padding: EdgeInsets.only(left: 7.0),
                          child: Text(
                            '0344468215',
                            // textScaleFactor: 1,
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 14.0),
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
                        'Gender',
                        style: TextStyle(color: myColors[BASIC_LIGHT], fontSize: 12.0),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 7.0),
                      child: Text(
                        'Female',
                        // textScaleFactor: 1,
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 14.0),
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
                        'Date of Birth',
                        style: TextStyle(color: myColors[BASIC_LIGHT], fontSize: 12.0),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 7.0),
                      child: Text(
                        '06/05/2001',
                        // textScaleFactor: 1,
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 14.0),
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
      const SizedBox(
        child:
        Padding(
          padding: EdgeInsets.only(top:30, left: 30),
          child: Text("Address", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20, fontFamily: 'RaleWay'),),
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
                            'Address',
                            style: TextStyle(color: myColors[BASIC_LIGHT], fontSize: 12.0),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 7.0),
                          child: Text(
                            '158 Lê Lợi, Hải Châu',
                            // textScaleFactor: 1,
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 14.0),
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
                // width: ,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
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
                            'City',
                            style: TextStyle(color: myColors[BASIC_LIGHT], fontSize: 12.0),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 7.0),
                          child: Text(
                            'Đà Nẵng',
                            // textScaleFactor: 1,
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 14.0),
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
                            'Country',
                            style: TextStyle(color: myColors[BASIC_LIGHT], fontSize: 12.0),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 7.0),
                          child: Text(
                            'Việt Nam',
                            // textScaleFactor: 1,
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 14.0),
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
                // width: ,
              ),
            ),
          ],
        ),
      ),
    ],
  );
  Widget buildTop() => Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: Container(
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(10),
              //   color: myColors[COLOR_IMAGE],
              //   border: const Border(
              //     left: BorderSide(
              //       width: 3,
              //
              //     ),
              //   ),
              // ),
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
                      padding: EdgeInsets.only(left: 100.0, top: 10),
                      child: Center(
                        child: Text('About Me',style: TextStyle(fontSize: 28, color: Colors.white),
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
  //

}