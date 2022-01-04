import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:travel_hotel_app/models/activity_model.dart';
import 'package:travel_hotel_app/models/hotel_model.dart';
import 'package:travel_hotel_app/provider/motels.dart';

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

    List<Motel> favoritedMotelList = Provider.of<MotelProvider>(context).favoriteMotelList;
    var isFavorited = favoritedMotelList.where((motel) => motel.id == widget.motel).isEmpty;

    return Scaffold(
      body: Consumer<MotelProvider>(
        builder: (context, motelState, _) => ListView(
          children: [
            Stack(
              children: [
                Container(
                  color: const Color(0xff342861),
                  height: MediaQuery.of(context).size.width - 60,
                  child: Hero(
                    tag: widget.motel.imageUrl,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(60.0)
                      ),
                      child: Image(
                          image: AssetImage(
                              widget.motel.imageUrl
                          ),
                          fit: BoxFit.cover
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        iconSize: 30.0,
                        color: Colors.white,
                        onPressed: () => Navigator.pop(context),
                      ),
                      Container(
                        height: 40.0,
                        width: 40.0,
                        child: const Icon(
                          FontAwesomeIcons.bell,
                          size: 20.0,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
                                spreadRadius: 12,
                                blurRadius: 12,
                                offset: const Offset(0, 3), // changes position of shadow
                              ),
                            ]
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                    right: 10.0,
                    bottom: 10.0,
                    child: Container(
                      height: 60.0,
                      width: 60.0,
                      child: InkWell(
                        child: Icon(
                          motelState.favoriteMotelList.where((motel) => motel.id == widget.motel.id).isEmpty
                              ? FontAwesomeIcons.heartBroken
                              : Icons.favorite,
                          size: 30.0,
                          color: motelState.favoriteMotelList.where((motel) => motel.id == widget.motel.id).isEmpty
                              ? Theme.of(context).colorScheme.secondary
                              : Colors.white,
                        ),
                        onTap: () {
                          Provider.of<MotelProvider>(context, listen: false).toggleFavoriteMotel(widget.motel);
                        },
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.0),
                          color: motelState.favoriteMotelList.where((motel) => motel.id == widget.motel.id).isEmpty
                              ? Colors.white
                              : Theme.of(context).colorScheme.secondary,
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
                          //     spreadRadius: 12,
                          //     blurRadius: 12,
                          //     offset: const Offset(0, 5), // changes position of shadow
                          //   ),
                          // ]
                      ),
                    )
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(50.0)
                  ),
                  color: Color(0xff342861),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        offset: Offset(6.0, 6.0),
                        blurRadius: 10.0
                    ),
                  ]
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.motel.name,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 26.0,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(height: 5.0),
                        Row(
                          children: [
                            const Icon(
                              FontAwesomeIcons.locationArrow,
                              size: 20.0,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 10.0),
                            Text(
                              widget.motel.address,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5.0),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        oCcy.format(widget.motel.price),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      const Text(
                        'vnd / tháng',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Motel info
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
              child: Row(
                children: [
                  Text(
                      'Thông tin phòng trọ',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary,
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
                        padding: const EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
                                spreadRadius: 3,
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
                                color: Theme.of(context).primaryColor,
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
                                      fontSize: 14.0,
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
                                      fontSize: 14.0,
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
                        padding: const EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
                                spreadRadius: 3,
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
                                color: Theme.of(context).primaryColor,
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
                                      fontSize: 14.0,
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
                                      fontSize: 14.0,
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
                        padding: const EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
                                spreadRadius: 3,
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
                                color: Theme.of(context).primaryColor,
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
                                      fontSize: 14.0,
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
                                      fontSize: 14.0,
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
                        padding: const EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
                                spreadRadius: 3,
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
                                color: Theme.of(context).primaryColor,
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
                                      fontSize: 14.0,
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
                                      fontSize: 14.0,
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
                        padding: const EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
                                spreadRadius: 3,
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
                                color: Theme.of(context).primaryColor,
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
                                      fontSize: 14.0,
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
                                      fontSize: 14.0,
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
                        padding: const EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
                                spreadRadius: 3,
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
                                color: Theme.of(context).primaryColor,
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
                                      fontSize: 14.0,
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
                                      fontSize: 14.0,
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
                        padding: const EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
                                spreadRadius: 3,
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
                                color: Theme.of(context).primaryColor,
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
                                        fontSize: 14.0,
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
                                        fontSize: 14.0,
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
                            //           fontSize: 14.0,
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
                            //               fontSize: 14.0,
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
                      'Tiện ích phòng trọ',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary,
                      )
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
              child: Flexible(
                child: Wrap(
                  // direction: Axis.vertical,
                  // alignment: WrapAlignment.center,
                  spacing:8.0,
                  runAlignment:WrapAlignment.center,
                  runSpacing: 8.0,
                  children: [
                    Chip(
                        avatar: Icon(
                          FontAwesomeIcons.wifi,
                          size: 16.0,
                          color: Theme.of(context).primaryColor,
                        ),
                        backgroundColor: const Color(0xFFf2f3f7),
                        padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)
                        ),
                        label: const Text(
                          "Wifi",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF3649AE)
                          ),
                        )
                    ),
                    Chip(
                        avatar: Icon(
                          FontAwesomeIcons.bicycle,
                          size: 16.0,
                          color: Theme.of(context).primaryColor,
                        ),
                        backgroundColor: const Color(0xFFf2f3f7),
                        padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        label: const Text(
                          "Nhà để xe",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF3649AE)
                          ),
                        )
                    ),
                    Chip(
                        avatar: Icon(
                          FontAwesomeIcons.bed,
                          size: 16.0,
                          color: Theme.of(context).primaryColor,
                        ),
                        backgroundColor: const Color(0xFFf2f3f7),
                        padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        label: const Text(
                          "Giường",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF3649AE)
                          ),
                        )
                    ),
                    Chip(
                        avatar: Icon(
                          FontAwesomeIcons.water,
                          size: 16.0,
                          color: Theme.of(context).primaryColor,
                        ),
                        backgroundColor: const Color(0xFFf2f3f7),
                        padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)
                        ),
                        label: const Text(
                          "Máy nước nóng",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF3649AE)
                          ),
                        )
                    ),
                    Chip(
                        avatar: Icon(
                          FontAwesomeIcons.hotTub,
                          size: 16.0,
                          color: Theme.of(context).primaryColor,
                        ),
                        backgroundColor: const Color(0xFFf2f3f7),
                        padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)
                        ),
                        label: const Text(
                          "Bồn tắm",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF3649AE)
                          ),
                        )
                    ),
                    Chip(
                        avatar: Icon(
                          FontAwesomeIcons.trash,
                          size: 16.0,
                          color: Theme.of(context).primaryColor,
                        ),
                        backgroundColor: const Color(0xFFf2f3f7),
                        padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        label: const Text(
                          "Chỗ đổ rác",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF3649AE)
                          ),
                        )
                    ),
                    Chip(
                        avatar: Icon(
                          FontAwesomeIcons.userClock,
                          size: 16.0,
                          color: Theme.of(context).primaryColor,
                        ),
                        backgroundColor: const Color(0xFFf2f3f7),
                        padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        label: const Text(
                          "Giờ giấc tự do",
                          style: TextStyle(
                              fontSize: 16,
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
                              'Yêu cầu',
                              style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.secondary,
                              )
                          )
                        ],
                      ),
                    ),
                    Chip(
                        avatar: Icon(
                          FontAwesomeIcons.smokingBan,
                          size: 16.0,
                          color: Theme.of(context).primaryColor,
                        ),
                        backgroundColor: const Color(0xFFf2f3f7),
                        padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        label: const Text(
                          "Cấm hút thuốc",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF3649AE)
                          ),
                        )
                    ),
                    Chip(
                        avatar: Icon(
                          FontAwesomeIcons.wineBottle,
                          size: 16.0,
                          color: Theme.of(context).primaryColor,
                        ),
                        backgroundColor: const Color(0xFFf2f3f7),
                        padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        label: const Text(
                          "Cấm nhậu nhẹt",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF3649AE)
                          ),
                        )
                    ),
                    Chip(
                        avatar: Icon(
                          FontAwesomeIcons.volumeMute,
                          size: 16.0,
                          color: Theme.of(context).primaryColor,
                        ),
                        backgroundColor: const Color(0xFFf2f3f7),
                        padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        label: const Text(
                          "Cấm làm ồn ban đêm",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF3649AE)
                          ),
                        )
                    ),
                    // Container(
                    //   child: Row(
                    //       children: [
                    //         Container(
                    //           width: 40.0,
                    //           height: 40.0,
                    //           decoration: BoxDecoration(
                    //             borderRadius: BorderRadius.circular(10.0),
                    //             color: const Color(0xffF1EEFF),
                    //           ),
                    //           child: Icon(
                    //             FontAwesomeIcons.wifi,
                    //             size: 16.0,
                    //             color: Theme.of(context).primaryColor,
                    //           ),
                    //         ),
                    //         const SizedBox(
                    //           width: 10.0,
                    //         ),
                    //         Text(
                    //             'Wifi',
                    //             style: TextStyle(
                    //               fontSize: 14.0,
                    //               fontWeight: FontWeight.bold,
                    //               color: Theme.of(context).primaryColor,
                    //             )
                    //         ),
                    //       ]
                    //   ) ,
                    // ),
                    // Container(
                    //   child: Row(
                    //       children: [
                    //         Container(
                    //           width: 40.0,
                    //           height: 40.0,
                    //           decoration: BoxDecoration(
                    //             borderRadius: BorderRadius.circular(10.0),
                    //             color: const Color(0xffF1EEFF),
                    //           ),
                    //           child: Icon(
                    //             FontAwesomeIcons.wifi,
                    //             size: 16.0,
                    //             color: Theme.of(context).primaryColor,
                    //           ),
                    //         ),
                    //         const SizedBox(
                    //           width: 10.0,
                    //         ),
                    //         Text(
                    //             'Wifi',
                    //             style: TextStyle(
                    //               fontSize: 14.0,
                    //               fontWeight: FontWeight.bold,
                    //               color: Theme.of(context).primaryColor,
                    //             )
                    //         ),
                    //       ]
                    //   ) ,
                    // ),
                  ],
                ),
              ),
              // child: Wrap(
              //     alignment: WrapAlignment.spaceBetween,
              //     direction: Axis.horizontal,
              //     children: [
              //       Container(
              //         child: Row(
              //             children: [
              //               Container(
              //                 width: 40.0,
              //                 height: 40.0,
              //                 decoration: BoxDecoration(
              //                   borderRadius: BorderRadius.circular(10.0),
              //                   color: const Color(0xffF1EEFF),
              //                 ),
              //                 child: Icon(
              //                   FontAwesomeIcons.wifi,
              //                   size: 16.0,
              //                   color: Theme.of(context).primaryColor,
              //                 ),
              //               ),
              //               const SizedBox(
              //                 width: 10.0,
              //               ),
              //               Text(
              //                   'Wifi',
              //                   style: TextStyle(
              //                     fontSize: 14.0,
              //                     fontWeight: FontWeight.bold,
              //                     color: Theme.of(context).primaryColor,
              //                   )
              //               ),
              //             ]
              //         ) ,
              //       ),
              //       // const SizedBox(width: 10.0),
              //       Container(
              //         child: Row(
              //             children: [
              //               Container(
              //                 width: 40.0,
              //                 height: 40.0,
              //                 decoration: BoxDecoration(
              //                   borderRadius: BorderRadius.circular(10.0),
              //                   color: const Color(0xffF1EEFF),
              //                 ),
              //                 child: Icon(
              //                   FontAwesomeIcons.wifi,
              //                   size: 16.0,
              //                   color: Theme.of(context).primaryColor,
              //                 ),
              //               ),
              //               const SizedBox(
              //                 width: 10.0,
              //               ),
              //               Text(
              //                   'Wifi',
              //                   style: TextStyle(
              //                     fontSize: 14.0,
              //                     fontWeight: FontWeight.bold,
              //                     color: Theme.of(context).primaryColor,
              //                   )
              //               ),
              //             ]
              //         ) ,
              //       ),
              //     ]
              // ),
            ),
            const SizedBox(
              height: 40.0,
            )


            // Expanded(
            //   child: ListView.builder(
            //       padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
            //       itemCount: widget.destination.activities.length,
            //       itemBuilder: (BuildContext context, int index) {
            //         Activity activity = widget.destination.activities[index];
            //         return Stack(
            //           children: [
            //             Container(
            //               margin: const EdgeInsets.fromLTRB(40.0, 5.0, 10.0, 5.0),
            //               height: 170.0,
            //               width: double.infinity,
            //               decoration: BoxDecoration(
            //                 color: Colors.white,
            //                 borderRadius: BorderRadius.circular(20.0),
            //               ),
            //               child: Padding(
            //                 padding: const EdgeInsets.fromLTRB(100.0, 20.0, 20.0, 20.0),
            //                 child: Column(
            //                   mainAxisAlignment: MainAxisAlignment.center,
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   children: [
            //                     Row(
            //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                       crossAxisAlignment: CrossAxisAlignment.start,
            //                       children: [
            //                         Container(
            //                           width: 170.0,
            //                           child: Text(
            //                             activity.name,
            //                             style: const TextStyle(
            //                               fontSize: 20.0,
            //                               fontWeight: FontWeight.w600,
            //                             ),
            //                             maxLines: 2,
            //                             overflow: TextOverflow.ellipsis,
            //                           ),
            //                         ),
            //                         Column(
            //                           children: [
            //                             Text(
            //                               '\$${activity.price}',
            //                               style: const TextStyle(
            //                                 fontSize: 20.0,
            //                                 fontWeight: FontWeight.w600,
            //                               ),
            //                             ),
            //                             const Text(
            //                               'per pax',
            //                               style: TextStyle(
            //                                 color: Colors.grey,
            //                               ),
            //                             ),
            //                           ],
            //                         )
            //                       ],
            //                     ),
            //                     Text(
            //                         activity.type,
            //                         style: const TextStyle(
            //                           color: Colors.grey,
            //                         )
            //                     ),
            //                     _buildRatingStars(activity.rating),
            //                     const SizedBox(height: 10.0),
            //                     Row(
            //                       children: [
            //                         Container(
            //                           padding: const EdgeInsets.all(5.0),
            //                           width: 70.0,
            //                           alignment: Alignment.center,
            //                           decoration: BoxDecoration(
            //                             color: Theme.of(context).primaryColor,
            //                             borderRadius: BorderRadius.circular(10.0),
            //                           ),
            //                           child: Text(
            //                             activity.startTimes[0],
            //                             style: const TextStyle(
            //                               color: Colors.white,
            //                             ),
            //                           ),
            //                         ),
            //                         const SizedBox(width: 10.0),
            //                         Container(
            //                           padding: const EdgeInsets.all(5.0),
            //                           width: 70.0,
            //                           alignment: Alignment.center,
            //                           decoration: BoxDecoration(
            //                             color: Theme.of(context).primaryColor,
            //                             borderRadius: BorderRadius.circular(10.0),
            //                           ),
            //                           child: Text(
            //                             activity.startTimes[1],
            //                             style: const TextStyle(
            //                               color: Colors.white,
            //                             ),
            //                           ),
            //                         ),
            //                       ],
            //                     )
            //                   ],
            //                 ),
            //               ),
            //             ),
            //             Positioned(
            //               top: 15.0,
            //               left: 15.0,
            //               bottom: 15.0,
            //               child: ClipRRect(
            //                 borderRadius: BorderRadius.circular(20.0),
            //                 child: Image(
            //                   width: 110.0,
            //                   image: AssetImage(
            //                       activity.imageUrl
            //                   ),
            //                   fit: BoxFit.cover,
            //                 ),
            //               ),
            //             )
            //           ],
            //         );
            //       }
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
