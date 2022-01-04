import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:travel_hotel_app/models/hotel_model.dart';
import 'package:travel_hotel_app/provider/motels.dart';

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
        buildTop(),
        Center(

          child: Column(
            children:
            listMotels.isEmpty
                ? [
                    Container(
                      height: 350.0,
                      width: double.infinity,
                      child: const Center(
                        child: Text('Không có phòng trọ bạn đã theo dõi',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Colors.grey
                          ),
                        ),
                      ),
                    )
                  ]
                : listMotels.map((motel) =>
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white,
                  ),
                  child: Slidable(
                    actionPane: SlidableDrawerActionPane(),
                    actionExtentRatio: 0.25,
                    secondaryActions: [
                      IconSlideAction(
                        color: Colors.red,
                        icon: Icons.delete,
                        onTap: ()=>Provider.of<MotelProvider>(context, listen: false).toggleFavoriteMotel(motel),
                      )
                    ],
                    child: ListTile(
                      title:  Padding(
                        padding: const EdgeInsets.only(bottom:10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              // color: Colors.red,
                              width: 170.0,
                              height: 110.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(motel.imageUrl)
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                color: Colors.red,
                              ),
                            ),
                            const SizedBox(
                              width: 20.0,
                            ),
                            Container(
                              height: 110.0,
                              width: 180.0,
                              // color: Colors.red,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    motel.name,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        color: Color.fromRGBO(52, 40, 97, 1) ,
                                        fontWeight: FontWeight.w800
                                    ),
                                  ),
                                   Padding(
                                    padding: EdgeInsets.only(bottom: 18.0),
                                    child: Text(
                                      motel.address,
                                        style: const TextStyle(
                                            fontSize: 13,
                                            color: Colors.grey ,
                                            fontWeight: FontWeight.w800
                                        ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "${oCcy.format(motel.price)} vnđ" ,
                                        style: const TextStyle(
                                            color: Colors.purpleAccent,
                                            fontWeight: FontWeight.w800,
                                            fontSize: 15
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
                )
                ).toList(),
          ),
        ),
      ],
    );
  }
  Widget buildTop() => Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(70.0),
                ),
                color: Color.fromRGBO(73, 63, 113, 1),
              ),
              // color: myColors[COLOR_IMAGE],
              width: double.infinity,
              height: 140,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Center(
                      child: Text('Danh sách theo dõi',style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.w600),
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
}
