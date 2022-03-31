// import 'dart:ui';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// const PRIMARY = 'primary';
// const SECONDARY = 'secondary';
// const BASIC_LIGHT = 'basic_light';
// const BASIC_DARK = 'basic_dark';
// const BACKGROUND = 'background';
// const COLOR_IMAGE = 'color_image';
// const COLOR_USER = 'color_user';
// const COLOR_TEXT = 'color_text';
// const COLOR_SUPPORT = 'color_support';
// const Map<String,Color> myColors ={
//   PRIMARY: Color.fromRGBO(129, 104, 221, 1),
//   SECONDARY: Color.fromRGBO(215, 116, 232,1),
//   BASIC_LIGHT: Color.fromRGBO(205, 202, 216, 1),
//   BASIC_DARK: Color.fromRGBO(52, 40, 97, 1),
//   BACKGROUND: Color.fromRGBO(235, 205, 247, 1),
//   COLOR_IMAGE: Color.fromRGBO(73, 63, 113, 1),
//   COLOR_USER: Color.fromRGBO(217, 89, 219, 1),
//   COLOR_TEXT: Color.fromRGBO(157, 138, 228, 1),
//   COLOR_SUPPORT: Color.fromRGBO(240, 240, 252, 1),
// };
//
// class SupportCenterExtendPage extends StatefulWidget {
//   @override
//   _SupportCenterExtendPageState createState() => _SupportCenterExtendPageState();
// }
//
// class _SupportCenterExtendPageState extends State<SupportCenterExtendPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue.shade50,
//       body:
//       Center(
//         child: Container(
//           color: Colors.blue.shade50,
//           // color: Colors.white,
//           width: 430,
//           height: double.infinity,
//           child: Stack(
//             alignment: Alignment.topCenter,
//             children: <Widget>[
//               Row(
//                   children: [
//                     Expanded(
//                       child: Padding(
//                         padding: const EdgeInsets.only(bottom: 0.0),
//                         child: Container(
//                           color: myColors[COLOR_IMAGE],
//                           width: double.infinity,
//                           height: 170,
//                           child: Padding(
//                             padding: const EdgeInsets.only(bottom: 20.0),
//
//                             child: Row(
//                               children: [
//                                 SizedBox(
//                                   child: Padding(
//                                     padding: const EdgeInsets.only(top: 8.0, left: 8),
//                                     child: Container(
//                                       height: 40,
//                                       width: 40,
//                                       // color: Colors.red,
//                                       decoration: BoxDecoration(
//                                           borderRadius: BorderRadius.circular(13.0),
//                                           color: Colors.white
//                                       ),
//                                       child:
//                                       BackButton(color: Colors.grey,),
//                                     ),
//                                   ),
//                                 ),
//                                 const Padding(
//                                   padding: EdgeInsets.only(left: 70.0, top: 10),
//                                   child: Center(
//                                     child: Text('Support Center',style: TextStyle(fontSize: 28,fontWeight: FontWeight.w600, color: Colors.white),
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   child: Padding(
//                                     padding: const EdgeInsets.only(top: 8.0, left: 55),
//                                     child: Container(
//                                       height: 40,
//                                       width: 40,
//                                       // color: Colors.red,
//                                       decoration: BoxDecoration(
//                                           borderRadius: BorderRadius.circular(13.0),
//                                           color: Colors.white
//                                       ),
//                                       child: const Icon(
//                                         Icons.notifications,
//                                         color: Colors.grey,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ]
//               ),
//               Positioned(
//                 top: 130,
//                 child: Container(
//                   child: const Material(
//                     borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                     child: TextField(
//                       decoration: InputDecoration(
//                         fillColor: Colors.white,
//                         prefixIcon: Icon(Icons.search),
//                         hintText: 'Search for Help...',
//                         hintStyle: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w500, color: Colors.grey),
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                           borderSide: BorderSide(color: Colors.white),
//                           ),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                           borderSide: BorderSide(color: Colors.white),
//                         ),
//                       ),
//                     ),
//                   ),
//                     height: 60,
//                     width: 300,
//                     // color: Colors.red,
//                 ),
//
//               ),
//               Positioned(
//                 top: 150,
//                 child: buildContent(),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget buildTextField() => const TextField(
//     decoration: InputDecoration(
//       border: OutlineInputBorder(),
//     ),
//
//   );
//
//   Widget BuildUserSupport() => Row(
//     children: [
//       Expanded(
//         child: Container(
//           decoration: BoxDecoration(
//               borderRadius: const BorderRadius.only(
//                 bottomRight: Radius.circular(80.0),
//               ),
//               color: Colors.blue.shade900,
//           ),
//           height: 150,
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Container(
//                 width: 215,
//                 // color: Colors.red,
//                 child: Image.asset(
//                   'assets/images/support_user.png',
//                   height: 100,
//                 ),
//               ),
//               Container(
//                 width: 190,
//                 height: 200,
//
//                 // color: Colors.red,
//                 child: Padding(
//                   padding: const EdgeInsets.only(bottom: 10.0),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text('Live Chat', style:TextStyle(fontSize: 35, color: Colors.white, fontWeight: FontWeight.w600)),
//                       const Text('with our Support',style:TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w300)),
//                       SizedBox(
//                         child: Padding(
//                           padding: const EdgeInsets.only(top: 20),
//                           child: Container(
//                             height: 25,
//                             width: 80,
//                             // color: Colors.red,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(15.0),
//                                 color: Colors.white
//                             ),
//                             child:
//                             const Center(child: Text('Start', style:TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w600))),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//
//                 ),
//
//               ),
//
//             ],
//           ),
//
//         ),
//       ),
//     ],
//   );
//
//   Widget buildContent() => Column(
//     children: [
//       Padding(
//         padding: const EdgeInsets.only(top:60.0, left: 40, right: 40),
//         child: Container(
//
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(13.0),
//             color: myColors[COLOR_SUPPORT],
//           ),
//           height: 450,
//           width: 380,
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 16.0),
//                 child: SizedBox(
//                   width: double.infinity,
//                   child: Center(
//                     child: Container(
//                       height: 50,
//                       child: Center(
//                         child: Text(
//                             'Who are Intrepid tralvellers?', style:TextStyle(fontSize: 25, color: myColors[COLOR_TEXT], fontWeight: FontWeight.w800 ,)
//                         ),
//                       ),
//                       decoration: const BoxDecoration(
//                         borderRadius: BorderRadius.only(
//                           topRight: Radius.circular(13),
//                           topLeft: Radius.circular(13),
//                         ),
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 8.0 ),
//                 child: SizedBox(
//                   width: double.infinity,
//                   child: Center(
//                     child: Column(
//                       children: [
//                         Container(
//                           height: 250,
//                           width: double.infinity,
//                           child: const Padding(
//                             padding:  EdgeInsets.only(top: 16.0,left: 30.0, right: 30.0),
//                             child: Text('You can build apps with Flutter using any text editor combined with our command-line tools. However, we recommend using one of our editor plugins for an even better experience. These plugins provide you with code completion, syntax highlighting, widget editing assists, run & debug support, and more.',
//
//                               textAlign: TextAlign.justify,
//                               style: TextStyle( fontSize: 19, fontWeight: FontWeight.w500, color: Colors.grey),
//                                 ),
//                           )
//                           ,
//                         ),
//                         Container(
//                           color: Colors.transparent,
//                           height: 100,
//                           width: double.infinity,
//                           child: const Padding(
//                             padding:  EdgeInsets.only(left: 30.0, right: 30.0),
//                             child: Text('These plugins provide you with code completion, syntax highlighting, widget editing assists, run & debug support, and more.',
//
//                               textAlign: TextAlign.justify,
//                               style: TextStyle( fontSize: 19, fontWeight: FontWeight.w500, color: Colors.grey),
//                             ),
//                           )
//                           ,
//
//                         ),
//                       ],
//                     ),
//                   ),
//
//                 ),
//               ),
//             ],
//           ),
//
//         ),
//       )
//     ],
//   );
// }
//
