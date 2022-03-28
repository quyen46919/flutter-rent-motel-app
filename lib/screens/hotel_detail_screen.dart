import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:travel_hotel_app/models/hotel_model.dart';
import 'package:travel_hotel_app/provider/motels.dart';
import 'package:travel_hotel_app/screens/home_screen_tabs.dart';
import 'package:travel_hotel_app/widgets/mini_map.dart';

class HotelDetailScreen extends StatefulWidget {
  final Motel motel;
  const HotelDetailScreen(this.motel);

  @override
  _HotelDetailScreenState createState() => _HotelDetailScreenState();
}

class _HotelDetailScreenState extends State<HotelDetailScreen> {
  final oCcy = NumberFormat("#,###", "en_US");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<MotelProvider>(
        builder: (context, motelState, _) => ListView(
          children: [
            // Stack(
            //   children: [
            //     Container(
            //       color: const Color(0xff342861),
            //       height: MediaQuery.of(context).size.width - 60,
            //       child: Hero(
            //         tag: widget.motel.imageUrl,
            //         child: ClipRRect(
            //           borderRadius: const BorderRadius.only(
            //               bottomRight: Radius.circular(60.0)
            //           ),
            //           child: Image(
            //               image: AssetImage(
            //                   widget.motel.imageUrl
            //               ),
            //               fit: BoxFit.cover
            //           ),
            //         ),
            //       ),
            //     ),
            //     Padding(
            //       padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           IconButton(
            //             icon: const Icon(Icons.arrow_back),
            //             iconSize: 30.0,
            //             color: Colors.white,
            //             onPressed: () => Navigator.pop(context),
            //           ),
            //           Container(
            //             height: 40.0,
            //             width: 40.0,
            //             child: const Icon(
            //               FontAwesomeIcons.bell,
            //               size: 20.0,
            //             ),
            //             decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(30.0),
            //                 color: Colors.white,
            //                 boxShadow: [
            //                   BoxShadow(
            //                     color: Colors.blue.shade300.withOpacity(0.2),
            //                     spreadRadius: 12,
            //                     blurRadius: 12,
            //                     offset: const Offset(0, 3), // changes position of shadow
            //                   ),
            //                 ]
            //             ),
            //           )
            //         ],
            //       ),
            //     ),
            //     Positioned(
            //         right: 10.0,
            //         bottom: 10.0,
            //         child: Container(
            //           height: 60.0,
            //           width: 60.0,
            //           child: InkWell(
            //             child: Icon(
            //               motelState.favoriteMotelList.where((motel) => motel.id == widget.motel.id).isEmpty
            //                   ? FontAwesomeIcons.bookmark
            //                   : Icons.favorite,
            //               size: 30.0,
            //               color: motelState.favoriteMotelList.where((motel) => motel.id == widget.motel.id).isEmpty
            //                   ? Colors.blue.shade900
            //                   : Colors.white,
            //             ),
            //             onTap: () {
            //               Provider.of<MotelProvider>(context, listen: false).toggleFavoriteMotel(widget.motel);
            //             },
            //           ),
            //           decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(100.0),
            //               color: motelState.favoriteMotelList.where((motel) => motel.id == widget.motel.id).isEmpty
            //                   ? Colors.white
            //                   : Colors.blue.shade900,
            //               // boxShadow: [
            //               //   BoxShadow(
            //               //     color: Colors.blue.shade300.withOpacity(0.2),
            //               //     spreadRadius: 12,
            //               //     blurRadius: 12,
            //               //     offset: const Offset(0, 5), // changes position of shadow
            //               //   ),
            //               // ]
            //           ),
            //         )
            //     ),
            //   ],
            // ),
            // Container(
            //   padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
            //   decoration: const BoxDecoration(
            //       borderRadius: BorderRadius.only(
            //           bottomRight: Radius.circular(50.0)
            //       ),
            //       color: Color(0xff342861),
            //       boxShadow: [
            //         BoxShadow(
            //             color: Colors.black26,
            //             offset: Offset(6.0, 6.0),
            //             blurRadius: 10.0
            //         ),
            //       ]
            //   ),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Expanded(
            //         child: Column(
            //           mainAxisAlignment: MainAxisAlignment.start,
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Text(
            //               widget.motel.name,
            //               overflow: TextOverflow.ellipsis,
            //               style: const TextStyle(
            //                 color: Colors.white,
            //                 fontSize: 26.0,
            //                 fontWeight: FontWeight.w600,
            //                 letterSpacing: 1.2,
            //               ),
            //             ),
            //             const SizedBox(height: 5.0),
            //             Row(
            //               children: [
            //                 const Icon(
            //                   FontAwesomeIcons.locationArrow,
            //                   size: 20.0,
            //                   color: Colors.white,
            //                 ),
            //                 const SizedBox(width: 10.0),
            //                 Text(
            //                   widget.motel.address,
            //                   style: const TextStyle(
            //                     color: Colors.white,
            //                     fontSize: 18.0,
            //                   ),
            //                 ),
            //               ],
            //             ),
            //             const SizedBox(height: 5.0),
            //           ],
            //         ),
            //       ),
            //       const SizedBox(width: 5.0),
            //       Column(
            //         children: [
            //           Text(
            //             oCcy.format(widget.motel.price),
            //             style: const TextStyle(
            //                 color: Colors.white,
            //                 fontSize: 24.0,
            //                 fontWeight: FontWeight.bold
            //             ),
            //           ),
            //           const Text(
            //             'vnd / tháng',
            //             style: TextStyle(
            //                 color: Colors.white,
            //                 fontSize: 20.0,
            //                 fontWeight: FontWeight.bold
            //             ),
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
            // Motel info
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // IconButton(
                //   icon: const Icon(Icons.arrow_back),
                //   iconSize: 20.0,
                //   color: Colors.black26,
                //   onPressed: () => Navigator.pop(context),
                //
                // ),
                // const Text(
                //   'Quay lại trang chủ',
                //   style: TextStyle(
                //     fontSize: 16.0,
                //     color: Colors.black26,
                //   ),
                // )
                ElevatedButton.icon(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Color(0xffc4c4c4),
                    size: 18.0,
                  ),
                  label: const Text(
                    "Quay về trang chủ",
                    style: TextStyle(
                      color: Color(0xffc4c4c4),
                      fontSize: 16.0
                    ),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.transparent),
                    elevation: MaterialStateProperty.all(0.0)
                  ),
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                        const HomeScreenTabs()), (Route<dynamic> route) => false);
                  },
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 0.0),
              child: Text(
                '${widget.motel.name} ${widget.motel.address}',
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.blue.shade900
                ),
              ),
            ),
            const SizedBox(height: 5.0),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 2.0),
              child: Text(
                'Đăng tải vào 12/03/2022',
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.shade500
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
              child: ImageSlideshow(
                width: double.infinity,
                height: 200,
                initialPage: 0,
                indicatorColor: Colors.blue,
                indicatorBackgroundColor: Colors.grey,
                onPageChanged: (value) {},
                autoPlayInterval: 10000,
                isLoop: true,
                children: widget.motel.imageUrl.map((value) =>
                    Image.asset(
                      value,
                      fit: BoxFit.cover,
                    )
                ).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '${oCcy.format(widget.motel.price)}đ / tháng',
                    style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.green.shade700,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                  Expanded(
                    child: Container(
                          width: 100.0,
                          height: 40.0,
                          padding: const EdgeInsets.only(right: 20.0),
                          child: ElevatedButton.icon(
                            icon: const Icon(
                                FontAwesomeIcons.bookmark,
                              size: 16.0,
                            ),
                            label: Text(
                                motelState.favoriteMotelList.where((motel) => motel.id == widget.motel.id).isEmpty
                                    ? "Đang theo dõi" : "Bỏ theo dõi"
                            ),
                            onPressed: () {
                              Provider.of<MotelProvider>(context, listen: false).toggleFavoriteMotel(widget.motel);
                            },
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.blue.shade900),
                                elevation: MaterialStateProperty.all(0.0)
                            ),
                          ),
                          // InkWell(
                          //   child:
                          //   Icon(
                          //     motelState.favoriteMotelList.where((motel) => motel.id == widget.motel.id).isEmpty
                          //         ? FontAwesomeIcons.bookmark
                          //         : Icons.favorite,
                          //     size: 25.0,
                          //     color: motelState.favoriteMotelList.where((motel) => motel.id == widget.motel.id).isEmpty
                          //         ? Colors.blue.shade900
                          //         : Colors.white,
                          //   ),
                          //   onTap: () {
                          //     Provider.of<MotelProvider>(context, listen: false).toggleFavoriteMotel(widget.motel);
                          //   },
                          // ),
                        ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
              child: Row(
                children: [
                  Text(
                      '1. Thông tin phòng trọ',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue.shade900,
                      )
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
              child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue.shade300.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 12,
                                offset: const Offset(0, 3), // changes position of shadow
                              ),
                            ]
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: const Color(0xffF1EEFF),
                              ),
                              child: Icon(
                                FontAwesomeIcons.userAlt,
                                size: 16.0,
                                color: Colors.blue.shade900,
                              ),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                    'Chủ trọ',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffD8D6E0),
                                    )
                                ),
                                const SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                    widget.motel.bossName,
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff342861),
                                    )
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),

                  ]
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
              child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue.shade300.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 12,
                                offset: const Offset(0, 3), // changes position of shadow
                              ),
                            ]
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: const Color(0xffF1EEFF),
                              ),
                              child: Icon(
                                FontAwesomeIcons.phone,
                                size: 16.0,
                                color: Colors.blue.shade900,
                              ),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                    'Số điện thoại',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffD8D6E0),
                                    )
                                ),
                                const SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                    widget.motel.bossPhone,
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff342861),
                                    )
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),

                  ]
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
              child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue.shade300.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 12,
                                offset: const Offset(0, 3), // changes position of shadow
                              ),
                            ]
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: const Color(0xffF1EEFF),
                              ),
                              child: Icon(
                                FontAwesomeIcons.userAlt,
                                size: 16.0,
                                color: Colors.blue.shade900,
                              ),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                    'Diện tích',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffD8D6E0),
                                    )
                                ),
                                const SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                    '${widget.motel.acreage.toString()} m2',
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff342861),
                                    )
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue.shade300.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 12,
                                offset: const Offset(0, 3), // changes position of shadow
                              ),
                            ]
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: const Color(0xffF1EEFF),
                              ),
                              child: Icon(
                                FontAwesomeIcons.landmark,
                                size: 16.0,
                                color: Colors.blue.shade900,
                              ),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                    'Gác lửng',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffD8D6E0),
                                    )
                                ),
                                const SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                    '${widget.motel.mezzanine.toString()} m2',
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff342861),
                                    )
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ]
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
              child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue.shade300.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 12,
                                offset: const Offset(0, 3), // changes position of shadow
                              ),
                            ]
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: const Color(0xffF1EEFF),
                              ),
                              child: Icon(
                                FontAwesomeIcons.peopleArrows,
                                size: 16.0,
                                color: Colors.blue.shade900,
                              ),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                    'Sức chứa',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffD8D6E0),
                                    )
                                ),
                                const SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                    '${widget.motel.maxPeople.toString()} người',
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff342861),
                                    )
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue.shade300.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 12,
                                offset: const Offset(0, 3), // changes position of shadow
                              ),
                            ]
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: const Color(0xffF1EEFF),
                              ),
                              child: Icon(
                                FontAwesomeIcons.handHoldingWater,
                                size: 16.0,
                                color: Colors.blue.shade900,
                              ),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                    'Tiền nước',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffD8D6E0),
                                    )
                                ),
                                const SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                    '${widget.motel.waterPrice.toString()} vnd',
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff342861),
                                    )
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ]
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
              child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue.shade300.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 12,
                                offset: const Offset(0, 3), // changes position of shadow
                              ),
                            ]
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: const Color(0xffF1EEFF),
                              ),
                              child: Icon(
                                FontAwesomeIcons.moneyCheck,
                                size: 16.0,
                                color: Colors.blue.shade900,
                              ),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                      'Đặt cọc',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xffD8D6E0),
                                      )
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                      widget.motel.deposit,
                                      style: const TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff342861),
                                      )
                                  ),
                                ],
                              ),
                            ),
                            // Column(
                            //   crossAxisAlignment: CrossAxisAlignment.start,
                            //   children: [
                            //     const Text(
                            //         'Đặt cọc',
                            //         style: TextStyle(
                            //           fontSize: 16.0,
                            //           fontWeight: FontWeight.bold,
                            //           color: Color(0xffD8D6E0),
                            //         )
                            //     ),
                            //     const SizedBox(
                            //       height: 5.0,
                            //     ),
                            //     Expanded(
                            //       child: Container(
                            //         padding: const EdgeInsets.all(20.0),
                            //         child: Text(
                            //             'ádasdas',
                            //             style: const TextStyle(
                            //               fontSize: 16.0,
                            //               fontWeight: FontWeight.bold,
                            //               color: Color(0xff342861),
                            //             )
                            //         ),
                            //       ),
                            //     ),
                            //   ],
                            // )
                          ],
                        ),
                      ),
                    )
                  ]
              ),
            ),
            // Ban activites
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 5.0),
              child: Row(
                children: [
                  Text(
                      '2. Tiện ích phòng trọ',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue.shade900,
                      )
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
              child: Wrap(
                spacing:8.0,
                runAlignment:WrapAlignment.center,
                runSpacing: 8.0,
                children: [
                  Chip(
                      avatar: Icon(
                        FontAwesomeIcons.wifi,
                        size: 15.0,
                        color: Colors.blue.shade900,
                      ),
                      backgroundColor: const Color(0xFFf2f3f7),
                      padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 12),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)
                      ),
                      label: const Text(
                        "Wifi",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF3649AE)
                        ),
                      )
                  ),
                  Chip(
                      avatar: Icon(
                        FontAwesomeIcons.bicycle,
                        size: 15.0,
                        color: Colors.blue.shade900,
                      ),
                      backgroundColor: const Color(0xFFf2f3f7),
                      padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      label: const Text(
                        "Nhà để xe",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF3649AE)
                        ),
                      )
                  ),
                  Chip(
                      avatar: Icon(
                        FontAwesomeIcons.bed,
                        size: 15.0,
                        color: Colors.blue.shade900,
                      ),
                      backgroundColor: const Color(0xFFf2f3f7),
                      padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      label: const Text(
                        "Giường",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF3649AE)
                        ),
                      )
                  ),
                  Chip(
                      avatar: Icon(
                        FontAwesomeIcons.water,
                        size: 15.0,
                        color: Colors.blue.shade900,
                      ),
                      backgroundColor: const Color(0xFFf2f3f7),
                      padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 12),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)
                      ),
                      label: const Text(
                        "Máy nước nóng",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF3649AE)
                        ),
                      )
                  ),
                  Chip(
                      avatar: Icon(
                        FontAwesomeIcons.hotTub,
                        size: 15.0,
                        color: Colors.blue.shade900,
                      ),
                      backgroundColor: const Color(0xFFf2f3f7),
                      padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 12),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)
                      ),
                      label: const Text(
                        "Bồn tắm",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF3649AE)
                        ),
                      )
                  ),
                  Chip(
                      avatar: Icon(
                        FontAwesomeIcons.trash,
                        size: 15.0,
                        color: Colors.blue.shade900,
                      ),
                      backgroundColor: const Color(0xFFf2f3f7),
                      padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      label: const Text(
                        "Chỗ đổ rác",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF3649AE)
                        ),
                      )
                  ),
                  Chip(
                      avatar: Icon(
                        FontAwesomeIcons.userClock,
                        size: 15.0,
                        color: Colors.blue.shade900,
                      ),
                      backgroundColor: const Color(0xFFf2f3f7),
                      padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      label: const Text(
                        "Giờ giấc tự do",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF3649AE)
                        ),
                      )
                  ),

                  // Motel utilities
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 20.0, 20.0, 0.0),
                    child: Row(
                      children: [
                        Text(
                            '3. Yêu cầu',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.blue.shade900,
                            )
                        )
                      ],
                    ),
                  ),
                  Chip(
                      avatar: Icon(
                        FontAwesomeIcons.smokingBan,
                        size: 15.0,
                        color: Colors.blue.shade900,
                      ),
                      backgroundColor: const Color(0xFFf2f3f7),
                      padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      label: const Text(
                        "Cấm hút thuốc",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF3649AE)
                        ),
                      )
                  ),
                  Chip(
                      avatar: Icon(
                        FontAwesomeIcons.wineBottle,
                        size: 15.0,
                        color: Colors.blue.shade900,
                      ),
                      backgroundColor: const Color(0xFFf2f3f7),
                      padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      label: const Text(
                        "Cấm nhậu nhẹt",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF3649AE)
                        ),
                      )
                  ),
                  Chip(
                      avatar: Icon(
                        FontAwesomeIcons.volumeMute,
                        size: 15.0,
                        color: Colors.blue.shade900,
                      ),
                      backgroundColor: const Color(0xFFf2f3f7),
                      padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      label: const Text(
                        "Cấm làm ồn ban đêm",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF3649AE)
                        ),
                      )
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Row(
                children: [
                  Text(
                      '4. Vị trí',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue.shade900,
                      )
                  )
                ],
              ),
            ),
            Container(
              height: 400.0,
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 30.0, top: 3.0),
              width: MediaQuery.of(context).size.width - 20.0,
              child: MiniMap(
                  latitude: widget.motel.latitude,
                  longtitude: widget.motel.longtitude,
                  title: '${widget.motel.name} ${widget.motel.address}'
              ),
            )
          ],
        ),
      ),
    );
  }
}
