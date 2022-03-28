import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:travel_hotel_app/models/hotel_model.dart';
import 'package:travel_hotel_app/provider/motels.dart';
import 'package:travel_hotel_app/screens/favorite_screen.dart';
import 'package:travel_hotel_app/screens/hotel_detail_screen.dart';

class MasonryGrid extends StatelessWidget {
  const MasonryGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final motels = Provider.of<MotelProvider>(context).getMotelList();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Consumer<MotelProvider>(
          builder: (context, motelState, _) =>
              motelState.motelList.isEmpty
                  ? Container(
                      height: MediaQuery.of(context).size.width - 10,
                      child: const Center(
                        child: Text(
                            "Không có dữ liệu",
                            style: TextStyle(
                              fontSize: 23.0,
                              color: Colors.grey
                            ),
                        ),
                      )
                  )
                  : StaggeredGridView.countBuilder(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    itemCount: motelState.motelList.length,
                    crossAxisCount: 1,
                    itemBuilder: (context, index) => MasonryGridItem(motelState.motelList[index]),
                    staggeredTileBuilder: (_) => const StaggeredTile.fit(1),
                  ),
      ),
    );
  }
}

class MasonryGridItem extends StatelessWidget {
  final Motel motel;
  const MasonryGridItem(this.motel);

  @override
  Widget build(BuildContext context) {
    final oCcy = NumberFormat("#,###", "en_US");

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => HotelDetailScreen(motel)
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200.0,
            width: MediaQuery.of(context).size.width - 20,
            alignment:  Alignment.bottomLeft,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                    image: AssetImage(
                      motel.imageUrl[0],
                    ),
                    fit: BoxFit.cover
                )
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 240.0, bottom: 160.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 30.0,
                    width: 120.0,
                    child: Center(
                      child: Text(
                        '${oCcy.format(motel.price)}đ',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.blue.shade900,
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 5.0),
          Container(
            child: Wrap(
              spacing: 4.0,
              runSpacing: -10.0,
              runAlignment:WrapAlignment.center,
              children: motel.tags.asMap().entries.map((e) => Chip(
                  avatar: Icon(
                    FontAwesomeIcons.star,
                    size: 12.0,
                    color: Colors.blue.shade900,
                  ),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.blue.shade900, width: 1),
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                  label: Text(
                    e.value,
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF3649AE)
                    ),
                  )
              )).toList()

              // [
              //   Chip(
              //       avatar: Icon(
              //         FontAwesomeIcons.star,
              //         size: 14.0,
              //         color: Colors.blue.shade900,
              //       ),
              //       backgroundColor: Colors.white,
              //       padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
              //       shape: RoundedRectangleBorder(
              //           side: BorderSide(color: Colors.blue.shade900, width: 1),
              //           borderRadius: BorderRadius.circular(10.0)
              //       ),
              //       label: const Text(
              //         "Giá tốt",
              //         style: TextStyle(
              //             fontSize: 14,
              //             fontWeight: FontWeight.w600,
              //             color: Color(0xFF3649AE)
              //         ),
              //       )
              //   ),
              //   Chip(
              //       avatar: Icon(
              //         FontAwesomeIcons.star,
              //         size: 14.0,
              //         color: Colors.blue.shade900,
              //       ),
              //       backgroundColor: Colors.white,
              //       padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
              //       shape: RoundedRectangleBorder(
              //           side: BorderSide(color: Colors.blue.shade900, width: 1),
              //           borderRadius: BorderRadius.circular(10.0)
              //       ),
              //       label: const Text(
              //         "Trọ tốt",
              //         style: TextStyle(
              //             fontSize: 14,
              //             fontWeight: FontWeight.w600,
              //             color: Color(0xFF3649AE)
              //         ),
              //       )
              //   ),
              //   Chip(
              //       avatar: Icon(
              //         FontAwesomeIcons.star,
              //         size: 14.0,
              //         color: Colors.blue.shade900,
              //       ),
              //       backgroundColor: Colors.white,
              //       padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
              //       shape: RoundedRectangleBorder(
              //           side: BorderSide(color: Colors.blue.shade900, width: 1),
              //           borderRadius: BorderRadius.circular(10.0)
              //       ),
              //       label: const Text(
              //         "Nhiều tiện ích",
              //         style: TextStyle(
              //             fontSize: 14,
              //             fontWeight: FontWeight.w600,
              //             color: Color(0xFF3649AE)
              //         ),
              //       )
              //   ),
              // ],
            ),
          ),
          const SizedBox(height: 3.0),
          Text(
              '${motel.name} ${motel.address}',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
              color: Colors.blue.shade900
            ),
          ),
          const SizedBox(height: 5.0),
          Text(
            'Đăng tải vào 12/03/2022',
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: Colors.grey.shade500
            ),
          ),
          const SizedBox(height: 10.0),
        ],
      ),
    );
  }
}
