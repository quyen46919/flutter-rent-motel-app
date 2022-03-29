import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:travel_hotel_app/models/hotel_model.dart';
import 'package:travel_hotel_app/provider/motels.dart';
import 'package:travel_hotel_app/screens/hotel_detail_screen.dart';
import 'package:travel_hotel_app/widgets/header_background.dart';

final oCcy = NumberFormat("#,###", "en_US");


class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    List<Motel> listMotels = Provider.of<MotelProvider>(context).favoriteMotelList;
    return ListView(
      children: [
        const HeaderBackground(header: "Danh sách theo dõi"),
        Center(
          child: Column(
            children: listMotels.isEmpty
                ? [
              Container(
                color: const Color(0xffF6F3FA),
                height: 500.0,
                width: double.infinity,
                child: const Center(
                  child: Text(
                    'Không có phòng trọ bạn đã theo dõi',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(64, 58, 165, 1),
                    ),
                  ),
                ),
              )
            ]
                : listMotels.map((motel) =>
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xffF6F3FA),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white,
                      ),
                      child: Slidable(
                        actionPane: const SlidableDrawerActionPane(),
                        actionExtentRatio: 0.25,
                        secondaryActions: [
                          IconSlideAction(
                            color: Colors.red,
                            icon: Icons.delete,
                            onTap: () => Provider.of<MotelProvider>(context, listen: false).toggleFavoriteMotel(motel),
                          )
                        ],
                        child: ListTile(
                          title:  Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => HotelDetailScreen(motel)
                                      ),
                                    );
                                  },
                                  child: Container(
                                    width: 170.0,
                                    height: 120.0,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(motel.imageUrl)
                                      ),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20.0)
                                      ),
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20.0,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 15.0),
                                      Text(
                                        motel.address,
                                        style: const TextStyle(
                                            fontSize: 20,
                                            color: Color.fromRGBO(52, 40, 97, 1) ,
                                            fontWeight: FontWeight.w800
                                        ),
                                      ),
                                      const SizedBox(height: 5.0),
                                      Text(
                                        motel.address,
                                        style: const TextStyle(
                                            fontSize: 13,
                                            color: Colors.grey ,
                                            fontWeight: FontWeight.w800
                                        ),
                                      ),
                                      const SizedBox(height: 15.0),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "${oCcy.format(motel.price)} vnđ" ,
                                            style: const TextStyle(
                                                color: Colors.purpleAccent,
                                                fontSize: 18.0
                                            ),
                                          ), // Padding(
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
            ).toList(),
          ),
        ),
      ],
    );
  }
}
