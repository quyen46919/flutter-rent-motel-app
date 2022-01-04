import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_hotel_app/models/hotel_model.dart';
import 'package:travel_hotel_app/provider/motels.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    List<Motel> listMotels = Provider.of<MotelProvider>(context).favoriteMotelList;

    return Center(
      child: Column(
        children: listMotels.map((value) =>
            // sửa style tại đây
            Text(value.imageUrl)
        ).toList(),
      ),
    );
  }
}
